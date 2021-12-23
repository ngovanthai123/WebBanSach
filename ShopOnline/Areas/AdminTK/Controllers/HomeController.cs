﻿using ShopOnline.Libs;
using ShopOnline.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;

using System.Web.Mvc;


namespace ShopOnline.Areas.AdminTK.Controllers
{
	public class HomeController : Controller
	{
		private ShopOnlineEntities db = new ShopOnlineEntities();

		public ActionResult Index()
		{
			var t = db.Sach.Where(r => r.SoLuong > 0);
			return View(t);
		}
		public ActionResult Logout()
		{
			// Xóa SESSION
			Session.RemoveAll();

			// Quay về trang chủ
			return RedirectToAction("Index", "Home");
		}

		// GET: Home/Login
		public ActionResult LoginTK()
		{
			ModelState.AddModelError("LoginError", "");
			return View();
		}

		// POST: Home/Login
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult LoginTK(ThuKhoLogin thuKho)
		{
			if (ModelState.IsValid)
			{
				string matKhauMaHoa = SHA1.ComputeHash(thuKho.MatKhau);
				var taiKhoan = db.ThuKho.Where(r => r.TenDangNhap == thuKho.TenDangNhap && r.MatKhau == matKhauMaHoa).SingleOrDefault();

				if (taiKhoan == null)
				{
					ModelState.AddModelError("LoginError", "Tên đăng nhập hoặc mật khẩu không chính xác!");
					return View(thuKho);
				}
				else
				{
					// Đăng ký SESSION
					Session["MaThuKho"] = taiKhoan.ID;
					Session["HoTenThuKho"] = taiKhoan.HoVaTen;
					Session["TenDangNhap"] = taiKhoan.TenDangNhap;

					// Quay về trang chủ
					return RedirectToAction("Index", "Home");
				}
			}

			return View(thuKho);
		}
		public ActionResult ChangePassword()
		{
			return View();
		}


		// POST: Home/Login
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult ChangePassword(ChangePasswordTK khachHang)
		{

			if (ModelState.IsValid)
			{

				string matKhauCu = SHA1.ComputeHash(khachHang.MatKhauCu);
				string matKhauMoi = SHA1.ComputeHash(khachHang.MatKhauMoi);
				string xacnhanmatkhau = SHA1.ComputeHash(khachHang.XacNhanMatKhau);
				string tendangnhap = Session["TenDangNhap"].ToString();
				var taiKhoan = db.KhachHang.Where(r => r.TenDangNhap == tendangnhap && r.MatKhau == matKhauCu).SingleOrDefault();

				if (taiKhoan == null)
				{
					ModelState.AddModelError("ChangePassword", "Tên đăng nhập hoặc mật khẩu không chính xác!");
					return View(khachHang);
				}
				else
				{
					if (matKhauMoi == xacnhanmatkhau)
					{
						taiKhoan.MatKhau = matKhauMoi;
						taiKhoan.XacNhanMatKhau = matKhauMoi;
						db.Entry(taiKhoan).State = EntityState.Modified;
						db.SaveChanges();
						ModelState.AddModelError("ChangePasswordSucess", "Đổi mật khẩu thành công");
						return View(khachHang);
					}
				}
			}
			return RedirectToAction("Index", "Home");
		}
		[HttpPost]
		public ActionResult Search(FormCollection collection)
		{
			// contains chứa
			string text_search = collection["TuKhoa"].ToString();

			var baikiem_search = db.Sach.Where(r => r.SoLuong > 1 && (r.TenSach.Contains(text_search))).ToList();
			return View(baikiem_search);
		}

		public ActionResult MuaNhieuNhat()
		{
			var ShopPhone = db.DatHang_ChiTiet.Where(r => r.SoLuong > 0).OrderByDescending(r => r.SoLuong).ToList();
			var MuaNhieuNhat = (from sp in db.Sach
								join chitiet in db.DatHang_ChiTiet on sp.ID equals chitiet.Sach_ID
								where (chitiet.SoLuong > 0)
								select new SachModel()
								{
									TenSach = sp.TenSach,
									HinhAnhBia = sp.HinhAnhBia,
									DonGia = sp.DonGia,
									ID = sp.ID,
									SoLuong = chitiet.SoLuong
								}).OrderByDescending(chitiet => chitiet.SoLuong).ToList();

			return View(MuaNhieuNhat);
		}
	}
}
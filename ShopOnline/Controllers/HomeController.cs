using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopOnline.Libs;
using ShopOnline.Models;
using PagedList;

namespace ShopOnline.Controllers
{
    public class HomeController : Controller
    {

        private ShopOnlineEntities db = new ShopOnlineEntities();

        /* public ActionResult Index()
         {
             var t = db.Sach.Where(r => r.SoLuong > 0);
             return View(t);
         }*/

        /*public ActionResult Index(string searchString, string movieGenre)
        {
            ViewData["CurrentFilter"] = searchString;
            var GenreLst = new List<string>();
            var GenreQry = from d in db.LoaiSach
                           select d.TenLoai;
            ViewBag.sp = GenreQry;
            ViewBag.loaisp = movieGenre;
            GenreLst.AddRange(GenreQry.Distinct());
            ViewBag.movieGenre = new SelectList(GenreLst);
            var sanpham = from m in db.Sach
                          select m;


            if (!string.IsNullOrEmpty(movieGenre) && movieGenre != "All")
            {
                sanpham = sanpham.Where(x => x.LoaiSach.TenLoai == movieGenre);

            }
            return View(sanpham);
        }
*/
        /*public ActionResult Index(int? page)
        {
            var t = db.Sach.Where(r => r.SoLuong > 0);
            

            // 1. Tham số int? dùng để thể hiện null và kiểu int
            // page có thể có giá trị là null và kiểu int.

            // 2. Nếu page = null thì đặt lại là 1.
            if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo LinkID mới có thể phân trang.
            var links = (from l in db.Sach
                         select l).OrderBy(x => x.ID);

            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            int pageSize = 4;

            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);

            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(links.ToPagedList(pageNumber, pageSize));
        }*/
        [HttpGet]
        public ActionResult Index(int? size, int? page)
        {
            var t = db.Sach.Where(r => r.SoLuong > 0);

            // Bạn có thể thêm bớt tùy ý --- dammio.com
            List<SelectListItem> items = new List<SelectListItem>();
            items.Add(new SelectListItem { Text = "4", Value = "4" });
            items.Add(new SelectListItem { Text = "8", Value = "8" });
            items.Add(new SelectListItem { Text = "12", Value = "12" });
            items.Add(new SelectListItem { Text = "16", Value = "16" });
            items.Add(new SelectListItem { Text = "40", Value = "40" });
            items.Add(new SelectListItem { Text = "160", Value = "160" });

            // 1.1. Giữ trạng thái kích thước trang được chọn trên DropDownList
            foreach (var item in items)
            {
                if (item.Value == size.ToString()) item.Selected = true;
            }

            // 1.2. Tạo các biến ViewBag
            ViewBag.size = items; // ViewBag DropDownList
            ViewBag.currentSize = size; // tạo biến kích thước trang hiện tại

            // 2. Nếu page = null thì đặt lại là 1.
            page = page ?? 1; //if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo LinkID mới có thể phân trang.
            var books = db.Sach.Include(b => b.NhaXuatBan).Include(b => b.LoaiSach).OrderBy(b => b.ID);
            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            // 4. Tạo kích thước trang (pageSize), mặc định là 5.
            int pageSize = (size ?? 4);

            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);

            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(books.ToPagedList(pageNumber, pageSize));
        }



        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult ChiTiet(int id)
        {
            var t = db.Sach.Where(r => r.SoLuong > 0 && r.ID == id).SingleOrDefault();
            return View(t);
        }

        public ActionResult Logout()
        {
            // Xóa SESSION
            Session.RemoveAll();

            // Quay về trang chủ
            return RedirectToAction("Index", "Home");
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

        // GET: Home/Login
        public ActionResult Login()
        {
            ModelState.AddModelError("LoginError", "");
            return View();
        }

        // POST: Home/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(KhachHangLogin khachHang)
        {
            if (ModelState.IsValid)
            {
                string mahoamatkhau = SHA1.ComputeHash(khachHang.MatKhau);
                var taiKhoan = db.KhachHang.Where(r => r.TenDangNhap == khachHang.TenDangNhap && r.MatKhau == mahoamatkhau).SingleOrDefault();

                if (taiKhoan == null)
                {
                    ModelState.AddModelError("LoginError", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                    return View(khachHang);
                }
                else
                {
                    // Đăng ký SESSION
                    Session["MaKhachHang"] = taiKhoan.ID;
                    Session["HoTenKhachHang"] = taiKhoan.HoVaTen;
                    Session["TenDangNhap"] = taiKhoan.TenDangNhap;

                    // Quay về trang chủ
                    return RedirectToAction("Index", "Home");
                }
            }

            return View(khachHang);
        }

        // GET: Home/Login
        public ActionResult LoginGioHang()
        {
            ModelState.AddModelError("LoginError", "");
            return View();
        }

        // POST: Home/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LoginGioHang(KhachHangLogin khachHang)
        {
            if (ModelState.IsValid)
            {
                string mahoamatkhau = SHA1.ComputeHash(khachHang.MatKhau);
                var taiKhoan = db.KhachHang.Where(r => r.TenDangNhap == khachHang.TenDangNhap && r.MatKhau == mahoamatkhau).SingleOrDefault();

                if (taiKhoan == null)
                {
                    ModelState.AddModelError("LoginError", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                    return View(khachHang);
                }
                else
                {
                    // Đăng ký SESSION
                    Session["MaKhachHang"] = taiKhoan.ID;
                    Session["HoTenKhachHang"] = taiKhoan.HoVaTen;
                    Session["TenDangNhap"] = taiKhoan.TenDangNhap;

                    // Quay về trang chủ
                    return RedirectToAction("Index", "GioHang");
                }
            }

            return View(khachHang);
        }

        public ActionResult XacNhanMuaHang()
        {
            if (Session["MaKhachHang"] == null)
            {
                return RedirectToAction("LoginGioHang", "Home");
            }

            else
            {
                return View();
            }
        }

        public ActionResult DonHangCuaToi()
        {
            int makh = Convert.ToInt32(Session["MaKhachHang"]);
            var DonHangCuaToi = (from sp in db.Sach
                                 join chitiet in db.DatHang_ChiTiet on sp.ID equals chitiet.Sach_ID
                                 join dhang in db.DatHang on chitiet.DatHang_ID equals dhang.ID
                                 join kh in db.KhachHang on dhang.KhachHang_ID equals kh.ID
                                 where (kh.ID == makh)

                                 select new DonHangCuaToi()
                                 {
                                     TenSach = sp.TenSach,
                                     HinhAnhBia = sp.HinhAnhBia,
                                     DonGia = chitiet.DonGia,
                                     ID = kh.ID,
                                     SoLuong = chitiet.SoLuong,
                                     NgayDatHang = dhang.NgayDatHang,
                                     TinhTrang=dhang.TinhTrang

                                 }).OrderByDescending(dhang => dhang.NgayDatHang).ToList();

            return View(DonHangCuaToi);
        }

        public ActionResult TimKiem(FormCollection collection)
        {
            string tukhoa = collection["TuKhoa"].ToString();
            var sp = db.Sach.Where(r => r.TenSach.Contains(tukhoa) || r.NhaXuatBan.TenNhaXuatBan.Contains(tukhoa));
            return View(sp);
        }

        // POST: Home/Pay
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult XacNhanMuaHang(DatHang DatHang)
        {
            if (ModelState.IsValid)
            {
                // Lưu vào bảng dathang
                DatHang dh = new DatHang();
                dh.DiaChiGiaoHang = DatHang.DiaChiGiaoHang;
                dh.DienThoaiGiaoHang = DatHang.DienThoaiGiaoHang;
                dh.NgayDatHang = DateTime.Now;
                dh.KhachHang_ID = Convert.ToInt32(Session["MaKhachHang"]);
                dh.TinhTrang = 0;
                db.DatHang.Add(dh);
                db.SaveChanges();

                // Lưu vào bảng DatHang_ChiTiet
                List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
                foreach (var item in cart)
                {
                    DatHang_ChiTiet chitiet = new DatHang_ChiTiet();
                    chitiet.DatHang_ID = dh.ID;
                    chitiet.Sach_ID = item.sAch.ID;
                    chitiet.SoLuong = Convert.ToInt16(item.soLuongTrongGio);
                    chitiet.DonGia = item.sAch.DonGia;
                    db.DatHang_ChiTiet.Add(chitiet);

                    var s = db.Sach.Find(item.sAch.ID);
                    s.SoLuong = (s.SoLuong) - item.soLuongTrongGio;
                    db.SaveChanges();
                }

                // Xóa giỏ hàng
                cart.Clear();

                // Quay về trang chủ
                return RedirectToAction("Index", "Home");
            }

            return View(DatHang);
        }

        public ActionResult DangKy()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy(KhachHang kh)
        {
            if (ModelState.IsValid)
            {
                var check = db.KhachHang.FirstOrDefault(r => r.TenDangNhap == kh.TenDangNhap);
                var kt = db.KhachHang.FirstOrDefault(r => r.Email == kh.Email);
                if (check == null || kt==null)
                {
                    kh.MatKhau = SHA1.ComputeHash(kh.MatKhau);
                    kh.XacNhanMatKhau = SHA1.ComputeHash(kh.XacNhanMatKhau);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.KhachHang.Add(kh);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.error = "Tên đăng nhập đã tồn tại !!!";
                    return View();
                }
            }
            return View();
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePassword khachHang)
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


        /* public ActionResult MyOders()
         {
             int makh = Convert.ToInt32(Session["MaKhachHang"].ToString());
             var dh = db.DatHang_ChiTiet.Where(r => r.DatHang.KhachHang_ID == makh && r.DatHang.TinhTrang != 3).ToList();
             return View(dh);
         }*/
        [HttpPost]
        public ActionResult Search(FormCollection collection)
        {
            // contains chứa
            string text_search = collection["TuKhoa"].ToString();

            var baikiem_search = db.Sach.Where(r => r.SoLuong > 1 && (r.TenSach.Contains(text_search))).ToList();
            return View(baikiem_search);
        }
    }
}

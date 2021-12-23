using ShopOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class TruyenTranhController : Controller
    {
        // GET: TruyenTranh
        private ShopOnlineEntities db = new ShopOnlineEntities();
        public ActionResult Index()
        {
            var dress = db.Sach
                   .Where(sp => sp.LoaiSach_ID == 4);
            return View(dress);
        }
    }
}
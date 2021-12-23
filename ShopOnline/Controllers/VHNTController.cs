using ShopOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class VHNTController : Controller
    {
        private ShopOnlineEntities db = new ShopOnlineEntities();

        // GET: VHNT
        public ActionResult Index()
        {
            var dress = db.Sach
                   .Where(sp => sp.LoaiSach_ID == 2);
            return View(dress);
        }
    }
}
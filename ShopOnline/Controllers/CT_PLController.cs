using ShopOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class CT_PLController : Controller
    {
        private ShopOnlineEntities db = new ShopOnlineEntities();

        // GET: CT_PL
        public ActionResult Index()
        {
            var dress = db.Sach
                   .Where(sp => sp.LoaiSach_ID == 1);
            return View(dress);
        }
    }
}
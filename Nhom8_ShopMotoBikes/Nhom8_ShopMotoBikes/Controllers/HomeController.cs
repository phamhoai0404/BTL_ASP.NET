using Nhom8_ShopMotoBikes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Controllers
{
    public class HomeController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        public ActionResult Index()
        {
            var hangs = db.Hangs.Select(n => n);
            return View(hangs);
        }

    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom8_ShopMotoBikes.Models;

using PagedList;

namespace Nhom8_ShopMotoBikes.Controllers
{
    public class HangsController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        // GET: Hangs
        public ActionResult Index()
        {
            var hangs = db.Hangs.Include(h => h.DanhMuc);
            return View(hangs.ToList());
        }

        // GET: Hangs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hang hang = db.Hangs.Find(id);
            if (hang == null)
            {
                return HttpNotFound();
            }
            return View(hang);
        }

        public ActionResult Timkiem(string keyword, int? page)
        {
            if (keyword == null)
            {
                keyword = "";
            }
            ViewBag.TukhoaTimkiem = keyword;
            var hangs = db.Hangs.Where(p => p.TenHang.Contains(keyword)).OrderByDescending(p => p.MaHang);
            

            int pageSizeFix = 8; //Kích thước trang
            int pageNumber = (page ?? 1);

            return View(hangs.ToPagedList(pageNumber, pageSizeFix));

           
        }

    }
}

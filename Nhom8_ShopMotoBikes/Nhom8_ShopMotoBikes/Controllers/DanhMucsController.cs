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
    public class DanhMucsController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        // GET: DanhMucs/Details/5
        public ActionResult Details(int? id, int? page)
        {
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                return Redirect("/NotFound/Index");
            }
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                //return HttpNotFound();
                return Redirect("/NotFound/Index");
            }
            var hangs = db.Hangs.Where(p => p.DanhMuc.MaDM == id).OrderByDescending(p => p.MaHang);
            ViewBag.DanhMuc = danhMuc;

            int pageSizeFix = 8; //Kích thước trang
            int pageNumber = (page ?? 1);

            return View(hangs.ToPagedList(pageNumber, pageSizeFix));
           
        }

        
    }
}

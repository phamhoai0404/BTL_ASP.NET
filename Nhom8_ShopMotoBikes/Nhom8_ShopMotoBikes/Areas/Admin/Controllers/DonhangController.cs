using Nhom8_ShopMotoBikes.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Areas.Admin.Controllers
{
    public class DonhangController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        // GET: Admin/DonHangs
        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var donHangs = db.DonHangs.Select(h => h).OrderBy(p => p.MaDH);
                int pageSizeFix = 6; //Kích thước trang
                int pageNumber = (page ?? 1);

                return View(donHangs.ToPagedList(pageNumber, pageSizeFix));
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // GET: Admin/DonHangs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Donhang/Index");
                }

                DonHang donHang = db.DonHangs.Find(id);

                if (donHang == null)
                {
                    return Redirect("/Admin/Donhang/Index");
                }

                List<ChiTietDonHang> chiTietDonHangByID = db.ChiTietDonHangs.Where(p => p.MaDH == id).ToList();
                List<Hang> dsHang = new List<Hang>();

                foreach (var item in chiTietDonHangByID)
                {
                    Hang sp = db.Hangs.Where(p => p.MaHang == item.MaHang).SingleOrDefault();
                    dsHang.Add(sp);
                }

                ViewBag.SanPhams = dsHang;
                ViewBag.ChiTietDH = chiTietDonHangByID;

                return View(donHang);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        
        // GET: Admin/DonHangs/Edit/5
        public ActionResult Edit(int? id)
        {

            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Donhang/Index");
                }
                DonHang donHang = db.DonHangs.Find(id);
                if (donHang == null)
                {
                    return Redirect("/Admin/Donhang/Index");
                }


                List<string> tinhtrangDH = new List<string>
                {
                      "Đang giao", "Đã giao",  "Đã huỷ"
                };
                ViewBag.TinhTrangDH = tinhtrangDH;

               
                ViewBag.MaTK = new SelectList(db.TaiKhoans, "MaTK", "HoTen", donHang.MaTK);
                return View(donHang);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDH,NgayDat,DiaChiGiaoHang,TinhTrangDH,TongTien,MaTK")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                //Lấy tình trạng đơn hàng
                string tinhTrang = Request["TinhTrang"];
                donHang.TinhTrangDH = int.Parse(tinhTrang);

                db.Entry(donHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
          
            ViewBag.MaTK = new SelectList(db.TaiKhoans, "MaTK", "HoTen", donHang.MaTK);
            return View(donHang);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
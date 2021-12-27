using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom8_ShopMotoBikes.Models;
using PagedList;

namespace Nhom8_ShopMotoBikes.Areas.Admin.Controllers
{
    public class SanphamController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        // GET: Admin/Hangs
        public ActionResult Index(int? page)
        {
            if (Session["admin"] != null)
            {
                var hangs = db.Hangs.Select(h => h).OrderBy(p => p.MaHang); ;

                int pageSizeFix = 6; //Kích thước trang
                int pageNumber = (page ?? 1);

                return View(hangs.ToPagedList(pageNumber, pageSizeFix));
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }

        }

        // GET: Admin/Hangs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Sanpham/Index");
                }
                Hang hang = db.Hangs.Find(id);
                if (hang == null)
                {
                    return Redirect("/Admin/Sanpham/Index");
                }
                return View(hang);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // GET: Admin/Hangs/Create
        [HttpGet]
        public ActionResult Create()
        {
            if (Session["admin"] != null)
            {
                ViewBag.MaDM = new SelectList(db.DanhMucs, "MaDM", "TenDM");
                return View();
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Hang hang)
        {
           try
             {
                 if (ModelState.IsValid)
                 { 
                     hang.Anh = null;
                     var f = Request.Files["ImageFilesss"];
                     if (f != null && f.ContentLength > 0)
                     {
                         string FileName = System.IO.Path.GetFileName(f.FileName);
                         string UploadPath = Server.MapPath("~/wwwroot/img/sanpham/" + FileName);

                         f.SaveAs(UploadPath);

                         hang.Anh = FileName;
                     }
                     db.Hangs.Add(hang);
                     db.SaveChanges();
                 }
                return RedirectToAction("Index");

            }
             catch (Exception ex)
            {
                 ViewBag.MaDM = new SelectList(db.DanhMucs, "MaDM", "TenDM");
                 ViewBag.ErrorCreateHang = "Có lỗi xảy ra ! " + ex.Message;
                 return View(hang);
            }
        }



        // GET: Admin/Hangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {

                if (id == null)
                {
                    return Redirect("/Admin/Sanpham/Index");
                }
                Hang hang = db.Hangs.Find(id);
                if (hang == null)
                {
                    return Redirect("/Admin/Sanpham/Index");
                }

                ViewBag.MaDM = new SelectList(db.DanhMucs, "MaDM", "TenDM", hang.MaDM);
                return View(hang);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHang,MaDM,TenHang,ThuongHieu,LoaiXe,GiaTien,MoTaHang,MauSac,SoLuong,Anh")] Hang hang)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var f = Request.Files["ImageFilesss"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/img/sanpham/" + FileName);

                        f.SaveAs(UploadPath);

                        hang.Anh = FileName;
                    }
                    db.Entry(hang).State = EntityState.Modified;
                    db.SaveChanges();
                    
                }
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ErrorEditHang = "Lỗi sửa sản phẩm!";
                ViewBag.MaDM = new SelectList(db.DanhMucs, "MaDM", "TenDM");
                return View(hang);
                
            }
        }



        // GET: Admin/Hangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Sanpham/Index");
                }
                Hang hang = db.Hangs.Find(id);
                if (hang == null)
                {
                    return Redirect("/Admin/Sanpham/Index");
                }
                return View(hang);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // POST: Admin/Hangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Hang hang = db.Hangs.Find(id);
            try
            {
                db.Hangs.Remove(hang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.ErrorDeleteHang = "Lỗi không xóa được sản phẩm! ";
                return View("Delete", hang);
            }
          
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
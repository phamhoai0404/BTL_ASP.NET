using System;
using System.Collections.Generic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom8_ShopMotoBikes.Models;
namespace Nhom8_ShopMotoBikes.Areas.Admin.Controllers
{
    public class DanhmucSanphamController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        // GET: Admin/DanhMucs
        public ActionResult Index()
        {
            if (Session["admin"] != null)
            {
                TaiKhoan taiKhoan = Session["admin"] as TaiKhoan;
                return View(db.DanhMucs.ToList());
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // GET: Admin/DanhMucs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/DanhmucSanpham/Index");
                }
                DanhMuc danhMuc = db.DanhMucs.Find(id);
                if (danhMuc == null)
                {
                    return Redirect("/Admin/DanhmucSanpham/Index");
                }
                return View(danhMuc);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // GET: Admin/DanhMucs/Create
        public ActionResult Create()
        {
            if (Session["admin"] != null)
            {
                return View();
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDM,TenDM,MoTa")] DanhMuc danhMuc)
        {
            if (ModelState.IsValid)
            {
                var danhMucCheck = db.DanhMucs.Where(tk => tk.TenDM == danhMuc.TenDM);
                if (danhMucCheck.Count() == 0)
                {
                    db.DanhMucs.Add(danhMuc);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.ErrorCreateDanhMuc = "Tên danh mục này đã tồn tại !";
                return View("Create", danhMuc);
            }
            return View(danhMuc);
        }

        // GET: Admin/DanhMucs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/DanhmucSanpham/Index");
                }
                DanhMuc danhMuc = db.DanhMucs.Find(id);
                if (danhMuc == null)
                {
                    return Redirect("/Admin/DanhmucSanpham/Index");
                }
                return View(danhMuc);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDM,TenDM,MoTa")] DanhMuc danhMuc)
        {
            if (ModelState.IsValid)
            {
                var danhMucCheck = db.DanhMucs.Where(tk => tk.TenDM == danhMuc.TenDM && tk.MaDM != danhMuc.MaDM);
                if (danhMucCheck.Count() == 0)//Nghĩa là nó có thể bằng chính nó ấy
                {
                    db.Entry(danhMuc).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.ErrorEditDanhMuc = "Tên danh mục này đã tồn tại!";
                return View("Edit", danhMuc);
            }
            return View(danhMuc);
        }

        // GET: Admin/DanhMucs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {

                if (id == null)
                {
                    return Redirect("/Admin/DanhmucSanpham/Index");
                }
                DanhMuc danhMuc = db.DanhMucs.Find(id);
                if (danhMuc == null)
                {
                    return Redirect("/Admin/DanhmucSanpham/Index");
                }
                return View(danhMuc);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // POST: Admin/DanhMucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DanhMuc danhMuc = db.DanhMucs.Find(id);

            try
            {
                db.DanhMucs.Remove(danhMuc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ErrorDeleteDanhMuc = "Lỗi không xóa được danh mục! ";
                return View("Delete", danhMuc);
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
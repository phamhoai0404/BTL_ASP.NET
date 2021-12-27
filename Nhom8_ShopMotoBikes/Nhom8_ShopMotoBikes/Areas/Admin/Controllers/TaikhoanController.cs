using Nhom8_ShopMotoBikes.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Areas.Admin.Controllers
{
    public class TaikhoanController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        // GET: Admin/TaiKhoans
        public ActionResult Index()
        {
            if (Session["admin"] != null)
            {
                var taiKhoans = db.TaiKhoans.Select(s=>s).ToList();

                TaiKhoan admin = Session["admin"] as TaiKhoan;
                int idAdmin = admin.MaTK;

                for (int i = 0; i < taiKhoans.Count(); i++)
                {
                    if (taiKhoans[i].MaTK == idAdmin)
                    {
                        taiKhoans.Remove(taiKhoans[i]);
                        break;
                    }
                }

                return View(taiKhoans);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }

        }

        public JsonResult ThayDoiTrangThai(int? id)
        {
            TaiKhoan user = db.TaiKhoans.Find(id);
            if (user == null)
            {
                return Json("NOT_FOUND", JsonRequestBehavior.AllowGet);
            }

            user.TrangThai = !user.TrangThai;

            db.Configuration.ValidateOnSaveEnabled = false;
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();

            return Json("SUCCESS", JsonRequestBehavior.AllowGet);

        }






        // GET: Admin/TaiKhoans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["admin"] != null)
            {
                if (id == null)
                {
                    return Redirect("/Admin/Taikhoan/Index");
                }
                TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
                if (taiKhoan == null)
                {
                    return Redirect("/Admin/Taikhoan/Index");
                }


                List<string> cacQuyen = new List<string>
                {
                     "Khách hàng",  "Quản trị"
                };
                ViewBag.CacQuyen = cacQuyen;


                return View(taiKhoan);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTK,HoTen,TenDN,MatKhau,Quyen,TrangThai,SoDienThoai,Email")] TaiKhoan taiKhoan)
        {
            if (ModelState.IsValid)
            {
                //Lấy quyền
                string quyen = Request["QuyenTaiKhoan"];
                if (quyen == "1") taiKhoan.Quyen = true;
                else taiKhoan.Quyen = false;

                db.Entry(taiKhoan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["admin"] != null)
            {
                TaiKhoan taiKhoan = Session["admin"] as TaiKhoan;

                //Đây là phòng trường hợp người dùng nhập từ URL id của tài khoản đang đăng nhập
                if(id == taiKhoan.MaTK)
                {
                    return Redirect("/Admin/Taikhoan/Index");
                }

                if (id == null)
                {
                    return Redirect("/Admin/Taikhoan/Index");
                }
                
                taiKhoan = db.TaiKhoans.Find(id);
                if (taiKhoan == null)
                {
                    return Redirect("/Admin/Taikhoan/Index");
                }
                return View(taiKhoan);

            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }
        }

        // POST: Admin/TaiKhoans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            try
            {
                db.TaiKhoans.Remove(taiKhoan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.ErrorDeleteTaikhoan = "Lỗi không xóa được tài khoản! ";
                return View("Delete", taiKhoan);
            }

        }
        public ActionResult ThongtinDangnhap()
        {
            if (Session["admin"] != null)
            {
                TaiKhoan taiKhoan = Session["admin"] as TaiKhoan;
                return View(taiKhoan);
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
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
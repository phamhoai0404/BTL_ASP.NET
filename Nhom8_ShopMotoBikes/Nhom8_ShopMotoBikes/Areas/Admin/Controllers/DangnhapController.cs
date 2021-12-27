using Nhom8_ShopMotoBikes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Areas.Admin.Controllers
{
    public class DangnhapController : Controller
    {
        // GET: Admin/Dangnhap
        private ShopMotoBikes db = new ShopMotoBikes();
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection frm)
        {
            string email = frm["email"];
            string password = frm["password"];
            email = email.Trim();
            password = password.Trim();
            if (email != "" && password != "")
            {
                TaiKhoan admin = db.TaiKhoans.Where(s => s.Email.Equals(email) && s.MatKhau.Equals(password)).SingleOrDefault();
                if (admin != null)
                {
                    if (admin.Quyen == true && admin.TrangThai == true)
                    {
                        /*Session["tendangnhap"] = admin.HoTen;
                        Session["MatKhau"] = admin.MatKhau;
                        Session["idUser"] = admin.MaTK;
                        return Redirect("/Admin/MainBoard/Index");*/

                        Session["admin"] = admin;
                        return Redirect("/Admin/Home/Index");
                    }
                    else
                    {
                        ViewBag.ErrorLogin = "Bạn không có quyền truy cập hoặc tài khoản đang bị khóa! ";
                        return View();
                    }
                }
                else
                {
                    ViewBag.ErrorLogin = "Đăng nhập thất bại kiểm tra lại email và password! ";
                    return View();
                }
            }
            else
            {
                ViewBag.ErrorLogin = "Phải nhập đầy đủ Email và Password! ";
                return View();
            }


        }

        public ActionResult Logout()
        {
            Session["admin"] = null;

            return Redirect("/Admin/DangNhap/Login");
        }

    }
}
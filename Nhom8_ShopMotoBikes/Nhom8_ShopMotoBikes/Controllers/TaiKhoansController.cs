using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom8_ShopMotoBikes.Models;

namespace Nhom8_ShopMotoBikes.Controllers
{
    public class TaiKhoansController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();

        public ActionResult Logout()
        {
            Session["user"] = null;
            return Redirect("/");
        }

        public ActionResult Login()
        {
            if (Session["user"] == null)
            {
                return View();
            }
            return Redirect("/");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection frm)
        {
            if (ModelState.IsValid)
            {
                string email = frm["email"];
                string password = frm["password"];

                TaiKhoan user = db.TaiKhoans.Where(s => s.Email.Equals(email) && s.MatKhau.Equals(password)).SingleOrDefault();
                if (user != null )
                {
                    if (user.TrangThai)
                    {
                        Session["user"] = user;
                        return Redirect("/");
                    }
                    else
                    {
                        ViewBag.errorLogin = "Tài khoản của bạn đang bị khóa";
                    }
                }
                else
                {
                    ViewBag.errorLogin = "Vui lòng kiểm tra lại email hoặc mật khẩu! ";
                }

            }
            return View();
        }

        public ActionResult Register()
        {
            if (Session["user"] == null)
            {
                return View();
            }
            return Redirect("/");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "MaTK,TenDN,HoTen,SoDienThoai,Email,MatKhau")] TaiKhoan taiKhoan, FormCollection frm)
        {
            try
            {
                string confirmPassword = frm["confirmPassword"];
                if (confirmPassword != taiKhoan.MatKhau)
                {
                    ViewBag.errorRegister = "Mật khẩu xác nhận không khớp! ";
                    return View(taiKhoan);
                }

                var tkcheck = db.TaiKhoans.Where(tk => tk.Email == taiKhoan.Email || tk.TenDN == taiKhoan.TenDN);
                if (tkcheck.Count() == 0)
                {
                    if (ModelState.IsValid)
                    {
                        taiKhoan.TrangThai = true;
                        db.TaiKhoans.Add(taiKhoan);
                        db.SaveChanges();

                    }
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.errorRegister = "Tên đăng nhập hoặc email đã tồn tại! ";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
                ViewBag.errorRegister = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
            

        }


        public ActionResult ThongTin()
        {
            if (Session["user"] != null)
            {
                TaiKhoan taiKhoan = Session["user"] as TaiKhoan;
                List<DonHang> listDonHang = db.DonHangs.Where(p => p.MaTK == taiKhoan.MaTK).ToList();

                ViewBag.listDonHangByMaTK = listDonHang;

                return View(taiKhoan);
            }
            return Redirect("/");
            
            
        }
        public ActionResult SuaTaiKhoan()
        {
            if (Session["user"] != null)
            {
                TaiKhoan taiKhoan = Session["user"] as TaiKhoan;
                return View(taiKhoan);
            }
            return Redirect("/");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SuaTaiKhoan([Bind(Include = "MaTK,TenDN,HoTen,SoDienThoai,Email,MatKhau,TrangThai,Quyen")] TaiKhoan taiKhoan)
        {
            try
            {
                var tkcheck = db.TaiKhoans.Where(tk => (tk.Email == taiKhoan.Email || tk.TenDN == taiKhoan.TenDN) && tk.MaTK != taiKhoan.MaTK);
                if (tkcheck.Count() == 0 )
                {
                    db.Entry(taiKhoan).State = EntityState.Modified;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.SaveChanges();
                    Session["user"] = taiKhoan;

                    return RedirectToAction("ThongTin");
                }
                else
                {
                    ViewBag.errorUpdateTaikhoan = "Tên đăng nhập hoặc email đã tồn tại! ";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {
            ViewBag.errorUpdateTaikhoan = "Lỗi " + ex.Message;
            return View(taiKhoan);
            }


        }

        public ActionResult SuaMatKhau()
        {
            if (Session["user"] != null)
            {
                TaiKhoan taiKhoan = Session["user"] as TaiKhoan;
                return View(taiKhoan);
            }
            return Redirect("/");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SuaMatKhau([Bind(Include = "MaTK,TenDN,HoTen,SoDienThoai,Email,MatKhau,TrangThai,Quyen")] TaiKhoan taiKhoan, FormCollection frm)
        {
            try
            {
                string cu = Request["oldPassword"];
                string moi = Request["newPassword"];
                string xacnhan = Request["confirmPassword"];

                if (cu != null && moi != null && xacnhan != null)
                {
                    if (cu != "" && moi != "" && xacnhan != "")
                    {
                        if (moi == xacnhan)
                        {
                            if (moi.Length >= 3 && moi.Length <= 30)
                            {
                                TaiKhoan tk = Session["user"] as TaiKhoan;
                                if (cu == tk.MatKhau + "")
                                {
                                    taiKhoan.MatKhau = moi;
                                    db.Entry(taiKhoan).State = EntityState.Modified;
                                    Session["user"] = taiKhoan;
                                    db.SaveChanges();
                                    return RedirectToAction("ThongTin");

                                }
                                else
                                {
                                    ViewBag.LoiMatKhau = "Mật khẩu cũ không khớp!";
                                    return View(taiKhoan);
                                }
                            }
                            else
                            {
                                ViewBag.LoiMatKhau = "Độ dài mật khẩu mới >=3 và <=30!";
                                return View(taiKhoan);
                            }

                        }
                        else
                        {
                            ViewBag.LoiMatKhau = "Mật khẩu mới và xác nhận không khớp!";
                            return View(taiKhoan);
                        }
                    }
                    else
                    {
                        ViewBag.LoiMatKhau = "Không được để trống trường dữ liệu nào!";
                        return View(taiKhoan);
                    }
                }
                else
                {
                    ViewBag.LoiMatKhau = "Không được để trống trường dữ liệu nào!";
                    return View(taiKhoan);
                }
            }
            catch (Exception ex)
            {

                ViewBag.LoiMatKhau = "Lỗi " + ex.Message;
                return View(taiKhoan);
            }
           



        }





    }
}

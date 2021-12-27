using Nhom8_ShopMotoBikes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["admin"] != null)
            {

                //Đếm toàn bộ tài khoản có trong cơ sở dữ liệu
                ViewBag.SoTaiKhoan = db.TaiKhoans.Count();

                //Tính số đơn hàng đang giao 
                ViewBag.DonHangDangGiao = db.DonHangs.Sum(s => s.TinhTrangDH == 1 ? 1 : 0);

                //Sản phẩm có trong cơ sở dữ liệu
                ViewBag.SanPhamTrongDB = db.Hangs.Count();

                //Doanh thu chỉ tính cái đã giao không tính cái đang giao và đã hủy
                ViewBag.DoanhThu = db.DonHangs.Sum(s => s.TinhTrangDH == 2 ? s.TongTien : 0);

                return View();
            }
            else
            {
                return Redirect("/Admin/DangNhap/Login");
            }

           
        }

        public PartialViewResult _HeaderAdmin()
        {
            if (Session["admin"] != null)
            {
                TaiKhoan taiKhoan = Session["admin"] as TaiKhoan;
                return PartialView(taiKhoan);
            }
            return PartialView();
        }

    }
}
using Nhom8_ShopMotoBikes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Controllers
{
    public class BaseController : Controller
    {

        private ShopMotoBikes db = new ShopMotoBikes();
        public PartialViewResult _Navbar()
        {
            var danhMucs = db.DanhMucs.Select(n => n);

            ViewBag.SoLuongGioHang = this.TongSoLuong();
            return PartialView(danhMucs);
        }
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

    }
}
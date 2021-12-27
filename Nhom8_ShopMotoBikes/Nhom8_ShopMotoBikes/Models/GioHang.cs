using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nhom8_ShopMotoBikes.Models;
namespace Nhom8_ShopMotoBikes.Models
{
    public class GioHang
    {
        ShopMotoBikes db = new ShopMotoBikes();
        public int iMaHang { set; get; }
        public string sTenHang { get; set; }
        public string sAnh { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double dThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }

        public GioHang(int MaHang)
        {
            iMaHang = MaHang;
            Hang sanpham = db.Hangs.Single(n => n.MaHang == iMaHang);
            sTenHang = sanpham.TenHang;
            sAnh = sanpham.Anh;
            dDonGia = double.Parse(sanpham.GiaTien.ToString());
            iSoLuong = 1;

        }

    }
}


using Nhom8_ShopMotoBikes.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Controllers
{
    public class DonHangController : Controller
    {
        private ShopMotoBikes db = new ShopMotoBikes();
        public ActionResult Index(int? id)
        {
            if (Session["user"] != null)
            {
                if (id == null)
                {
                    return Redirect("/TaiKhoans/ThongTin");
                }

                DonHang donHang = db.DonHangs.Find(id);

                /*if (donHang == null)
                {
                    return Redirect("/TaiKhoans/ThongTin");
                }*/

                TaiKhoan taiKhoan = Session["user"] as TaiKhoan;
              

                if (donHang.MaTK != taiKhoan.MaTK)
                {
                    return Redirect("/TaiKhoans/ThongTin");
                }


                List<ChiTietDonHang> chiTietDonHangByID = db.ChiTietDonHangs.Where(p => p.MaDH == id).ToList();
                List<Hang> dsHang = new List<Hang>();

                foreach (var item in chiTietDonHangByID)
                {
                    Hang sp = db.Hangs.Where(p => p.MaHang == item.MaHang).SingleOrDefault();
                    dsHang.Add(sp);
                }

                ViewBag.SanPhamsClient = dsHang;
                ViewBag.ChiTietDHClient = chiTietDonHangByID;

                return View(donHang);
            }
            else
            {
                return Redirect("/");
            }
        }

        public ActionResult DatHang(int? tongtien)
        {
            if (Session["user"] != null)
            {
                /*string diachi = frm["txtDiaChi"];
                if(diachi == null || diachi == "")
                {
                    return Redirect("/GioHang/Index");
                }*/
                if (tongtien == null || tongtien == 0)
                {
                    return Redirect("/GioHang/Index");
                }
                else
                {
                    //Lưu danh đơn hàng
                    TaiKhoan taiKhoan = Session["user"] as TaiKhoan;
                    DonHang donhang = new DonHang();
                    donhang.MaTK = taiKhoan.MaTK;
                    donhang.TinhTrangDH = 1;
                    donhang.NgayDat = DateTime.Now;
                    donhang.TongTien = (decimal)tongtien;
                    donhang.DiaChiGiaoHang = "Phú Thọ";

                    db.DonHangs.Add(donhang);
                   

                    int maDonHang = donhang.MaDH;

                    List<GioHang> list = this.Laygiohang();
                    for( int i = 0; i< list.Count;i++)
                    {
                        ChiTietDonHang ct = new ChiTietDonHang();
                        Hang sanpham = db.Hangs.Single(n => n.MaHang == ct.MaHang);
                        
                        ct.MaDH = maDonHang;
                        ct.MaHang = list[i].iMaHang;
                        ct.SoLuongDat = list[i].iSoLuong;

                        sanpham.SoLuong -= ct.SoLuongDat;
                        db.Entry(sanpham).State = EntityState.Modified;

                        db.ChiTietDonHangs.Add(ct);
                    }
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.SaveChanges();


                    return RedirectToAction("Index", "DonHang", new { id = donhang.MaDH }) ;

                }

            }
            else
            {
                return Redirect("/TaiKhoans/Login");
            }

        }
        public List<GioHang> Laygiohang()
        {
            if (!(Session["GioHang"] is List<GioHang> lstGioHang))
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom8_ShopMotoBikes.Models;

namespace Nhom8_ShopMotoBikes.Controllers
{
    public class GioHangController : Controller
    {


        ShopMotoBikes db = new ShopMotoBikes();
        public List<GioHang> Laygiohang()
        {
            if (!(Session["GioHang"] is List<GioHang> lstGioHang))
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        // GET: GioHang

        public ActionResult ThemGioHang(int iMaHang, string strURL)
        {
            // lấy session gio hang
            List<GioHang> lstGioHang = Laygiohang();
            GioHang sanpham = lstGioHang.Find(n => n.iMaHang == iMaHang);
            if (sanpham == null)
            {
                sanpham = new GioHang(iMaHang);
                lstGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                Hang hang = db.Hangs.Single(n => n.MaHang == iMaHang);
                if(hang.SoLuong > sanpham.iSoLuong)
                {
                    sanpham.iSoLuong++;
                }
                else
                {
                    sanpham.iSoLuong = hang.SoLuong;
                }
               
                return Redirect(strURL);
            }
        }

       
        private double TongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongTien = lstGioHang.Sum(n => n.dThanhTien);
            }
            return iTongTien;
        }

        public ActionResult Index()
        {
            List<GioHang> lstGioHang = Laygiohang();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        public ActionResult XoaGioHang(int iMaHang)
        {
            // lay gio hang tu session
            List<GioHang> lstGioHang = Laygiohang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaHang == iMaHang);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMaHang == iMaHang);
            }
            return RedirectToAction("/Index");
        }

        public ActionResult CapNhatGioHang(int MaHang, FormCollection f)
        {
            List<GioHang> lstGioHang = Laygiohang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaHang == MaHang);
            if (sanpham != null)
            {
                Hang hang = db.Hangs.Single(n => n.MaHang == MaHang);
                int soluongmuon = int.Parse(f["txtSoLuongDat"].ToString());

                //Nếu số lượng muốn mà nhiều hơn số lượng có thì số lượng sẽ bằng số lượng tối đa
                
                if(hang.SoLuong < soluongmuon)
                {
                    sanpham.iSoLuong = hang.SoLuong;
                    ViewBag.ThieuSoLuongMuon = true;
                }
                else
                {
                    sanpham.iSoLuong = soluongmuon;
                    ViewBag.ThieuSoLuongMuon = false;
                }
                //Và đưa ra thông báo 
                
            }
            return RedirectToAction("Index");
            
        }

        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGioHang = Laygiohang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "Home");
        }
       
    }
}
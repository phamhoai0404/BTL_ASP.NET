using System.Web.Mvc;

namespace Nhom8_ShopMotoBikes.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Login", controller = "Dangnhap", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "DanhmucSanpham",
                "Admin/{controller}/{action}",
                new { controller = "DanhmucSanpham", action = "Index" }
            );
            context.MapRoute(
                "Donhang",
                "Admin/{controller}/{action}",
                new { controller = "Donhang", action = "Index" }
            );
            context.MapRoute(
               "Home",
               "Admin/{controller}/{action}",
               new { controller = "Home", action = "Index" }
           );
            context.MapRoute(
               "Sanpham",
               "Admin/{controller}/{action}",
               new { controller = "Sanpham", action = "Index" }
           );
            context.MapRoute(
              "Taikhoan",
              "Admin/{controller}/{action}",
              new { controller = "Taikhoan", action = "Index" }
          );



        }
    }
}
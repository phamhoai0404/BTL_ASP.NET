namespace Nhom8_ShopMotoBikes.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            DonHangs = new HashSet<DonHang>();
        }

        [Key]
        public int MaTK { get; set; }

        [Required(ErrorMessage = "Tên đăng nhập không được để trống!")]
        [DisplayName("Họ tên:")]
        [StringLength(30)]
        public string HoTen { get; set; }

        [Required(ErrorMessage = "Tên đăng nhập không được để trống!") ]
        [MinLength(3, ErrorMessage = "Tên đăng nhập phải có ít nhất 3 kí tự")]
        [DisplayName("Tên đăng nhập")]
        [StringLength(20)]
        public string TenDN { get; set; }

        [Required(ErrorMessage = "Tên đăng nhập không được để trống!")]
        [StringLength(30, MinimumLength = 3, ErrorMessage = "Tối thiểu 3 kí tự,Tối đa 30 kí tự")]
        [DisplayName("Mật Khẩu"), DataType(DataType.Password)]
        public string MatKhau { get; set; }

        [DisplayName("Quyền")]
        public bool Quyen { get; set; }

        public bool TrangThai { get; set; }

        [Required(ErrorMessage = "Số điện thoại không được để trống!")]

        [DisplayName("Số điện thoại")]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",
                   ErrorMessage = "Phải đúng định dạng số điện thoại! ")]
        [StringLength(10)]
        public string SoDienThoai { get; set; }


        [Required(ErrorMessage = "Email không được để trống!")]
        [StringLength(40)]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Phải đúng định dạng email!")]
        public string Email { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHangs { get; set; }
    }
}

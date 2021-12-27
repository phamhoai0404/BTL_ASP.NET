﻿namespace Nhom8_ShopMotoBikes.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMuc")]
    public partial class DanhMuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DanhMuc()
        {
            Hangs = new HashSet<Hang>();
        }

        [Key]
        [DisplayName("Mã danh mục")]
        public int MaDM { get; set; }

        [Required(ErrorMessage = "Tên danh mục không được để trống!")]
        [StringLength(60)]
        [DisplayName("Tên danh mục")]
        public string TenDM { get; set; }

        [Column(TypeName = "ntext")]
        [DataType(DataType.MultilineText)]
        public string MoTa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hang> Hangs { get; set; }
    }
}

using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Nhom8_ShopMotoBikes.Models
{
    public partial class ShopMotoBikes : DbContext
    {
        public ShopMotoBikes()
            : base("name=ShopMotoBikes")
        {
        }

        public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<Hang> Hangs { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DanhMuc>()
                .HasMany(e => e.Hangs)
                .WithRequired(e => e.DanhMuc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DonHang>()
                .HasMany(e => e.ChiTietDonHangs)
                .WithRequired(e => e.DonHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Hang>()
                .Property(e => e.GiaTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Hang>()
                .HasMany(e => e.ChiTietDonHangs)
                .WithRequired(e => e.Hang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.DonHangs)
                .WithRequired(e => e.TaiKhoan)
                .WillCascadeOnDelete(false);
        }
    }
}

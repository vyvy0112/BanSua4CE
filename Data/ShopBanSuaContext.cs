using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BanSua4CE.Data;

public partial class ShopBanSuaContext : DbContext
{
    public ShopBanSuaContext()
    {
    }

    public ShopBanSuaContext(DbContextOptions<ShopBanSuaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }

    public virtual DbSet<DanhMuc> DanhMucs { get; set; }

    public virtual DbSet<DonHang> DonHangs { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<LienHe> LienHes { get; set; }

    public virtual DbSet<MaGiamGium> MaGiamGia { get; set; }

    public virtual DbSet<SanPham> SanPhams { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<VnPay> VnPays { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=LAPTOP-EUOBO6JQ;Initial Catalog=ShopBanSua;Integrated Security=True;Encrypt=True;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ChiTietDonHang>(entity =>
        {
            entity.HasKey(e => e.IdChiTietDh).HasName("PK__ChiTietD__0A783F44ABBEF5FC");

            entity.ToTable("ChiTietDonHang");

            entity.Property(e => e.IdChiTietDh).HasColumnName("IdChiTietDH");
            entity.Property(e => e.IdSp).HasColumnName("IdSP");

            entity.HasOne(d => d.IdDonHangNavigation).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.IdDonHang)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK__ChiTietDo__IdDon__3F466844");

            entity.HasOne(d => d.IdSpNavigation).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.IdSp)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK__ChiTietDon__IdSP__403A8C7D");
        });

        modelBuilder.Entity<DanhMuc>(entity =>
        {
            entity.HasKey(e => e.IdDanhMuc).HasName("PK__DanhMuc__7E5B713D8D14AFB2");

            entity.ToTable("DanhMuc");

            entity.Property(e => e.TenDanhMuc).HasMaxLength(100);
        });

        modelBuilder.Entity<DonHang>(entity =>
        {
            entity.HasKey(e => e.IdDonHang).HasName("PK__DonHang__C7C3C3C5770431DF");

            entity.ToTable("DonHang");

            entity.Property(e => e.CachVanChuyen).HasMaxLength(100);
            entity.Property(e => e.IdKh).HasColumnName("IdKH");
            entity.Property(e => e.IdSp).HasColumnName("IdSP");
            entity.Property(e => e.NgayTao).HasColumnType("datetime");
            entity.Property(e => e.PhuongThucTraTien).HasMaxLength(50);
            entity.Property(e => e.SoDienThoai).HasMaxLength(20);
            entity.Property(e => e.TenKh)
                .HasMaxLength(100)
                .HasColumnName("TenKH");

            entity.HasOne(d => d.IdKhNavigation).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.IdKh)
                .HasConstraintName("FK_DonHang_IdKH");

            entity.HasOne(d => d.IdSpNavigation).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.IdSp)
                .HasConstraintName("FK_DonHang_SanPham");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.IdKh).HasName("PK__KhachHan__B773D18110C8ABC1");

            entity.ToTable("KhachHang");

            entity.Property(e => e.IdKh).HasColumnName("IdKH");
            entity.Property(e => e.DiaChi).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.MatKhau).HasMaxLength(100);
            entity.Property(e => e.SoDienThoai).HasMaxLength(20);
            entity.Property(e => e.TenKh)
                .HasMaxLength(100)
                .HasColumnName("TenKH");
        });

        modelBuilder.Entity<LienHe>(entity =>
        {
            entity.HasKey(e => e.IdLienHe).HasName("PK__LienHe__03AC912A47D3F82B");

            entity.ToTable("LienHe");

            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.HoTen).HasMaxLength(100);
        });

        modelBuilder.Entity<MaGiamGium>(entity =>
        {
            entity.HasKey(e => e.IdMaGiamGia).HasName("PK__MaGiamGi__0533C2D4572EAA43");

            entity.HasIndex(e => e.MaCode, "UQ__MaGiamGi__152C7C5CDC10A324").IsUnique();

            entity.Property(e => e.IdSp).HasColumnName("IdSP");
            entity.Property(e => e.MaCode).HasMaxLength(50);
            entity.Property(e => e.MoTa).HasMaxLength(255);
            entity.Property(e => e.NgayBatDau).HasColumnType("datetime");
            entity.Property(e => e.NgayKetThuc).HasColumnType("datetime");
            entity.Property(e => e.PhanTramGiam).HasColumnType("decimal(5, 2)");

            entity.HasOne(d => d.IdSpNavigation).WithMany(p => p.MaGiamGia)
                .HasForeignKey(d => d.IdSp)
                .HasConstraintName("FK__MaGiamGia__IdSP__7CD98669");
        });

        modelBuilder.Entity<SanPham>(entity =>
        {
            entity.HasKey(e => e.IdSp).HasName("PK__SanPham__B77012870909DA56");

            entity.ToTable("SanPham");

            entity.Property(e => e.IdSp).HasColumnName("IdSP");
            entity.Property(e => e.HinhAnh).HasMaxLength(100);
            entity.Property(e => e.TenSp)
                .HasMaxLength(100)
                .HasColumnName("TenSP");
            entity.Property(e => e.XuatXu).HasMaxLength(100);

            entity.HasOne(d => d.IdDanhMucNavigation).WithMany(p => p.SanPhams)
                .HasForeignKey(d => d.IdDanhMuc)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK__SanPham__IdDanhM__398D8EEE");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.IdUser);

            entity.ToTable("User");

            entity.Property(e => e.Gmail).HasMaxLength(100);
            entity.Property(e => e.NameUser).HasMaxLength(100);
            entity.Property(e => e.Role).HasMaxLength(50);
        });

        modelBuilder.Entity<VnPay>(entity =>
        {
            entity.ToTable("VnPay");

            entity.Property(e => e.DatedCreated).HasColumnType("datetime");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BanSua4CE.Data;

public partial class SanPham
{
    public int IdSp { get; set; }

    [Display(Name = "Tên sản phẩm")]
    public string TenSp { get; set; } = null!;

    [Display(Name = "Giá")]
    public double DonGia { get; set; }

    [Display(Name = "Mô Tả")]
    public string? MoTa { get; set; }

    [Display(Name = "Xuất Xứ")]
    public string? XuatXu { get; set; }
    [Display(Name = "Hình Ảnh")]
    public string? HinhAnh { get; set; }

    [Display(Name = "Trạng Thái")]
    public bool? Status { get; set; }

    [Display(Name = "IdDanhMuc")]
    public int? IdDanhMuc { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual DanhMuc? IdDanhMucNavigation { get; set; }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BanSua4CE.Data;

public partial class KhachHang
{
    public int IdKh { get; set; }

    [Display(Name = "Tên khách hàng")]
    public string TenKh { get; set; } = null!;

    [Display(Name = "Email")]
    public string Email { get; set; } = null!;

    [Display(Name = "Địa Chỉ")]
    public string? DiaChi { get; set; }

    [Display(Name = "Số Điện Thoại")]
    public string? SoDienThoai { get; set; }

    [Display(Name = "Mật Khẩu")]
    public string MatKhau { get; set; } = null!;

    public virtual ICollection<DonHang> DonHangs { get; set; } = new List<DonHang>();
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BanSua4CE.Data;

public partial class DanhMuc
{
    public int IdDanhMuc { get; set; }

    [Display(Name ="Tên Danh Mục")]
    public string? TenDanhMuc { get; set; }

    [Display(Name="Trạng Thái")]
    public bool? TrangThai { get; set; }

    public virtual ICollection<SanPham> SanPhams { get; set; } = new List<SanPham>();
}

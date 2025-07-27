using System;
using System.Collections.Generic;

namespace BanSua4CE.Data;

public partial class MaGiamGium
{
    public int IdMaGiamGia { get; set; }

    public string MaCode { get; set; } = null!;

    public string? MoTa { get; set; }

    public decimal PhanTramGiam { get; set; }

    public DateTime NgayBatDau { get; set; }

    public DateTime NgayKetThuc { get; set; }

    public int SoLuong { get; set; }

    public int? IdSp { get; set; }

    public virtual SanPham? IdSpNavigation { get; set; }
}

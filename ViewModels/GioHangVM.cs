using BanSua4CE.Data;

namespace BanSua4CE.ViewModels
{
    public class GioHangVM
    {
        //public int IdChiTietDh { get; set; }

        public string TenSp { get; set; } = null!;

        public string? HinhAnh { get; set; }

        public double DonGia { get; set; }

        //public decimal DonGia { get; set; }
        public int SoLuong { get; set; }

        public double ThanhTien => DonGia * SoLuong;

        //public decimal ThanhTien => DonGia * SoLuong;

        public int? IdSp { get; set; }

        public int? IdDonHang { get; set; }


        public List<MaGiamGium> MaGiamGiaApDung { get; set; }
    }
}

using BanSua4CE.Data;
using BanSua4CE.ViewModels;

namespace BanSua4CE.Controllers
{
    internal class GioHangTrangViewModel
    {
        public List<GioHangVM> CartItems { get; set; }
        public List<MaGiamGium> MaGiamGiaApDung { get; set; }
    }
}
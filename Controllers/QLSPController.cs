using BanSua4CE.Data;
using BanSua4CE.Helpers;
using BanSua4CE.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BanSua4CE.Controllers
{
    public class QLSPController : Controller
    {
        ShopBanSuaContext _context = new ShopBanSuaContext();
        private readonly IWebHostEnvironment _webHostEnvironment;
        public IActionResult Index()
        {
            var lst = _context.SanPhams.ToList();
            return View(lst);
        }


        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.SanPham = new SelectList(_context.SanPhams.ToList(), "IdSP", "TenSp");
            ViewBag.IdDanhMuc = new SelectList(_context.DanhMucs, "IdDanhMuc", "TenDanhMuc");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(SanPham sanpham)
        {
            if (ModelState.IsValid)
            {
                var sp = new SanPham
                {
                    TenSp = sanpham.TenSp,
                    DonGia = sanpham.DonGia,
                    MoTa = sanpham.MoTa,
                    XuatXu = sanpham.XuatXu,
                    Status = true,
                    IdDanhMuc = sanpham.IdDanhMuc,
                    HinhAnh = sanpham.HinhAnh
                };
               
                _context.SanPhams.Add(sp);
                _context.SaveChanges();
                return RedirectToAction("Index"); //danh sách sp
            }
            ViewBag.IdDanhMuc = new SelectList(_context.DanhMucs, "IdDanhMuc", "TenDanhMuc", sanpham.IdDanhMuc);
            return View(sanpham);
        }



        [HttpGet]
        public IActionResult Edit(int? id)
        {
            ViewBag.SanPham = new SelectList(_context.SanPhams.ToList(), "IdSP", "TenSp");
            ViewBag.IdDanhMuc = new SelectList(_context.DanhMucs, "IdDanhMuc", "TenDanhMuc");
            var sp= _context.SanPhams.Find(id);                      
            return View(sp);                                 
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(SanPham sanpham)
        {
            if (ModelState.IsValid)
            {
                var sp = _context.SanPhams.Find(sanpham.IdSp); // Tìm sản phẩm theo Id
                if (sp == null)
                {
                    return NotFound(); 
                }

                // Cập nhật các thuộc tính của sản phẩm
                sp.TenSp = sanpham.TenSp;
                sp.DonGia = sanpham.DonGia;
                sp.MoTa = sanpham.MoTa;
                sp.XuatXu = sanpham.XuatXu;


                sp.HinhAnh = sanpham.HinhAnh;



                sp.Status = sanpham.Status; // Giữ nguyên giá trị Status từ form (hoặc bạn có thể đặt mặc định)
                sp.IdDanhMuc = sanpham.IdDanhMuc;

                _context.SanPhams.Update(sp); // Cập nhật sản phẩm
                _context.SaveChanges(); // Lưu thay đổi vào cơ sở dữ liệu

                return RedirectToAction("Index"); // Quay lại danh sách sản phẩm
            }

            ViewBag.IdDanhMuc = new SelectList(_context.DanhMucs, "IdDanhMuc", "TenDanhMuc", sanpham.IdDanhMuc);
            return View(sanpham);
        }

        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sp = _context.SanPhams.Find(id);
            if (sp == null)
            {
                return NotFound();
            }

            return View(sp);
        }



        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int? id)
        {
            var sp = _context.SanPhams.Find(id);
            if (sp == null)
            {
                return NotFound();
            }

            _context.SanPhams.Remove(sp);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sp = _context.SanPhams
                .Include(s => s.IdDanhMucNavigation) // Assuming you have a navigation property DanhMuc
                .FirstOrDefault(s => s.IdSp == id);

            if (sp == null)
            {
                return NotFound();
            }

            return View(sp);
        }


        private bool SanPhamExists(int id)
        {
            return _context.SanPhams.Any(e => e.IdSp == id);
        }

        


    }
}

using AutoMapper;
using BanSua4CE.Data;
using BanSua4CE.Helpers;
using BanSua4CE.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using System.Linq;
using System.Security.Claims;

namespace BanSua4CE.Controllers
{
    public class TaiKhoanController : Controller
    {
        private readonly IMapper _mapper;
        private readonly ShopBanSuaContext _context;


        public TaiKhoanController(IMapper mapper, ShopBanSuaContext context)
        {
            _mapper = mapper;
            _context = context;
        }

        [HttpGet]
        public IActionResult DangKy()
        {
            return View();
        }


        [HttpPost]
        public IActionResult DangKy([Bind("TenKh", "Email","DiaChi","SoDienThoai","MatKhau")] DangKyVM model)
        {
            if (ModelState.IsValid)
            {

                if (model.MatKhau.Length < 6)
                {
                    ModelState.AddModelError("MatKhau", "Mật khẩu phải có ít nhất 6 ký tự.");
                }


                var khachHang = _mapper.Map<KhachHang>(model);
                khachHang.MatKhau = model.MatKhau.ToSHA256Hash("MatKhau");
                _context.Add(khachHang);
                _context.SaveChanges();

                TempData["RegisterSuccess"] = "Đăng ký thành công! Bạn có thể đăng nhập ngay bây giờ!";
                return RedirectToAction("DangKy");
            }
            return View(model);
        }


        [HttpGet]
        public IActionResult DangNhap(string? ReturrnUrl)
        {
            ViewBag.ReturnUrl = ReturrnUrl;
            return View();
        }



        //[HttpPost]
        //public async Task<IActionResult> DangNhap([Bind("Email", "MatKhau")] DangNhapVM model, string? ReturrnUrl)
        //{
        //    ViewBag.ReturnUrl = ReturrnUrl;
        //    if (!ModelState.IsValid)
        //    {
        //        return View(model);
        //    }

        //    var khachhang = _context.KhachHangs
        //        .FirstOrDefault(x => x.Email == model.Email && x.MatKhau == model.MatKhau.ToSHA256Hash("MatKhau"));

        //    var user = _context.Users.FirstOrDefault(x => x.Gmail == model.Email);

        //    if (user != null)
        //    {
        //        var claims = new List<Claim>
        //    {
        //        new Claim(ClaimTypes.Name, user.NameUser),
        //        new Claim(ClaimTypes.Email, user.Gmail),
        //        new Claim(ClaimTypes.Role, "Admin"), // rõ ràng là Admin
        //        new Claim(MySetting.CLAIM_ADMINID, user.IdUser.ToString())
        //    };
        //        var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        //        var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
        //        await HttpContext.SignInAsync(claimsPrincipal);

        //        TempData["loginSuccess"] = "Đăng nhập quản trị thành công!";
        //        return RedirectToAction("Index", "QLSP"); // trang quản trị
        //    }
        //    if (khachhang != null && khachhang.MatKhau == model.MatKhau.ToSHA256Hash("MatKhau"))
        //    {
        //        var claims = new List<Claim>
        //        {
        //            new Claim(ClaimTypes.Name, khachhang.TenKh),
        //            new Claim(ClaimTypes.Email, khachhang.Email),
        //            new Claim(MySetting.CLAIM_CUSTOMERID, khachhang.IdKh.ToString()),
        //        };

        //        var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        //        var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
        //        await HttpContext.SignInAsync(claimsPrincipal);

        //        if (Url.IsLocalUrl(ReturrnUrl))
        //        {
        //            return Redirect(ReturrnUrl);
        //        }
        //        else
        //        {
        //            HttpContext.Session.SetString("TenKh", khachhang.TenKh); // lưu tên khách hàng vào session
        //            HttpContext.Session.SetString("TaiKhoan", khachhang.Email);
        //            TempData["loginSuccess"] = "Đăng nhập thành công!";
        //            return RedirectToAction("Index", "Product");
        //        }
        //    }
        //    else
        //    {
        //        ModelState.AddModelError("", "Email hoặc mật khẩu không đúng!");
        //        return View(model);
        //    }
        //    return View();
        //}
        [HttpPost]
        public async Task<IActionResult> DangNhap([Bind("Email", "MatKhau")] DangNhapVM model, string? ReturrnUrl)
        {
            ViewBag.ReturnUrl = ReturrnUrl;
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var hashedPassword = model.MatKhau.ToSHA256Hash("MatKhau");

            // Kiểm tra Admin
            var user = _context.Users.FirstOrDefault(x => x.Gmail == model.Email);
            if (user != null)
            {
                if (user.Password != hashedPassword)
                {
                    ModelState.AddModelError("", "Sai mật khẩu quản trị!");
                    return View(model);
                }

                // Đăng nhập admin
                var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, user.NameUser),
            new Claim(ClaimTypes.Email, user.Gmail),
            new Claim(ClaimTypes.Role, "Admin"),
            new Claim(MySetting.CLAIM_ADMINID, user.IdUser.ToString())
        };
                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                await HttpContext.SignInAsync(new ClaimsPrincipal(claimsIdentity));

                TempData["loginSuccess"] = "Đăng nhập quản trị thành công!";
                return RedirectToAction("Index", "QLSP");
            }

            // Kiểm tra khách hàng
            var khachhang = _context.KhachHangs.FirstOrDefault(x => x.Email == model.Email);
            if (khachhang == null)
            {
                ModelState.AddModelError("", "Email không tồn tại!");
                return View(model);
            }

            if (khachhang.MatKhau != hashedPassword)
            {
                ModelState.AddModelError("", "Sai mật khẩu!");
                return View(model);
            }

            // Đăng nhập khách hàng
            var claimsCustomer = new List<Claim>
             {
        new Claim(ClaimTypes.Name, khachhang.TenKh),
        new Claim(ClaimTypes.Email, khachhang.Email),
        new Claim(MySetting.CLAIM_CUSTOMERID, khachhang.IdKh.ToString()),
              };

            var claimsIdentityCustomer = new ClaimsIdentity(claimsCustomer, CookieAuthenticationDefaults.AuthenticationScheme);
            await HttpContext.SignInAsync(new ClaimsPrincipal(claimsIdentityCustomer));

            HttpContext.Session.SetString("TenKh", khachhang.TenKh);
            HttpContext.Session.SetString("TaiKhoan", khachhang.Email);
            TempData["loginSuccess"] = "Đăng nhập thành công!";

            return Url.IsLocalUrl(ReturrnUrl) ? Redirect(ReturrnUrl) : RedirectToAction("Index", "Product");
        }



        [Authorize]
        public IActionResult DangXuat()
        {
            HttpContext.SignOutAsync();
            // Xóa session nếu có
            HttpContext.Session.Clear();
            // Chuyển hướng về trang chủ
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
         
        public IActionResult Profile()
        {
            return View();
        }


        public async Task<IActionResult> LichSuDonHang()
        {
            var idkh = int.Parse(HttpContext.User.Claims
                .SingleOrDefault(x => x.Type == MySetting.CLAIM_CUSTOMERID).Value);

            // Lấy danh sách đơn hàng kèm chi tiết
            var danhsachdonhang = await _context.DonHangs
               .Include(dh => dh.ChiTietDonHangs)
               .ThenInclude(ct => ct.IdSpNavigation)
               .Where(dh => dh.IdKh == idkh && dh.ChiTietDonHangs.Any())
              .OrderByDescending(dh => dh.NgayTao)
               .ToListAsync();


            return View(danhsachdonhang);
        }

        [HttpPost]
        public async Task<IActionResult> HuyDonHang(int id)
        {
            var donhang = await _context.DonHangs.FindAsync(id);
            if (donhang == null)
            {
                TempData["Error"] = "Không tìm thấy đơn hàng.";
                return RedirectToAction("LichSuDonHang");
            }

            var idkh = int.Parse(HttpContext.User.Claims
                .SingleOrDefault(x => x.Type == MySetting.CLAIM_CUSTOMERID).Value);
            if (donhang.IdKh != idkh)
            {
                return Forbid();
            }

            if (donhang.MaTrangThai == "Đã hủy") return RedirectToAction("LichSuDonHang");

            if (donhang.MaTrangThai == "Đã thanh toán")
            {
                TempData["Error"] = "Đơn hàng đã thanh toán không thể hủy.";
                return RedirectToAction("LichSuDonHang");
            }

            if (donhang.MaTrangThai == "Đang giao")
            {
                TempData["Error"] = "Đơn hàng đang giao không thể hủy.";
                return RedirectToAction("LichSuDonHang");
            }

            // Hủy đơn
            donhang.MaTrangThai = "Đã hủy";
            _context.Update(donhang);
            await _context.SaveChangesAsync();

            // Gửi thông báo real-time cho admin
         

            return RedirectToAction("LichSuDonHang");
        }

      

    }
}

﻿using AutoMapper;
using BanSua4CE.Data;
using BanSua4CE.Helpers;
using BanSua4CE.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
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



        [HttpPost]
        public async Task<IActionResult> DangNhap([Bind("Email", "MatKhau")] DangNhapVM model, string? ReturrnUrl)
        {
            ViewBag.ReturnUrl = ReturrnUrl;
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var khachhang = _context.KhachHangs.FirstOrDefault(x => x.Email == model.Email && x.MatKhau == model.MatKhau.ToSHA256Hash("MatKhau"));

            var user = _context.Users.FirstOrDefault(x => x.Gmail == model.Email);

            if (user != null)
            {
                var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.NameUser),
                new Claim(ClaimTypes.Email, user.Gmail),
                new Claim(ClaimTypes.Role, "Admin"), // rõ ràng là Admin
                new Claim(MySetting.CLAIM_ADMINID, user.IdUser.ToString())
            };
                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                await HttpContext.SignInAsync(claimsPrincipal);

                TempData["loginSuccess"] = "Đăng nhập quản trị thành công!";
                return RedirectToAction("Index", "QLSP"); // trang quản trị
            }
            if (khachhang == null || khachhang.MatKhau != model.MatKhau.ToSHA256Hash("MatKhau"))
            {
                ModelState.AddModelError("", "Email hoặc mật khẩu không đúng!");
                return View(model);
            }
            else
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, khachhang.TenKh),
                    new Claim(ClaimTypes.Email, khachhang.Email),
                    new Claim(MySetting.CLAIM_CUSTOMERID, khachhang.IdKh.ToString()),
                };

                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                await HttpContext.SignInAsync(claimsPrincipal);

                if (Url.IsLocalUrl(ReturrnUrl))
                {
                    return Redirect(ReturrnUrl);
                }
                else
                {
                    HttpContext.Session.SetString("TenKh", khachhang.TenKh); // lưu tên khách hàng vào session
                    HttpContext.Session.SetString("TaiKhoan", khachhang.Email);
                    TempData["loginSuccess"] = "Đăng nhập thành công!";
                    return RedirectToAction("Index", "Product");
                }
            }
            return View();
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

    }
}

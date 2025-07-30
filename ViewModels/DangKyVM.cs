using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanSua4CE.ViewModels
{
    public class DangKyVM
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdKh { get; set; }



        [Required(ErrorMessage = "Vui lòng nhập Tên Khách Hàng")]
        public string TenKh { get; set; } = null!;

        [Required(ErrorMessage = "Vui lòng nhập Email")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        public string Email { get; set; } = null!;



        [Required(ErrorMessage = "Vui lòng nhập Mật khẩu")]
        [MinLength(6, ErrorMessage = "Mật khẩu phải có ít nhất 6 ký tự")]
        public string MatKhau { get; set; } = null!;

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        [Display(Name = "Địa Chỉ")]
        public string? DiaChi { get; set; }


        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        [Display(Name = "Số Điện Thoại")]
        public string? SoDienThoai { get; set; }


    }
}

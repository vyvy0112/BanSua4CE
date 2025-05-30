USE [ShopBanSua]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 5/27/2025 8:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[IdChiTietDH] [int] IDENTITY(1,1) NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[IdSP] [int] NULL,
	[IdDonHang] [int] NULL,
 CONSTRAINT [PK__ChiTietD__0A783F44ABBEF5FC] PRIMARY KEY CLUSTERED 
(
	[IdChiTietDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[IdDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[IdDonHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[NgayTao] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[PhuongThucTraTien] [nvarchar](50) NULL,
	[CachVanChuyen] [nvarchar](100) NULL,
	[MaTrangThai] [nvarchar](max) NULL,
	[IdKH] [int] NULL,
 CONSTRAINT [PK__DonHang__C7C3C3C5770431DF] PRIMARY KEY CLUSTERED 
(
	[IdDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IdKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__KhachHan__B773D18110C8ABC1] PRIMARY KEY CLUSTERED 
(
	[IdKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[IdLienHe] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLienHe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IdSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[DonGia] [float] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[XuatXu] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[IdDanhMuc] [int] NULL,
 CONSTRAINT [PK__SanPham__B77012870909DA56] PRIMARY KEY CLUSTERED 
(
	[IdSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[NameUser] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[Gmail] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VnPay]    Script Date: 5/27/2025 8:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VnPay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDescription] [nvarchar](max) NULL,
	[TransactionId] [nvarchar](max) NULL,
	[OrderId] [nvarchar](max) NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[DatedCreated] [datetime] NULL,
 CONSTRAINT [PK_VnPay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (1, 500000, 1, 500000, 76, 63)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (2, 400000, 1, 400000, 81, 63)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (3, 500000, 1, 500000, 76, 64)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (4, 830000, 1, 830000, 79, 64)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (5, 500000, 1, 500000, 65, 64)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (6, 500000, 1, 500000, 76, 65)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (7, 830000, 1, 830000, 79, 65)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (8, 500000, 1, 500000, 65, 65)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (9, 500000, 1, 500000, 76, 66)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (10, 830000, 1, 830000, 79, 66)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (11, 500000, 1, 500000, 65, 66)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (12, 1100000, 1, 1100000, 82, 68)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (13, 400000, 1, 400000, 81, 69)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (14, 800000, 1, 800000, 77, 70)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (15, 1100000, 1, 1100000, 82, 71)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (16, 800000, 1, 800000, 77, 72)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (17, 830000, 1, 830000, 79, 74)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (18, 730000, 1, 730000, 78, 75)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (19, 500000, 1, 500000, 76, 76)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (20, 1100000, 1, 1100000, 82, 78)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (21, 830000, 1, 830000, 79, 79)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (22, 450000, 1, 450000, 38, 79)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (23, 270000, 2, 540000, 4, 80)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (24, 500000, 1, 500000, 76, 80)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (25, 310000, 1, 310000, 5, 81)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (26, 500000, 1, 500000, 76, 85)
INSERT [dbo].[ChiTietDonHang] ([IdChiTietDH], [DonGia], [SoLuong], [ThanhTien], [IdSP], [IdDonHang]) VALUES (27, 400000, 1, 400000, 75, 86)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (1, N'Abbout', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (2, N'Healthycare', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (3, N'Nestle', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (4, N'Aptamil', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (5, N'Meiji', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (6, N'Friso', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (7, N'Vinamilk', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (8, N'Nutifood', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (9, N'THtruemilk', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (10, N'Hipp', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (11, N'Nutricare', 1)
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc], [TrangThai]) VALUES (12, N'Enfa', 0)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (63, N'Phụng', NULL, NULL, CAST(N'2025-04-12T22:44:33.113' AS DateTime), N'                               không ', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (64, N'Phụng', NULL, NULL, CAST(N'2025-04-12T22:48:19.547' AS DateTime), N'               không có
                 ', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (65, N'Phụng', NULL, NULL, CAST(N'2025-04-12T22:48:19.493' AS DateTime), N'               không có
                 ', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (66, N'Phụng', NULL, NULL, CAST(N'2025-04-12T22:48:19.493' AS DateTime), N'               không có
                 ', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (67, N'Nguyễn Nhật Thi', N'12 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'09876543', CAST(N'2025-04-12T22:57:57.633' AS DateTime), N'                          không      ', N'VNPAY', N'GRAB', N'0', 2)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (68, N'Nguyễn Kim Phụng ', N'01 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'0984321236', CAST(N'2025-04-13T18:33:32.310' AS DateTime), N'                                liên hệ trước', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (69, N'Nguyễn Kim Phụng ', N'01 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'0984321236', CAST(N'2025-04-14T10:31:28.320' AS DateTime), N'                                liên hệ trước', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (70, N'Nguyễn Kim Phụng ', N'01 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'0984321236', CAST(N'2025-04-14T11:25:44.537' AS DateTime), N'                                liên hệ trước
', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (71, N'Nguyễn Kim Phụng ', N'01 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'0984321236', CAST(N'2025-04-14T11:26:39.700' AS DateTime), N'                                liên hệ', N'VNPAY', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (72, N'Nguyễn Kim Phụng ', N'01 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'0984321236', CAST(N'2025-04-16T21:02:15.550' AS DateTime), NULL, N'Thanh toán VNPay', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (74, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-23T08:43:42.910' AS DateTime), NULL, N'COD', N'GRAB', N'0', 2)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (75, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-23T08:44:37.797' AS DateTime), NULL, N'COD', N'GRAB', N'0', 2)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (76, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-23T08:46:11.817' AS DateTime), NULL, N'COD', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (77, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-23T08:54:24.523' AS DateTime), NULL, N'COD', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (78, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-23T09:01:36.017' AS DateTime), NULL, N'COD', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (79, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-23T09:13:58.077' AS DateTime), NULL, N'COD', N'GRAB', N'0', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (80, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'3798375345', CAST(N'2025-04-30T19:14:23.417' AS DateTime), NULL, N'COD', N'GRAB', N'Chờ Xác Nhận', 2)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (81, N'Nguyễn Kim Phụng ', N'Võ Văn Kiệt, Thành Phố Cần Thơ', N'0984321236', CAST(N'2025-05-03T08:52:34.343' AS DateTime), N'                           không     ', N'COD', N'GRAB', N'Chờ Xác Nhận', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (82, N'Nguyễn Kim Phụng ', N'Võ Văn Kiệt, Thành Phố Cần Thơ', N'0836408364', CAST(N'2025-05-03T14:22:03.550' AS DateTime), N'gói cẩn thận', N'COD', N'GRAB', N'Chờ Xác Nhận', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (83, N'Nguyễn Kim Phụng ', N'01 Trần Nam Phú, Ninh Kiều, Cần Thơ', N'0899069754', CAST(N'2025-06-24T09:07:00.000' AS DateTime), N'KHÔNG', N'COD', N'GHN', N'1', NULL)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (84, N'Nguyễn Nhật Thi', N'18 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', N'09876543', NULL, N'KHÔNG', N'COD', N'GHN', N'Giao Hàng', 2)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (85, N'Nguyễn Kim Phụng ', N'Võ Văn Kiệt, Thành Phố Cần Thơ', N'0836408364', CAST(N'2025-05-04T18:38:32.890' AS DateTime), N'liên hệ trước                                ', N'COD', N'GRAB', N'Chờ Xác Nhận', 4)
INSERT [dbo].[DonHang] ([IdDonHang], [TenKH], [DiaChi], [SoDienThoai], [NgayTao], [GhiChu], [PhuongThucTraTien], [CachVanChuyen], [MaTrangThai], [IdKH]) VALUES (86, N'Nguyễn Kim Phụng ', N'Võ Văn Kiệt, Thành Phố Cần Thơ', N'0836408364', CAST(N'2025-05-07T14:22:29.847' AS DateTime), N' khong  ', N'COD', N'GRAB', N'Chờ Xác Nhận', 9)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([IdKH], [TenKH], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (0, N'Hà Gia Bảo', N'bao1234@gmail.com', N'Sóc Trăng', N'0963850348', N'y0zYNa8ycVHYAJIs+J7b+XTm8CWE0ASEHrW5N9Gno/U=')
INSERT [dbo].[KhachHang] ([IdKH], [TenKH], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (1, N'Thúy Kiều', N'kieu123@gmail.com', N'Hậu Giang', N'0899069754', N'y0zYNa8ycVHYAJIs+J7b+XTm8CWE0ASEHrW5N9Gno/U=')
INSERT [dbo].[KhachHang] ([IdKH], [TenKH], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (2, N'Nguyễn Nhật Thi', N'thi123@gmail.com', N'Sóc Trăng', N'0899678543', N'y0zYNa8ycVHYAJIs+J7b+XTm8CWE0ASEHrW5N9Gno/U=')
INSERT [dbo].[KhachHang] ([IdKH], [TenKH], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (4, N'Phụng', N'phung@1234gmail.com', N'Trà Vinh', N'0899069744', N'r7HVIFcHm09mThHuGdB6fVmDqY9WSR0ysKIMFoBek/g=')
INSERT [dbo].[KhachHang] ([IdKH], [TenKH], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (8, N'Diễm My', N'diemmy123@gmail.com', N'Hẻm 51, Ninh Kiều, Cần Thơ', N'0899076123', N'y0zYNa8ycVHYAJIs+J7b+XTm8CWE0ASEHrW5N9Gno/U=')
INSERT [dbo].[KhachHang] ([IdKH], [TenKH], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (9, N'Nguyễn Kim Phụng ', N'kimphung12@gmail.com', N'Hẻm 51, Ninh Kiều, Cần Thơ', N'0899076123', N'r7HVIFcHm09mThHuGdB6fVmDqY9WSR0ysKIMFoBek/g=')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([IdLienHe], [HoTen], [Email], [NoiDung], [CreatedAt]) VALUES (11, N'Trần Thị Thúy Kiều', N'kieu123@gmail', N'Tôi muốn yêu cầu tư vấn', CAST(N'2025-03-21T13:35:09.690' AS DateTime))
INSERT [dbo].[LienHe] ([IdLienHe], [HoTen], [Email], [NoiDung], [CreatedAt]) VALUES (12, N'Nguyễn Nhật Thi', N'thi123@gmail.com', N'Xấu', CAST(N'2025-03-21T13:36:17.273' AS DateTime))
INSERT [dbo].[LienHe] ([IdLienHe], [HoTen], [Email], [NoiDung], [CreatedAt]) VALUES (13, N'Hà Gia Bảo', N'thi123@gmail.com', N'Xấu', CAST(N'2025-03-22T13:25:57.470' AS DateTime))
INSERT [dbo].[LienHe] ([IdLienHe], [HoTen], [Email], [NoiDung], [CreatedAt]) VALUES (14, N'Trần Thị Thúy Kiều', N'kieu1234@gmail.com', N'liên trước', CAST(N'2025-05-03T19:29:14.927' AS DateTime))
SET IDENTITY_INSERT [dbo].[LienHe] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (4, N'Similac Neosure 370g số 1', 270000, N'Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ
Sữa bột Similac Neosure 370g - Cung cấp đầy đủ dưỡng chất cho trẻ sinh non, nhẹ cân', N'Mỹ', N'similac1neosure.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (5, N'Similac Total Comfort 0+ 360g', 310000, N'Sữa bột Similac Total Comfort 360g với công thức mới đặc biệt được cải tiến đột phá với sự kết hợp giữa hệ dưỡng chất 2’-FL HMO và nucleotide, mang đến giải pháp tối ưu cho sự phát triển toàn diện của bé.', N'Mỹ', N'similac0+totalcomfort.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (6, N'Similac 5G/2+ 900g/850g', 480000, N'Sữa Similac 5G số 2 là sản phẩm dinh dưỡng cho bé từ 2Y+ đến từ thương hiệu uy tín Abbott. Similac 5G số 2 sở hữu hệ dưỡng chất Prodi-GTM cùng nhiều dưỡng chất cần thiết khác để bé phát triển não bộ, tăng cường sức đề kháng và có được  một hệ tiêu hóa khỏe mạnh.', N'Mỹ', N'similac2_900g.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (8, N'Similac 5G số 3 900g', 550000, N'Sữa Similac 5G số 3 là sản phẩm dinh dưỡng cho bé từ 1-2 tuổi đến từ thương hiệu uy tín Abbott. Similac 5G số 3 sở hữu hệ dưỡng chất Prodi-GTM cùng nhiều dưỡng chất cần thiết khác để bé phát triển não bộ, tăng cường sức đề kháng và có được 1 hệ tiêu hóa khỏe mạnh.', N'Mỹ', N'similacso3_900g.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (9, N'Similac 5G S1/0+ 900g/850g', 635000, N'Sữa Similac 5G số 0+ là sản phẩm dinh dưỡng dành cho bé yêu từ 0-12 tháng tuổi đến từ thương hiệu uy tín Abbott. Similac 5G số 0+ sở hữu nhiều dưỡng chất cần thiết giúp bé yêu phát triển não bộ, tăng cường sức đề kháng và đem đến 1 hệ tiêu hóa khỏe mạnh. ', N'Mỹ', N'similac0+.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (10, N'Similac Total Protection số 4 900g', 560000, N'Sữa Similac số 4 Total Protection 900g (dành cho bé 2-6 tuổi) - Sản phẩm dinh dưỡng sữa công thức đột phá', N'Mỹ', N'similac4total.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (11, N'Similac Total  900g', 590000, N'Sữa Similac số 1+ Total Protection 850g - Sản phẩm dinh dưỡng sữa công thức dành cho trẻ 1-2 tuổi', N'Mỹ', N'similac1+total.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (12, N'Similac Total Protection số 0 400g', 400000, N'Sữa Similac Total số 0 380g là dòng sữa bột công thức mới bổ sung 5HMO+ với hàm lượng cao nhất so với các dòng sữa Similac thông thường, hỗ trợ tăng cường hệ miễn dịch của trẻ nhỏ. Ngoài ra, trong sữa Similac số 1 cũng chứa 10 vi dưỡng chất thiết yếu, hệ dưỡng chất Eye-Q Plus, Probiotics giúp phát triển não bộ, hệ tiêu hóa khỏe mạnh.', N'Mỹ', N'similac0+total.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (13, N'Similac SPIT-UP 900g', 635000, N'Similac Spit-Up là sữa công thức đặc biệt dành cho trẻ sơ sinh từ 0-12 tháng tuổi, được thiết kế để giảm tình trạng trớ sữa, nôn trớ và hỗ trợ tiêu hóa nhờ công thức chứa tinh bột gạo giúp sữa đặc hơn. Đồng thời, sản phẩm cung cấp đầy đủ dưỡng chất, bao gồm DHA, Lutein và Vitamin E, giúp hỗ trợ sự phát triển não bộ và hệ miễn dịch của bé.', N'Mỹ', N'similacspit-up.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (14, N'Similac Mom 900g', 700000, N'Similac Mom là sữa dinh dưỡng dành cho mẹ bầu và mẹ sau sinh, giúp bổ sung đầy đủ dưỡng chất cần thiết như DHA, Choline, FOS, cùng các vitamin và khoáng chất quan trọng. Công thức đặc biệt hỗ trợ sự phát triển não bộ của thai nhi, tăng cường sức khỏe cho mẹ, và giúp giảm nguy cơ táo bón trong thai kỳ. Với hương vị dễ uống, Similac Mom là lựa chọn lý tưởng để mẹ khỏe mạnh và bé phát triển toàn diện ngay từ trong bụng mẹ.', N'Mỹ', N'similacmom.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (15, N'Similac Pro-Sentitive 900g', 700000, N'Similac Pro-Sensitive là sữa công thức dành cho trẻ sơ sinh có hệ tiêu hóa nhạy cảm, giúp giảm tình trạng đầy hơi và quấy khóc do bất dung nạp lactose. Sản phẩm chứa HMO (2’-FL), một prebiotic hỗ trợ hệ miễn dịch, cùng với DHA, Lutein và Vitamin E giúp phát triển não bộ và thị giác. Công thức không chứa dầu cọ giúp hỗ trợ hấp thu canxi tốt hơn, giúp bé phát triển khỏe mạnh ngay từ những năm đầu đời.', N'Mỹ', N'similacpro.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (16, N'Similac Isomil 900g', 800000, N'Similac Soy Isomil là sữa công thức từ đạm đậu nành, đặc biệt dành cho trẻ sơ sinh bị dị ứng đạm sữa bò, không dung nạp lactose hoặc gặp vấn đề về tiêu hóa. Sản phẩm cung cấp nguồn dinh dưỡng đầy đủ với DHA, Lutein và Vitamin E giúp hỗ trợ phát triển não bộ và thị giác, đồng thời giúp bé tiêu hóa dễ dàng hơn. Similac Soy Isomil là lựa chọn lý tưởng cho bé có hệ tiêu hóa nhạy cảm, mang đến sự phát triển khỏe mạnh ngay từ giai đoạn đầu đời.', N'Mỹ', N'similacsony.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (17, N'PediaSure  900g S1+', 700000, N'PediaSure 900g là sữa dinh dưỡng cao cấp dành cho trẻ từ 1-10 tuổi, đặc biệt phù hợp với bé biếng ăn, chậm tăng cân hoặc cần bổ sung dưỡng chất để phát triển toàn diện. Công thức chứa Triple Sure với 37 dưỡng chất thiết yếu, bao gồm DHA, vitamin, khoáng chất và lợi khuẩn FOS & HMO, giúp hỗ trợ hệ tiêu hóa, tăng cường miễn dịch và phát triển não bộ. PediaSure giúp bé bắt kịp đà tăng trưởng, cải thiện cân nặng, chiều cao và duy trì sức khỏe tối ưu.', N'Mỹ', N'pediasure900g.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (18, N'Grow 3 1 Tuổi  S1/0+ 900g/850g', 600000, N'Grow Abbott 3 là sữa dinh dưỡng dành cho trẻ từ 1-2 tuổi, giúp hỗ trợ phát triển chiều cao, cân nặng và trí não trong giai đoạn tăng trưởng quan trọng. Công thức giàu DHA, Canxi, Vitamin D và FOS giúp tăng cường sức khỏe xương, hỗ trợ hệ tiêu hóa và nâng cao sức đề kháng. Grow Abbott 3 cung cấp nguồn dinh dưỡng cân đối, giúp bé phát triển toàn diện và khỏe mạnh trong những năm đầu đời.', N'Mỹ', N'grow3_900g.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (19, N'Friso 4 900g', 550000, N'Sữa Friso Gold số 4 850g với thiết kế cải tiến mới, cung cấp đầy đủ dưỡng chất như: Kẽm, Nucleotides và Selen mang lại cho bé nguồn dinh dưỡng cần thiết ngoài các bữa ăn chính, giúp hỗ trợ hệ miễn dịch và bảo vệ bé từ bên trong. Sữa Friso Gold 4 850g thơm ngon, dễ uống, mang lại cho các bé từ 2 - 6 tuổi nguồn dinh dưỡng cần thiết', N'Hà Lan', N'friso4_900g.jpg', 1, 6)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (20, N'Friso 1 900g', 650000, N'Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ', N'Hà Lan', N'friso1_900g.jpg', 1, 6)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (21, N'Friso 3 900g', 600000, N'Sữa Frisolac Gold 3 850g là loại sữa bột cho bé từ 1-2 tuổi cung cấp kẽm, sắt và nucleotides, tăng sức đề kháng tự nhiên cho cơ thể, nhờ vậy giúp bé luôn khỏe mạnh ngay từ bên trong để khám phá thế giới rộng lớn bên ngoài. Ngoài ra, sữa Frisolac Gold 3 cung cấp các dưỡng chất quan trọng hỗ trợ tăng trưởng và sự phát triển toàn diện của trẻ như Vitamin D, Taurin, Selen, DHA, Prebiotics, Probiotics và Canxi. Sản phẩm Frisolac Gold 3 850g hoàn toàn không có chất bảo quản, chất tạo mùi nên bạn có thể yên tâm về chất lượng và tuyệt đối an toàn cho bé.', N'Hà Lan', N'friso3_900g.jpg', 1, 6)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (22, N'Friso 2 900g', 650000, N'Sữa Frisolac Gold 2 850g dành cho trẻ từ 6-12 tháng, cung cấp các dưỡng chất quan trọng để hỗ trợ hệ tiêu hóa và đường ruột của bé khỏe mạnh với Prebiotic(GOS). Ngoài ra, sữa Frisolac 2 cũng giúp cân bằng các dưỡng chất như DHA và AA cho sự phát triển não bộ, và chất chống oxy hóa như Vitamin A, Vitamin C và Vitamin E đối với sức khỏe miễn dịch.', N'Hà Lan', N'friso2_900g.jpg', 1, 6)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (23, N'Friso Gold Pro 4 900g', 650000, N'Sữa Friso Gold Pro 4 là sản phẩm nhập khẩu 100% từ châu Âu với chất lượng được kiểm chứng qua công nghệ TrackEasy. Sữa Friso Gold Pro 4 800g được sản xuất trên dây chuyền hiện đại, cao cấp tại Hà Lan.', N'Hà Lan', N'frisogold.jpg', 1, 6)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (24, N'Healthy Care số 3 900g', 560000, N'Sữa bột Healthy Care dùng bổ sung dinh dưỡng hoặc thay thế bữa ăn cho trẻ 1 tuổi trở lên giúp trẻ phát triển tốt các tố chất sức khoẻ.', N'Úc', N'healthycareso3.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (25, N'Healthy Care số 2 900g', 520000, N'Sữa bột Healthy Care là sản phẩm nghiên cứu đặc biệt cho trẻ từ 6-12 tháng tuổi, chứa công thức độc đáo và các thành phần dinh dưỡng cân đối giúp cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của bé.', N'Úc', N'healthycareso2.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (26, N'Healthy Care số 1 900g', 550000, N'Sữa Healthy Care số 1 Úc Infant 900g dành cho trẻ 0 - 6 tháng phát triển não bộ, giúp trẻ thông minh', N'Úc', N'healthycareso1.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (27, N'Siro Vitamin D3 K2 25ml', 350000, N'Healthy Care Vitamin D3+K2 MK7 25ml được bào chế với sự kết hợp đồng bộ giữa Vitamin D3 và Vitamin K2 MK7, để hỗ trợ xương chắc khỏe ở trẻ em.', N'Úc', N'sirohealthycare1.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (28, N'Kẹo dẻo Gummy Omega 3', 450000, N'Kẹo dẻo Gummy Omega 3 Úc Healthy Care hay còn được gọi với cái tên Healthy Care Gummy Omega 3 250 Gummies được nghiên cứu và sản xuất bởi các chuyên gia chăm sóc sức khỏe trẻ em từ hãng Healthy Care hàng đầu tại Úc từ dầu cá tự nhiên chứa omega 3 cung cấp một lượng lớn DHA (>32mg/1 viên) một loại axit béo không no thuộc nhóm omega-3 đóng vai trò quan trọng trong sự phát triển thị giác và trí tuệ ở trẻ.', N'Úc', N'keodeo3.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (29, N'Kẹo dẻo Multivitamin', 450000, N'Kẹo dẻo Gummy Multivitamin Healthycare là sản phẩm được các chuyên gia nghiên cứu khá kỹ lưỡng về thành phần, hàm lượng và sản xuất dưới dạng kẹo dẻo giúp bé dễ dàng ăn ngon miệng, bổ sung vitamin và khoáng chất giúp bé có hệ miễn dịch tự nhiên khỏe mạnh.', N'Úc', N'keomulti.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (30, N'Viên uống Milk Canxi', 300000, N'Viên uống HealthyCare Kids Milk Canxi 4m+(60v) hay còn được biết đến với cái tên canxi sữa Healthy Care của Úc là một sản phẩm có nguồn gốc từ sữa bò cung cấp Canxi và Vitamin D, cho bé từ 4 ttháng tuổi trở lên, hỗ trợ sự phát triển của xương và răng cho trẻ cao lớn hơn.', N'Úc', N'vienuongkid.jpg', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (31, N'Sữa Pre Nan Hà Lan 380g 1 tuổi trở lên ', 250000, N'Sữa Pre Nan là một trong những sản phẩm sữa bột cho bé thiếu tháng, thiếu cân (nhẹ cân) cung cấp hàm lượng chất dinh dưỡng hợp lý đáp ứng được nhu cầu tăng trưởng nhanh của trẻ từ lúc mới sinh, được rất nhiều bà mẹ ưa chuộng và lựa chọn.', N'Hà Lan', N'halan380g.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (32, N'Sữa Nutren Junior 400g 1 tuổi ', 370000, N'Sữa Nutren Junior 400g phát triển não bộ - thể chất cho bé (1 - 10 tuổi)', N'Hà Lan', N'nutrenjunior.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (33, N'Sữa Kid Essentials 800g', 560000, N'Sữa Kid Essentials 800g cho bé 1-10 tuổi hỗ trợ tăng cân', N'Hà Lan', N'kid_essential.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (34, N'Sữa Nan Nga số 4 800g (> 18 tháng)', 530000, N'Sữa Nan Nga số 4 800g mẫu mới được Nestlé - một trong những công ty hàng đầu về thực phẩm và đồ uống hiện nay phát triển dựa trên nền tảng sữa Nan số 1, 2, 3 hiện nay. Sữa Nan được đánh giá là một trong những dòng sữa bột cho bé giàu chất dinh dưỡng, cung cấp đầy đủ các dưỡng chất giúp bé phát triển toàn diện về thể chất cũng như trí não.', N'Nga', N'naso4_900g.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (35, N'Sữa Nan Optipro Plus Số 3 5HMO 800g', 470000, N'Sữa Nan Optipro Plus Số 3 5HMO 800g được đánh giá cao bởi các mẹ vì chất lượng tốt, công thức tiên tiến và phù hợp với nhu cầu dinh dưỡng của trẻ từ 1 đến 2 tuổi. Nan Optipro Plus 3 giúp hỗ trợ hệ miễn dịch, tiêu hóa và phát triển não bộ cho bé một cách toàn diện.', N'Thụy Sĩ', N'nanso3_900g.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (36, N'Sữa bột S-26 Ultima 3 750g ', 850000, N'Sữa bột S26 Ultima 3 750g là sản phẩm được nghiên cứu dành riêng cho trẻ từ 2-6 tuổi, với công thức độc đáo cùng các thành phần dinh dưỡng cân đối cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của trẻ.', N'Thụy Sĩ', N'sua-bot-s-26-ultima-3-750g-danh-cho-be-tu-2-6-tuoi-1.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (37, N'Sữa bột S-26 Ultima 1 750g', 950000, N'Sữa bột S-26 Ultima 1 750g dành cho bé từ 0-12 tháng tuổi phát triển não bộ, giúp trẻ thông minh', N'Thụy Sĩ', N'sua-bot-s-26-ultima-1-750g-danh-cho-be-tu-0-12-thang-tuoi-1.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (38, N'Sữa bột S-26 Ultima 1 350g ', 450000, N'Sữa bột S26 Ultima 1 350g là sản phẩm nghiên cứu đặc biệt cho trẻ từ 0-12 tháng tuổi, chứa công thức độc đáo và các thành phần dinh dưỡng cân đối giúp cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của bé.', N'Thụy Sĩ', N'sua-bot-s-26-ultima-1-350g-danh-cho-be-tu-0-12-thang-tuoi-1.jpg', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (39, N'Sữa Aptamil Úc Profutura số 4 900g cho bé 3Y+', 900000, N'Sữa Aptamil Úc số 4 900g cho bé từ 3 tuổi trở lên', N'New Zealand', N'sua-aptamil-profutura-uc-so-4-900g-cho-be-tu-3-tuoi-tro-le-1.jpg', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (40, N'Sữa Aptamil Úc Profutura số 3 900g cho bé 12M-36M', 900000, N'Sữa Aptamil Úc số 3 900g cho bé 12M-36M hỗ trợ bé phát triển toàn diện', N'New Zealand', N'sua-aptamil-profutura-uc-so-3-900g-cho-be-12m-36-1.jpg', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (41, N'Sữa Aptamil Profutura Úc số 2 900g cho bé 6-12M', 970000, N'Sữa Aptamil Profutura Úc số 2 900g dinh dưỡng cung cấp dưỡng chất cho bé từ 6 đến 12 tháng tuổi.', N'New Zealand', N'sua-aptamil-profutura-uc-so-2-900g-cho-be-6-12-1.jpg', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (42, N'Sữa Aptamil Profutura Úc số 1 900g cho bé 0-6M', 980000, N'Sữa Aptamil Úc số 1 Profutura 900g cho bé trong độ tuổi từ 0 đến 6 tháng tuổi', N'New Zealand', N'sua-aptamil-profutura-uc-so-1-900g-cho-be-0-6m-a.jpg', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (43, N'Sữa Aptamil Hà Lan Profutura Duobiotik  số 1 cho bé 0-6M 800g', 860000, N'Sữa Aptamil Profutura Duobiotik 1 800g dành cho bé từ 0-6M', N'Hà Lan', N'sua-bot-aptamil-ha-lan-profutura-duobiotik-1-800g1_1.jpg', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (44, N'Sữa Meiji số 9 nội địa Nhật 800g cho bé 1Y-3Y', 400000, N'Sữa meji rất tốt nhiều dưỡng chất và dha giúp bé phát triển toàn diện. Chiều cao và cân nặng đều tăng đều. Vị thơm mát bé rất thích', N'Nhật Bản', N'sua-bot-meiji-so-9-nhat-800g-cho-be-1y-3y-a_1.jpg', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (45, N'Sữa Meiji số 0 nội địa Nhật 800g cho bé 0-12M', 500000, N'Là một trong số những thương hiệu sữa hàng đầu tại Nhật - đất nước nổi tiếng lâu đời bởi sự khắt khe trong khâu kiểm duyệt hàng hoá trước khi ra mắt thị trường, sữa Meiji Nhật Bản ngày càng được nhiều mẹ Việt tin tưởng lựa chọn. Trong đó không thể không nhắc đến sữa Meiji số 0 nội địa cho bé bổ sung đầy đủ các dưỡng chất thiết yếu để bé phát triển toàn diện về thể chất lẫn trí tuệ.', N'Nhật Bản', N'sua-meiji-so-0-noi-dia-nhat-800g-cho-be-abc.jpg', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (46, N'Sữa Meiji Infant Formula 800g 0-1Y', 550000, N'Sữa Meiji Infant Formula được sản xuất theo nghiên cứu dành cho trẻ em Việt Nam trên dây chuyền hiện đại của Nhật Bản, hoàn toàn tự động, đạt tiểu chuẩn ISO 9001. Cung cấp đầy đủ dưỡng chất, vitamin, khoáng chất cần thiết giúp trẻ phát triển toàn diện nhất.', N'Nhật Bản', N'meji0-1.jpg', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (47, N'Sữa Meiji Growing 800g 1Y-3Y', 550000, N'Sữa Meiji Growing Up Formula 800g nhập khẩu chính hãng từ Nhật Bản, được kiểm duyệt thông tin kỹ càng trước khi cung cấp ra ngoài thị trường. Hiện nay, sản phẩm sữa meiji số 9 nhập khẩu là sự lựa chọn hàng đầu của các bố mẹ có con nhỏ muốn nâng cao trí tuệ và thể chất cho bé từ những tháng đầu đời.', N'Nhật Bản', N'sua-bot-meiji-growing-up-formula-800g-cho-be-1y-3y-1_1.jpg', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (48, N'Sữa Meiji thanh số 0 nội địa Nhật (30 thanh) cho bé 0-1Y', 650000, N'Sữa meiji thanh số 0 nội địa Nhật được thiết kế dạng thanh cô đặc rất thuận tiện cho bạn khi mang đi xa, đi du lịch hoặc đi nội ngoại. Thay vì cầm một hộp to các mẹ có thể gói nhỏ vài thanh vào trong túi đựng đồ của bé. Sản phẩm sữa Meiji thanh 0-1 nội địa cung cấp các dưỡng chất cần thiết, giúp bé tăng cân, sức đề kháng. Đây là một trong những dòng sữa thanh được nhiều bà mẹ tại Nhật tin tưởng và lựa chọn cho bé từ 0 tới 1 tuổi. ', N'Nhật Bản', N'sua-meiji-so-0-noi-dia-nhat-30-thanh-cho-be-0-1y-1.jpg', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (49, N'Sữa Vinamilk Optimum Gold 4 850g cho bé 2-6 tuổi', 500000, N'Vinamilk Optimum Gold là sản phẩm dinh dưỡng hỗ trợ các bé phát triển trí tuệ, bổ sung thêm các dưỡng chất thiết yếu (khoáng chất, vitamin, chất xơ,...) để bé tăng cường thể chất, trí não và sức đề kháng. Tất tần tật các thông tin về sữa bột Vinamilk Optimum Gold 4 được chúng tôi chia sẻ dưới đây sẽ giúp khách hàng lựa chọn đúng dòng sữa phù hợp với nhu cầu sử dụng của trẻ.', N'Việt Nam', N'sua-vinamilk-optimum-gold-4-850g-cho-be-2-6-tuoi-1.jpg', 1, 7)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (50, N'Sữa Vinamilk Optimum Gold 3 850g cho bé 1-2Y', 500000, N'Vinamilk Optimum Gold là sản phẩm dinh dưỡng hỗ trợ các bé phát triển trí tuệ, bổ sung thêm các dưỡng chất thiết yếu (khoáng chất, vitamin, chất xơ,...) để bé tăng cường thể chất, trí não và sức đề kháng. Tất tần tật các thông tin về sữa bột Vinamilk Optimum Gold 4 được chúng tôi chia sẻ dưới đây sẽ giúp khách hàng lựa chọn đúng dòng sữa phù hợp với nhu cầu sử dụng của trẻ.', N'Việt Nam', N'sua-vinamilk-optimum-gold-3-850g-cho-be-1-2y-1.jpg', 1, 7)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (51, N'Sữa Vinamilk Yoko Gold 3 850g cho bé 2Y-6Y', 500000, N'Sữa Vinamilk Yoko Gold số 3 là sản phẩm dinh dưỡng hỗ trợ các bé phát triển trí tuệ, bổ sung thêm các dưỡng chất thiết yếu (khoáng chất, vitamin, chất xơ,...) để bé tăng cường thể chất, trí não và sức đề kháng. Tất tần tật các thông tin về sữa bột Vinamilk Optimum Gold 4 được chúng tôi chia sẻ dưới đây sẽ giúp khách hàng lựa chọn đúng dòng sữa phù hợp với nhu cầu sử dụng của trẻ.', N'Việt Nam', N'sua-bot-vinamilk-yoko-gold-3-850g_1_.jpg', 1, 7)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (52, N'Sữa bột Vinamilk Dielac Grow Plus 2+ 850g New cho bé 2-10 tuổi', 500000, N'Sữa bột Vinamilk Dielac Grow Plus dinh dưỡng chuyên biệt, hiệu quả cho trẻ suy dinh dưỡng, thấp còi. Nay bổ sung sữa non (Colostrum) và HMO.', N'Việt Nam', N'sua-bot-vinamilk-dielac-grow-plus-2-850g-new-cho-be-2-10-tuoi-a.jpg', 1, 7)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (53, N'Sữa Vinamilk Optimum Gold 2 800g cho bé 6M-12M', 480000, N'Sữa bột Vinamilk Optimum Gold 2 là sự lựa chọn tốt nhất cho các bé từ 6-12 tháng tuổi trong giai đoạn cần phát triển trí tuệ, bổ sung thêm các dưỡng chất thiết yếu (khoáng chất, vitamin, chất xơ,...) để bé tăng cường thể chất, trí não và sức đề kháng. Tất tần tật các thông tin về sữa bột Vinamilk Optimum Gold 2 được chúng tôi chia sẻ dưới đây sẽ giúp khách hàng lựa chọn đúng dòng sữa phù hợp với nhu cầu sử dụng của trẻ.', N'Việt Nam', N'sua-vinamilk-optimum-gold-2-800g-cho-be-6m-12m-a.jpg', 1, 7)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (54, N'Sữa bột Vinamilk Dielac Grow Plus 1+ 850g New cho bé 1-2 tuổi', 450000, N'Sữa bột Vinamilk Dielac Grow Plus 1+ 850g New dành cho bé 1-2 tuổi', N'Việt Nam', N'sua-bot-vinamilk-dielac-grow-plus-1-850g-new-cho-be-1-2-tuoi-a.jpg', 1, 7)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (55, N'Nutifood GrowPlus+ 800g (0-12M)', 560000, N'Sữa bột Nutifood GrowPlus+ Boosting Digestion 800g, lựa chọn hoàn hảo cho sự phát triển toàn diện của trẻ', N'Singapore', N'sua-bot-nutifood-growplus-boosting-digestion-800g-0-12m.jpg', 1, 8)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (56, N'Nutifood GrowPlus+ 400g (0-12M)', 350000, N'Sữa bột Nutifood GrowPlus+ Boosting Digestion 400g, lựa chọn hoàn hảo cho sự phát triển toàn diện của trẻ', N'Singapore', N'sua-bot-nutifood-growplus-boosting-digestion-400g-0-.jpg', 1, 8)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (57, N'GrowPlus+ Vàng 800g (0-12M)', 580000, N'Sữa bột Nutifood Grow Plus+ Vàng 800g - Sữa non tăng cường hệ miễn dịch cho bé 0-12 tháng', N'Sigapore', N'sua-bot-nutifood-growplus-vang-sua-non-800g-0-12m-1.jpg', 1, 8)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (58, N'GrowPlus+ Vàng 400g (0-12M)', 380000, N'Sữa bột Nutifood Grow Plus+ Vàng 400g - Sữa non tăng cường hệ miễn dịch cho bé 0-12 tháng', N'Sigapore', N'sua-bot-nutifood-growplus-vang-sua-non-400g-0-12m-2.jpg', 1, 8)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (59, N'GrowPlus+ 1+ 400g', 520000, N'Sữa bột Nutifood GrowPlus+ Height Boosting 1+ 800g cung cấp dinh dưỡng cho bé 1-2Y', N'Sigapore', N'sua-bot-nutifood-growplus-height-boosting-1-800g-cho-be-1-2y-1.jpg', 1, 8)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (60, N'GrowPlus+ 1+ 800g', 520000, N'Sữa bột Nutifood GrowPlus+ Height Boosting 1+ 800g cung cấp dinh dưỡng cho bé 1-2Y', N'Sigapore', N'sua-bot-nutifood-growplus-height-boosting-1-800g-cho-be-1-2y-1 (1).jpg', 1, 8)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (61, N'TH True Milk Formula số 1 400g', 550000, N'Sữa TH True Milk Formula số 1 (0-6 tháng) là dòng sản phẩm sữa bột được thiết kế đặc biệt để cung cấp dinh dưỡng cân đối, hỗ trợ sự phát triển toàn diện của bé yêu trong giai đoạn đầu đời', N'Úc', N'sua-th-true-milk-formula-so-1-0-6m.jpg', 1, 9)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (62, N'TH True Milk Formula số 2 400g', 550000, N'Sữa TH True Milk Formula số 2 là sản phẩm dinh dưỡng cao cấp dành riêng cho bé từ 6-12 tháng tuổi. Với công thức tối ưu, không chỉ giúp bé phát triển toàn diện mà còn hỗ trợ hệ tiêu hóa và tăng cường đề kháng. Sản phẩm được sản xuất theo tiêu chuẩn quốc tế, mang lại sự an tâm tuyệt đối cho mẹ khi lựa chọn.', N'Úc', N'sua-th-true-milk-formula-so-2-6-12m.jpg', 1, 9)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (63, N'TH True Milk Formula số 4 900g', 550000, N'Sữa bột TH True Milk Formula số 4 (2Y+) bổ xung dinh dưỡng cho bé từ 2 tuổi', N'Úc', N'sua-bot-th-true-milk-formula-so-4-2y-1.jpg', 1, 9)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (64, N'TH True Milk Formula số 3 900g', 500000, N'Sữa bột TH True Milk Formula số 3 (12-24m) cung cấp dinh dưỡng cho bé yêu của bạn', N'Úc', N'sua-bot-th-true-milk-formula-so-3-12-24m-1.jpg', 1, 9)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (65, N'TH True Milk Formula số 3 400g', 500000, N'Sữa bột TH True Milk Formula số 3 (12-24m) cung cấp dinh dưỡng cho bé yêu của bạn', N'Úc', N'sua-bot-th-true-milk-formula-so-3-12-24m-1.jpg', 1, 9)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (66, N'TH True Milk Formula số 4 400g', 400000, N'Sữa bột TH True Milk Formula số 4 (2Y+) bổ xung dinh dưỡng cho bé từ 2 tuổi', N'Úc', N'sua-bot-th-true-milk-formula-so-4-2y-1.jpg', 1, 9)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (67, N'HiPP Organic số 1 (400g)', 650000, N'HiPP là thương hiệu sữa công thức hữu cơ nổi tiếng hàng đầu tại Châu Âu với nhiều năm kinh nghiệm. Sữa dê HiPP Organic số 1 được sản xuất từ những nguyên liệu hữu cơ Organic tốt nhất - Vượt tiêu chuẩn do EU đặt ra.', N'Đức', N'sua-bot-hipp-so-1-organic-combiotic-hmp-800gr-cho-be-tu-3-tuoi.jpg', 1, 10)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (68, N'HiPP Organic số 2 (400g)', 600000, N'HiPP là thương hiệu sữa công thức hữu cơ nổi tiếng hàng đầu tại Châu Âu với nhiều năm kinh nghiệm. Sữa dê HiPP Organic số 1 được sản xuất từ những nguyên liệu hữu cơ Organic tốt nhất - Vượt tiêu chuẩn do EU đặt ra.', N'Đức', N'sua-de-hipp-organic-2-400g-1.jpg', 1, 10)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (69, N'HiPP Organic số 3 Organic (800g)', 800000, N'Sữa Hipp số 3 Organic Combiotic HMP 800gr cho bé từ 1-3 tuổi', N'Đức', N'sua-bot-hipp-so-1-organic-combiotic-hmp-800gr-cho-be-tu-1-3-tuoi.jpg', 1, 10)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (70, N'HiPP Organic số 4 Organic (800g)', 800000, N'Sữa Hipp số 3 Organic Combiotic HMP 800gr cho bé từ 1-3 tuổi', N'Đức', N'sua-bot-hipp-so-1-organic-combiotic-hmp-800gr-cho-be-tu-3-tuoi.jpg', 1, 10)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (71, N'Nutricare Colos 0+ 800g', 390000, N'Sữa bột Nutricare Colos 24h Grow Plus 0+ năng lượng cao cùng sữa non 24h tăng đề kháng, bổ sung 52 dưỡng chất thiết yếu cùng bộ 3 Canxi, D2, Phốt pho cao lớn vượt trội.', N'Việt Nam', N'sua-bot-nutricare-colos-24h-grow-plus-0-800g-cho-be-0-12m-1.jpg', 1, 11)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (72, N'Nutricare Colos 2+ 800g', 390000, N'Bé suy dinh dưỡng thấp còi do ăn uống kém không cung cấp đủ năng lượng cho cơ thể để có thể tăng trưởng thì sữa Colos24h Grow Plus 2+ được thiết kế với công thức cao năng lượng 100Kcal/100ml kết hợp cùng với sữa non 24h nhập khẩu từ Mỹ và 52 dưỡng chất thiết yếu đáp ứng đầy đủ cân đối dưỡng chất cho con.', N'Việt Nam', N'sua-bot-nutricare-colos-24h-grow-plus-2-850g-cho-be-2-10y-1.jpg', 1, 11)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (73, N'Nutricare Colos 1+ 850g', 370000, N'Sữa bột Nutricare Colos 24h Grow Plus 1+ năng lượng cao cùng sữa non 24h tăng đề kháng, bổ sung 52 dưỡng chất thiết yếu cùng bộ 3 Canxi, D2, phốt pho cao lớn vượt trội, DHA hỗ trợ phát triển não bộ.', N'Việt Nam', N'-sua-bot-nutricare-colos-24h-grow-plus-1-850g-cho-be-1-2y-1.jpg', 1, 11)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (74, N'Metacare 2+ 850g', 300000, N'Sữa bột Metacare 2+ 850g (Xanh) dành cho bé từ 2-10 tuổi', N'Việt Nam', N'sua-bot-metacare-2-850g-danh-cho-be-tu-2-10-tuoi-xanh.jpg', 1, 11)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (75, N'ColosCare 2+ 850g', 400000, N'Sữa bột ColosCare 24h 2+ 800g dành cho bé từ 2-10 tuổi', N'Việt Nam', N'sua-bot-coloscare-24h-2-800g-danh-cho-be-tu-2-10-tuoi-1a.jpg', 1, 11)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (76, N'ColosCare 0+ 850g', 500000, N'Sữa bột ColosCare 24h 2+ 800g dành cho bé từ 0-12 tháng', N'Việt Nam', N'sua-bot-coloscare-24h-0-800g-danh-cho-be-0-12-thang-tuoi-1.jpg', 1, 11)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (77, N'Enfamil A2 Neuropro 1 800g', 800000, N'Sữa Enfamil A2 Neuropro 1 800g Infant Formula dành cho trẻ từ 0-6 tháng.', N'Thái Lan', N'sua-enfamil-a2-neuropro-1-800g-danh-cho-tre-tu-0-6-thang-10.jpg', 0, 12)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (78, N'Enfamil A2 Neuropro 3 800g', 730000, N'Sữa Enfamil A2 Neuropro 1 800g Infant Formula dành cho trẻ từ 1-6 tuổi.', N'Thái Lan', N'sua-enfagrow-a2-neuropro-3-800g-cho-tre-tu-1-6-tuoi-10.jpg', 0, 12)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (79, N'Enfamil A2 Neuropro 2 800g', 830000, N'Sữa Enfamil A2 Neuropro 1 800g Infant Formula dành cho trẻ từ 6-12 tháng.', N'Thái Lan', N'sua-enfamil-a2-neuropro-2-800g-danh-cho-tre-tu-6-12-thang-12.jpg', 0, 12)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (80, N'Enfamil A2 Neuropro 1 400g', 400000, N'Sữa Enfamil A2 Neuropro 1 800g Infant Formula dành cho trẻ từ 0-6 tháng.', N'Thái Lan', N'sua-enfamil-a2-neuropro-1-800g-danh-cho-tre-tu-0-6-thang-10.jpg', 0, 12)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (81, N'Enfagrow A+ 1+ 900g', 400000, N'Sữa Enfamil A+ Neuropro số 1 phù hợp với trẻ sơ sinh. Bước vào giai đoạn 0-6 tháng tuổi.', N'Thái Lan', N'sua-bot-enfagrow-a-neuropro-so-1-830g-cho-be-tu-0-6-thang-tuoi-1.jpg', 0, 12)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (82, N'Enfagrow A+ 3 (1,7kg)  ', 900000, N'Sữa Enfagrow A+ NeuroPro 3 (1,7kg) - Không đường Sucrose - 2Flex', N'Thái Lan', N'sua-bot-enfagrow-a-neuropro-hmo-so-3-1-7kg-cho-be-tu-1-3-tuoi-vi-nhat-de-uong-5.jpg', 0, 12)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (98, N'Sữa nước ensure cho người lớn tuổi', 60000, N'Sữa nước Ensure là sản phẩm dinh dưỡng hoàn chỉnh và cân đối, bổ sung 28 vitamin và khoáng chất thiết yếu, giàu đạm và chất béo tốt, giúp phục hồi sức khỏe, tăng cường đề kháng, phù hợp cho người lớn tuổi, người bệnh cần hồi phục hoặc người ăn uống kém.', N'Mỹ', N'ensure.jpg', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (99, N'HiPP Organic số 3 Organic (400g)', 400000, N'Sữa Hipp số 3 Organic Combiotic HMP 800gr cho bé từ 1-3 tuổi', N'Đức', N'sua-bot-hipp-so-1-organic-combiotic-hmp-800gr-cho-be-tu-1-3-tuoi.jpg', 1, 10)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [DonGia], [MoTa], [XuatXu], [HinhAnh], [Status], [IdDanhMuc]) VALUES (100, N'Sữa nước ensure ', 30000, NULL, NULL, N'ensure.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [NameUser], [Password], [Gmail], [Role]) VALUES (1, N'Thúy Kiều', N'123', N'kieuadmin@gmail.com', N'Admin')
INSERT [dbo].[User] ([IdUser], [NameUser], [Password], [Gmail], [Role]) VALUES (2, N'Gia Bảo', NULL, NULL, N'Nhân Viên')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[VnPay] ON 

INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (0, N'Thanh toán cho đơn hàng:0', N'14919784', N'-1', N'VnPay', CAST(N'2025-04-22T11:01:43.410' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (1, N'Thanh toán cho đơn hàng:0', N'14911766', N'-1', N'VnPay', CAST(N'2025-04-17T14:15:01.737' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (2, N'Thanh toán cho đơn hàng:0', N'14911778', N'-1', N'VnPay', CAST(N'2025-04-17T14:18:53.767' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (3, N'Thanh toán cho đơn hàng:0', N'14911783', N'-1', N'VnPay', CAST(N'2025-04-17T14:21:16.353' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (4, N'Thanh toán cho đơn hàng:0', NULL, N'-1', N'VnPay', CAST(N'2025-04-17T14:24:17.703' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (5, N'Thanh toán cho đơn hàng:0', N'14911810', N'-1', N'VnPay', CAST(N'2025-04-17T14:34:18.383' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (6, N'Thanh toán cho đơn hàng:0', N'14911819', N'-1', N'VnPay', CAST(N'2025-04-17T14:39:26.840' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (7, N'Thanh toán cho đơn hàng:0', N'14911823', N'-1', N'VnPay', CAST(N'2025-04-17T14:41:29.320' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (8, N'Thanh toán cho đơn hàng:0', NULL, N'-1', N'VnPay', CAST(N'2025-04-17T15:00:12.923' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (9, N'Thanh toán cho đơn hàng:0', NULL, N'-1', N'VnPay', CAST(N'2025-04-17T15:02:01.750' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (10, N'Thanh toán cho đơn hàng:0', NULL, N'-1', N'VnPay', CAST(N'2025-04-17T15:03:38.040' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (11, N'Thanh toán cho đơn hàng:0', N'14911892', N'-1', N'VnPay', CAST(N'2025-04-17T15:05:44.253' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (12, N'Thanh toán cho đơn hàng:0', N'14914700', N'-1', N'VnPay', CAST(N'2025-04-19T00:28:00.880' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (13, N'Thanh toán cho đơn hàng:0', N'14915215', N'-1', N'VnPay', CAST(N'2025-04-19T13:43:29.397' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (14, N'Thanh toán cho đơn hàng:0', N'14919445', N'-1', N'VnPay', CAST(N'2025-04-22T08:43:59.830' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (15, N'Thanh toán cho đơn hàng:0', N'14919478', N'-1', N'VnPay', CAST(N'2025-04-22T08:58:16.137' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (16, N'Thanh toán cho đơn hàng:0', N'14919505', N'-1', N'VnPay', CAST(N'2025-04-22T09:12:27.290' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (17, N'Thanh toán cho đơn hàng:0', N'14919536', N'-1', N'VnPay', CAST(N'2025-04-22T09:25:37.140' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (18, N'Thanh toán cho đơn hàng:0', N'14920697', N'638809401751247197', N'VnPay', CAST(N'2025-04-22T17:37:04.860' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (19, N'Thanh toán cho đơn hàng:0', N'14920706', N'638809403505098236', N'VnPay', CAST(N'2025-04-22T17:40:02.493' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (20, N'Thanh toán cho đơn hàng:   1100000', N'14920715', N'638809406283071086', N'VnPay', CAST(N'2025-04-22T17:44:18.283' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (21, N'Thanh toán cho đơn hàng: Nguyễn Nhật Thi Nguyễn Nhật Thi 3798375345 800000', N'14920718', N'638809408109546104', N'VnPay', CAST(N'2025-04-22T17:47:30.347' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (22, N'Thanh toán cho đơn hàng: Nguyễn Nhật Thi Nguyễn Nhật Thi 3798375345 500000', N'14920787', N'638809450979691669', N'VnPay', CAST(N'2025-04-22T18:58:57.073' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (23, N'Thanh toán cho đơn hàng: Nguyễn Nhật Thi Nguyễn Nhật Thi 3798375345 800000', N'14921551', N'638809928370544831', N'VnPay', CAST(N'2025-04-23T08:17:55.063' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (24, N'Thanh toán cho đơn hàng: Nguyễn Nhật Thi, Thanh toán:400,000VND', N'14921618', N'638809958184548276', N'VnPay', CAST(N'2025-04-23T09:04:23.983' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (25, N'Thanh toán cho đơn hàng: Thúy Kiều, Thanh toán:800,000VND', N'14933210', N'638816373533295996', N'VnPay', CAST(N'2025-04-30T19:16:43.957' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (26, N'Thanh toán cho đơn hàng: Nguyễn Kim Phụng , Thanh toán: 550,000VND', N'14935306', N'638818592138569461', N'VnPay', CAST(N'2025-05-03T08:54:21.583' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (27, N'Thanh toán cho đơn hàng: Nguyễn Kim Phụng , Thanh toán: 770,000VND', N'14935664', N'638818797569541992', N'VnPay', CAST(N'2025-05-03T14:37:42.623' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (28, N'Thanh toán cho đơn hàng: Nguyễn Kim Phụng , Thanh toán: 1,100,000VND', N'14936628', N'638819456233116239', N'VnPay', CAST(N'2025-05-04T08:54:12.907' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (29, N'Thanh toán cho đơn hàng: Nguyễn Kim Phụng , Thanh toán: 480,000VND', N'14937454', N'638819807470489987', N'VnPay', CAST(N'2025-05-04T18:40:15.097' AS DateTime))
INSERT [dbo].[VnPay] ([Id], [OrderDescription], [TransactionId], [OrderId], [PaymentMethod], [DatedCreated]) VALUES (30, N'Thanh toán cho đơn hàng: Nguyễn Kim Phụng , Thanh toán: 500,000VND', N'14943489', N'638822249617143283', N'VnPay', CAST(N'2025-05-07T14:29:45.820' AS DateTime))
SET IDENTITY_INSERT [dbo].[VnPay] OFF
GO
ALTER TABLE [dbo].[LienHe] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__IdDon__3F466844] FOREIGN KEY([IdDonHang])
REFERENCES [dbo].[DonHang] ([IdDonHang])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__IdDon__3F466844]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDon__IdSP__403A8C7D] FOREIGN KEY([IdSP])
REFERENCES [dbo].[SanPham] ([IdSP])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDon__IdSP__403A8C7D]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_IdKH] FOREIGN KEY([IdKH])
REFERENCES [dbo].[KhachHang] ([IdKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_IdKH]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__IdDanhM__398D8EEE] FOREIGN KEY([IdDanhMuc])
REFERENCES [dbo].[DanhMuc] ([IdDanhMuc])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__IdDanhM__398D8EEE]
GO

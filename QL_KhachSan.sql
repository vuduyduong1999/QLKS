USE [master]
GO
/****** Object:  Database [QL_KhachSan]    Script Date: 8/6/2020 3:21:59 AM ******/
CREATE DATABASE [QL_KhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_KhachSan', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_KhachSan.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_KhachSan_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_KhachSan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_KhachSan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_KhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_KhachSan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_KhachSan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_KhachSan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_KhachSan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_KhachSan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_KhachSan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_KhachSan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_KhachSan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_KhachSan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_KhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_KhachSan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_KhachSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_KhachSan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_KhachSan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_KhachSan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_KhachSan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_KhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_KhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_KhachSan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_KhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_KhachSan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_KhachSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_KhachSan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_KhachSan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_KhachSan] SET  MULTI_USER 
GO
ALTER DATABASE [QL_KhachSan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_KhachSan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_KhachSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_KhachSan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_KhachSan]
GO
/****** Object:  Table [dbo].[BangGiaPhong]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangGiaPhong](
	[Gia] [money] NULL,
	[MaLoaiMuon] [int] NOT NULL,
	[MaLoaiPhong] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BangGiaPhong] PRIMARY KEY CLUSTERED 
(
	[MaLoaiMuon] ASC,
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaHD] [int] NOT NULL,
	[MaDV] [nvarchar](50) NOT NULL,
	[PhuThu] [money] NULL,
	[ThanhTienDV] [money] NULL,
	[SoLuong] [int] NULL,
	[ThanhTienPhong] [money] NULL,
	[DonGiaDV] [money] NULL,
 CONSTRAINT [PK_ChiTietHD_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [int] NOT NULL,
	[TenChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaLoaiDV] [nvarchar](50) NULL,
	[MaDV] [nvarchar](50) NOT NULL,
	[TenDV] [nvarchar](50) NULL,
	[DonGiaDV] [money] NULL,
	[SoLuongCon] [int] NULL,
	[DVT] [nvarchar](50) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayLapHD] [datetime] NULL,
	[MaNV] [int] NULL,
	[TongTien] [money] NULL,
	[MaKH] [int] NULL,
	[ThoiGianNhan] [date] NULL,
	[ThoiGianTra] [date] NULL,
	[MaPhong] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinhKH] [nvarchar](50) NULL,
	[NgaySinhKH] [datetime] NULL,
	[DienThoaiKH] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[QuocTichKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[NgayCapCMND] [date] NULL,
	[NoiCap] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDichVu]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDichVu](
	[MaLoaiDV] [nvarchar](50) NOT NULL,
	[TenLoaiDV] [nchar](10) NULL,
 CONSTRAINT [PK_LoaiDichVu] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiMuon]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMuon](
	[MaLoaiMuon] [int] IDENTITY(1,1) NOT NULL,
	[TenTloaiMuon] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiMuon] PRIMARY KEY CLUSTERED 
(
	[MaLoaiMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[MaLoaiPhong] [nvarchar](50) NOT NULL,
	[TenLoaiPhong] [nvarchar](50) NULL,
	[HinhMinhHoa] [varchar](50) NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinhNV] [nvarchar](50) NULL,
	[MaChucVu] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[CMND] [varchar](12) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 8/6/2020 3:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [nvarchar](50) NOT NULL,
	[MaLoaiPhong] [nvarchar](50) NULL,
	[TenPhong] [nvarchar](50) NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (70000.0000, 1, N'GiaDinh')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (60000.0000, 1, N'Nhom')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (50000.0000, 1, N'Thuong1G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (55000.0000, 1, N'Thuong2G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (60000.0000, 1, N'Thuong3G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (80000.0000, 1, N'VIP1G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (90000.0000, 1, N'VIP2G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (100000.0000, 1, N'VIP3G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (500000.0000, 2, N'GiaDinh')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (450000.0000, 2, N'Nhom')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (200000.0000, 2, N'Thuong1G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (250000.0000, 2, N'Thuong2G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (280000.0000, 2, N'Thuong3G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (300000.0000, 2, N'VIP1G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (400000.0000, 2, N'VIP2G')
INSERT [dbo].[BangGiaPhong] ([Gia], [MaLoaiMuon], [MaLoaiPhong]) VALUES (500000.0000, 2, N'VIP3G')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (1, N'Administrator')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (2, N'Employee')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (3, N'Manager')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Bia', N'Heniken', N'Bia Heniken', 28000.0000, 100, N'Chai')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'ThucAn', N'MiGoi', N'Mì gói', 20000.0000, 200, N'Gói')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Nuoc', N'Pepsi', N'Pepsi', 15000.0000, 100, N'Chai')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Bia', N'SaiGon', N'Bia Sài Gòn xanh', 22000.0000, 100, N'Chai')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Nuoc', N'Sting', N'Sting', 15000.0000, 100, N'Chai')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Nuoc', N'Suoi', N'Nước suối', 10000.0000, 100, N'Chai')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Khac', N'ThuocLa', N'Thuốc lá', 30000.0000, 100, N'Gói')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'Bia', N'Tiger', N'Bia Tiger', 25000.0000, 100, N'Chai')
INSERT [dbo].[DichVu] ([MaLoaiDV], [MaDV], [TenDV], [DonGiaDV], [SoLuongCon], [DVT]) VALUES (N'ThucAn', N'TraiCay', N'Trái cây', 80000.0000, 100, N'Phần')
INSERT [dbo].[LoaiDichVu] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'Bia', N'Bia       ')
INSERT [dbo].[LoaiDichVu] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'Khac', N'Khác      ')
INSERT [dbo].[LoaiDichVu] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'Nuoc', N'Đồ uống   ')
INSERT [dbo].[LoaiDichVu] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'ThucAn', N'Thức ăn   ')
SET IDENTITY_INSERT [dbo].[LoaiMuon] ON 

INSERT [dbo].[LoaiMuon] ([MaLoaiMuon], [TenTloaiMuon]) VALUES (1, N'Giờ')
INSERT [dbo].[LoaiMuon] ([MaLoaiMuon], [TenTloaiMuon]) VALUES (2, N'Đêm')
SET IDENTITY_INSERT [dbo].[LoaiMuon] OFF
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'GiaDinh', N'Phòng gia đình', N'GD.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'Nhom', N'Phòng Nhóm', N'team.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'Thuong1G', N'Phòng thường 1 giường', N'house_normaul.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'Thuong2G', N'Phòng thường 2 giường', N'normal_2.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'Thuong3G', N'Phòng thường 3 giường', N'normal_3.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'VIP1G', N'Phòng VIP 1 giường', N'VIP.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'VIP2G', N'Phòng VIP 2 giường', N'VIP_2.png')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [HinhMinhHoa]) VALUES (N'VIP3G', N'Phòng VIP 3 giường', N'VIP_3.png')
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [SDT], [NgaySinh], [GioiTinhNV], [MaChucVu], [DiaChi], [TaiKhoan], [MatKhau], [CMND]) VALUES (1, N'Nguyễn Nhật Lâm', N'0703456400', CAST(0xF3220B00 AS Date), N'Nam', 2, N'Long An', N'nhatlam', N'310399', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [SDT], [NgaySinh], [GioiTinhNV], [MaChucVu], [DiaChi], [TaiKhoan], [MatKhau], [CMND]) VALUES (2, N'Vũ Duy Dương', N'0346602086', CAST(0x26230B00 AS Date), N'Nam', 2, N'Lâm Đồng', N'duyduong', N'210599', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [SDT], [NgaySinh], [GioiTinhNV], [MaChucVu], [DiaChi], [TaiKhoan], [MatKhau], [CMND]) VALUES (3, N'Admin', N'', NULL, N'Nữ', 1, N'TP HCM', N'admin', N'admin', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [SDT], [NgaySinh], [GioiTinhNV], [MaChucVu], [DiaChi], [TaiKhoan], [MatKhau], [CMND]) VALUES (4, N'Manager', NULL, NULL, N'Nữ', 3, N'Hà Nội', N'manager', N'manager', NULL)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PGD01', N'GiaDinh', N'Phòng gia đình 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PGD02', N'GiaDinh', N'Phòng gia đình 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PGD03', N'GiaDinh', N'Phòng gia đình 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PN01', N'Nhom', N'Phòng nhóm 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PN02', N'Nhom', N'Phòng nhóm 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PN03', N'Nhom', N'Phòng nhóm 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT11', N'Thuong1G', N'Phòng đơn 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT12', N'Thuong1G', N'Phòng đơn 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT13', N'Thuong1G', N'Phòng đơn 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT21', N'Thuong2G', N'Phòng đôi 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT22', N'Thuong2G', N'Phòng đôi 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT23', N'Thuong2G', N'Phòng đôi 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT31', N'Thuong3G', N'Phòng ba 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT32', N'Thuong3G', N'Phòng ba 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PT33', N'Thuong3G', N'Phòng ba 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV11', N'VIP1G', N'Phòng VIP đơn 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV12', N'VIP1G', N'Phòng VIP đơn 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV13', N'VIP1G', N'Phòng VIP đơn 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV21', N'VIP2G', N'Phòng VIP đôi 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV22', N'VIP2G', N'Phòng VIP đôi 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV23', N'VIP2G', N'Phòng VIP đôi 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV31', N'VIP3G', N'Phòng VIP ba 01', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV32', N'VIP3G', N'Phòng VIP ba 02', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV33', N'VIP3G', N'Phòng VIP ba 03', 0)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [TenPhong], [TrangThai]) VALUES (N'PV34', N'VIP3G', N'Phòng VIP ba 04', 0)
ALTER TABLE [dbo].[BangGiaPhong]  WITH CHECK ADD  CONSTRAINT [FK_BangGiaPhong_LoaiMuon] FOREIGN KEY([MaLoaiMuon])
REFERENCES [dbo].[LoaiMuon] ([MaLoaiMuon])
GO
ALTER TABLE [dbo].[BangGiaPhong] CHECK CONSTRAINT [FK_BangGiaPhong_LoaiMuon]
GO
ALTER TABLE [dbo].[BangGiaPhong]  WITH CHECK ADD  CONSTRAINT [FK_BangGiaPhong_LoaiPhong] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO
ALTER TABLE [dbo].[BangGiaPhong] CHECK CONSTRAINT [FK_BangGiaPhong_LoaiPhong]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_DichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDV])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_DichVu]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_LoaiDichVu] FOREIGN KEY([MaLoaiDV])
REFERENCES [dbo].[LoaiDichVu] ([MaLoaiDV])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_LoaiDichVu]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Phong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
USE [master]
GO
ALTER DATABASE [QL_KhachSan] SET  READ_WRITE 
GO

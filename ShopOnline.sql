USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 21/12/2021 1:02:08 CH ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopOnline.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopOnline]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVien_ID] [int] NULL,
	[KhachHang_ID] [int] NULL,
	[DienThoaiGiaoHang] [nvarchar](20) NULL,
	[DiaChiGiaoHang] [nvarchar](255) NULL,
	[NgayDatHang] [datetime] NULL,
	[TinhTrang] [smallint] NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatHang_ChiTiet]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatHang_ID] [int] NULL,
	[Sach_ID] [int] NULL,
	[SoLuong] [smallint] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_DatHang_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](255) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
 CONSTRAINT [PK_LoaiSach] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](255) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaXuatBan] [nvarchar](255) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NhaXuatBan_ID] [int] NULL,
	[LoaiSach_ID] [int] NULL,
	[TenSach] [nvarchar](255) NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[HinhAnhBia] [nvarchar](255) NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuKho]    Script Date: 21/12/2021 1:02:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuKho](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](255) NULL,
 CONSTRAINT [PK_ThuKho] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (8, 1, 1, N'0929734993', N'An Giang', CAST(N'2020-02-12 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (9, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-09 20:35:06.057' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (10, NULL, 5, N'0569854589', N'An giang', CAST(N'2021-11-09 20:41:35.163' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (11, 1, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (12, NULL, 5, N'0569854589', N'An giang', CAST(N'2021-11-11 09:47:06.600' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (13, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 10:03:03.737' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (14, 1, 13, N'0929734993', N'An Giang', CAST(N'2021-11-11 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (15, NULL, 13, N'0929734993', N'An Giang', CAST(N'2021-11-11 11:42:44.517' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (16, NULL, 5, N'0987898789', N'Cam', CAST(N'2021-11-11 12:16:19.990' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (17, NULL, 5, N'0989999999', N'an', CAST(N'2021-11-11 12:19:44.550' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (18, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 12:24:42.240' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (19, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 12:25:07.697' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (20, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 12:26:32.290' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (21, NULL, 13, N'0989789887', N'anh', CAST(N'2021-11-11 12:27:10.250' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (22, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 12:30:11.957' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (23, NULL, 5, N'0569854589', N'An Giang', CAST(N'2021-11-11 13:19:31.733' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (24, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-11 13:21:59.577' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (25, NULL, 5, N'0569854589', N'An giang', CAST(N'2021-11-12 16:07:22.737' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (26, NULL, 5, N'0929734993', N'An Giang', CAST(N'2021-11-13 08:39:27.237' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (27, NULL, 16, N'0929734993', N'An Giang', CAST(N'2021-12-07 10:38:24.330' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (28, NULL, 19, N'0929734993', N'An giang', CAST(N'2021-12-07 13:55:07.247' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (29, NULL, 20, N'0334366429', N'An Giang', CAST(N'2021-12-20 13:19:17.943' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (30, NULL, 20, N'0569854589', N'Chợ Mới', CAST(N'2021-12-20 13:28:28.323' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (31, NULL, 20, N'0569854589', N'An Giang', CAST(N'2021-12-21 06:47:25.137' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (32, NULL, 20, N'0929734993', N'An Giang', CAST(N'2021-12-21 06:49:38.547' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (1027, NULL, 20, N'0569854589', N'An Giang', CAST(N'2021-12-21 09:40:28.243' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (1028, NULL, 20, N'0929734993', N'An Giang', CAST(N'2021-12-21 09:41:45.790' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [NhanVien_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (1029, NULL, 20, N'0334366429', N'An Giang ', CAST(N'2021-12-21 11:06:09.213' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[DatHang] OFF
SET IDENTITY_INSERT [dbo].[DatHang_ChiTiet] ON 

INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (8, 8, 16, 10, 10000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (9, 9, 16, 3, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (10, 10, 16, 3, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (11, 11, 16, 3, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (12, 12, 17, 4, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (13, 13, 17, 3, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (14, 14, 17, 1, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (15, 15, 16, 1, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (16, 16, 17, 9, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (17, 17, 17, 1, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (18, 18, 16, 1, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (19, 19, 17, 4, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (20, 20, 16, 1, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (21, 21, 17, 2, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (22, 22, 17, 2, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (23, 23, 16, 1, 1000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (24, 24, 17, 1, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (25, 25, 17, 1, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (26, 26, 17, 10, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (27, 27, 17, 1, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (28, 28, 17, 3, 100000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (29, 29, 18, 3, 1000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (30, 30, 18, 1, 1000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (31, 32, 16, 1, 19700)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (1027, 1027, 17, 2, 40000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (1028, 1028, 16, 1, 19700)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [Sach_ID], [SoLuong], [DonGia]) VALUES (1029, 1029, 1034, 2, 169000)
SET IDENTITY_INSERT [dbo].[DatHang_ChiTiet] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (1, N'Nguyễn Thị Hoàng Hiền', N'0929734996', N'Long Xuyên', N'nbg@Email.com', N'hien', N'123456')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (4, N'ngô văn', N'0965854587', N'Châu Đốc', NULL, N'ngo', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (5, N'Ngô Văn Thái', N'0929734993', N'Chợ Mới - An Giang', N'ngothai781@gmail.com', N'ngothai', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (7, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'ngothai123', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (8, N'Nguyễn Thị Hoàng Hiền', N'0929734993', N'An Giang', N'nbg@Email.com', N'ngothai1234', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (10, N'a', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'a', N'123456')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (11, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'thai', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (12, N'Trần Văn A', N'0956485785', N'An Giang', N'nthai@gmail.com', N'thai123', N'f7c3bc1d808e04732adf679965ccc34ca7ae3441')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (13, N'Phạm Băng Băng', N'0964582145', N'HongKong', N'pbbang@gmail.com', N'bang', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (14, N'Dương  Minh Trí', N'0929734993', N'An Giang', N'nbg@Email.com', N'tri', N'123456')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (15, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'ngothai', N'123456')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (16, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'thai10', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (19, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'tri123', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (20, N'Ngô Văn Thái', N'0334366429', N'An Giang', N'thai@gmail.com', N'vanthai', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[KhachHang] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (1016, N'Nguyễn Thị Hoàng Hiền', N'0659854587', N'Chợ mới', N'hien@gmail.com', N'hoanghien', N'dd5fef9c1c1da1394d6d34b248c51be2ad740840')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSach] ON 

INSERT [dbo].[LoaiSach] ([ID], [TenLoai]) VALUES (1, N'Chính trị – pháp luật')
INSERT [dbo].[LoaiSach] ([ID], [TenLoai]) VALUES (2, N'Văn học nghệ thuật')
INSERT [dbo].[LoaiSach] ([ID], [TenLoai]) VALUES (4, N'Truyện tranh')
SET IDENTITY_INSERT [dbo].[LoaiSach] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau], [Quyen]) VALUES (1, N'Ngô Văn Thái', N'0929734993', N'Long Xuyên - An Giang', N'nvthai@gmail.com', N'nthai', N'20eabe5d64b0e216796e834f52d61fd0b70332fc', 1)
INSERT [dbo].[NhanVien] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau], [Quyen]) VALUES (4, N'Trần VĂn C', N'0235698545', N'An Giang', N'nt@gmail.com', N'tvc', N'20eabe5d64b0e216796e834f52d61fd0b70332fc', 0)
INSERT [dbo].[NhanVien] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau], [Quyen]) VALUES (5, N'Trần Văn A', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'thai1', N'123456', 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([ID], [TenNhaXuatBan]) VALUES (1, N'Nhà xuất bản lao động')
INSERT [dbo].[NhaXuatBan] ([ID], [TenNhaXuatBan]) VALUES (2, N'Văn Học')
INSERT [dbo].[NhaXuatBan] ([ID], [TenNhaXuatBan]) VALUES (4, N'Nhi Đồng')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (16, 1, 1, N'TSUBASA - GIẤC MƠ SÂN CỎ - TẬP 29 - CẶP ĐÔI HOÀNG KIM TÁI XUẤT', 19700, 19, N'Storage/d897b688-06a8-4048-b90a-948160428f54.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (17, 1, 4, N'Truyện Tranh Hay', 40000, 8, N'Storage/1a8fcdcf-3396-4e2a-8b3d-f00e7d9b8452.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (18, 1, 1, N'Doraemon', 10000, 10, N'Storage/18beb912-3e6c-424b-ac75-3ff20dfe9ef2.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (19, 1, 1, N'Bảy Viên Ngọc Rồng', 25000, 20, N'Storage/976a091e-bcc8-44c7-9013-3c5b417b6938.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (20, 4, 4, N'Shin - Cậu Bé Bút Chì', 20000, 10, N'Storage/363027d9-6cfc-4fc2-9d62-ab2c57f51267.png', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1018, 4, 4, N'TÔI KHÔNG PHẢI QUỶ VƯƠNG', 25000, 100, N'Storage/dda2b159-3bf6-4176-9f91-964784f64fa6.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1019, 2, 2, N'GIẾT CON CHIM NHẠI (TO KILL A MOCKINGBIRD)', 250000, 100, N'Storage/b3f1da89-b437-460d-bf9a-0782c16b04f1.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1020, 2, 2, N'NANH TRẮNG', 120000, 100, N'Storage/0a5c92b4-5f39-4d9b-828c-3358128caa0f.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1021, 2, 2, N'Nhà Giả Kim', 69000, 100, N'Storage/773153a8-cf73-4e6d-89b3-48ca21cfc0c3.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1022, 4, 4, N'7 Viên Ngọc Rồng', 25000, 100, N'Storage/26d119a3-6a68-466e-93f7-049527e933ad.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1023, 4, 4, N'TRUYỆN CỔ TÍCH MÀU VÀNG', 45600, 100, N'Storage/3b6ecc6e-4fcd-468f-b28f-fdd02699b0f4.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1024, 4, 4, N'BÁCH KHOA TRI THỨC VỀ KHÁM PHÁ THẾ GIỚI CHO TRẺ EM - PIRATES - CƯỚP BIỂN', 38500, 100, N'Storage/889f3936-1fc5-4626-acf0-fef53ffc08e0.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1025, 2, 4, N'BÁCH KHOA TRI THỨC VỀ KHÁM PHÁ THẾ GIỚI CHO TRẺ EM - EARLY PEOPLE - NGƯỜI CỔ ĐẠI', 38500, 100, N'Storage/d177392d-a503-4128-892e-8e8f13dfe563.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1026, 4, 4, N'BÁCH KHOA TRI THỨC VỀ KHÁM PHÁ THẾ GIỚI CHO TRẺ EM - STARS AND PLANETS - CÁC NGÔI SAO VÀ CÁC HÀNH TINH', 38500, 100, N'Storage/ae190a7d-ccbf-4ee3-a375-9d90ae7f538b.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1027, 1, 1, N'Thượng tướng Trần Văn Trà và những chặng đường lịch sử B2 Thành đồng', 350000, 100, N'Storage/9e83a424-c6ad-41bf-abc7-240bcad38058.png', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1028, 1, 1, N'Tiếp xúc bí mật Việt Nam - Hoa Kỳ trước Hội nghị Pari', 102000, 100, N'Storage/e014f455-ada1-4ae7-bcec-7edd11ff5432.png', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1029, 1, 1, N'Đường lối quân sự của Đảng - Lịch sử hình thành, phát triển và nội dung cơ bản', 236000, 100, N'Storage/f1bf4840-2113-42de-89bf-7b0a0b418497.png', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1030, 1, 1, N'Chủ quyền Việt Nam trên Biển Đông', 94000, 100, N'Storage/2ab67117-e421-4607-bcb9-f5df47753c38.png', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1031, 2, 2, N'Xóm Cầu Mới', 311000, 100, N'Storage/017e150e-4d87-4feb-89d5-4aad87aea7e3.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1032, 2, 2, N'Thơ Nôm Nguyễn Trãi Và Nguyễn Bỉnh Khiêm', 695000, 100, N'Storage/2bfea938-64f6-476b-a405-dc175c7eaa5c.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1033, 2, 2, N'Phía Tây Thành Phố', 67000, 100, N'Storage/16feb97e-33ae-40d0-aaa1-4df7c92a97e3.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1034, 2, 2, N'Sinh Năm 1972 - Khát Vọng Sống (Tự Truyện Nguyễn Cảnh Bình)', 169000, 98, N'Storage/525066ae-1a00-4b94-af40-ee36f24eb5ea.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1035, 2, 2, N'Cô Bé Nhìn Mưa', 115000, 100, N'Storage/6be44ebb-37e7-4954-8eae-97b606259ea8.jpg', NULL)
INSERT [dbo].[Sach] ([ID], [NhaXuatBan_ID], [LoaiSach_ID], [TenSach], [DonGia], [SoLuong], [HinhAnhBia], [MoTa]) VALUES (1036, 2, 2, N'Chuyện Con Chó Tên Là Trung Thành (Tái Bản 2021)', 38000, 100, N'Storage/36c721d4-d913-449c-88ed-5c72936d5c37.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[ThuKho] ON 

INSERT [dbo].[ThuKho] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (5, N'Dương  Minh Trí', N'0569562132', N'An Giang', N'tri@gmail.com', N'tri', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
INSERT [dbo].[ThuKho] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (6, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'ngothai781@gmail.com', N'nthai', N'123456')
INSERT [dbo].[ThuKho] ([ID], [HoVaTen], [DienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (7, N'Ngô Văn Thái', N'0929734993', N'An Giang', N'nbg@Email.com', N'thai123', N'7c4a8d09ca3762af61e59520943dc26494f8941b')
SET IDENTITY_INSERT [dbo].[ThuKho] OFF
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_KhachHang] FOREIGN KEY([KhachHang_ID])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_KhachHang]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
ALTER TABLE [dbo].[DatHang_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_ChiTiet_DatHang] FOREIGN KEY([DatHang_ID])
REFERENCES [dbo].[DatHang] ([ID])
GO
ALTER TABLE [dbo].[DatHang_ChiTiet] CHECK CONSTRAINT [FK_DatHang_ChiTiet_DatHang]
GO
ALTER TABLE [dbo].[DatHang_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_ChiTiet_Sach] FOREIGN KEY([Sach_ID])
REFERENCES [dbo].[Sach] ([ID])
GO
ALTER TABLE [dbo].[DatHang_ChiTiet] CHECK CONSTRAINT [FK_DatHang_ChiTiet_Sach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_LoaiSach] FOREIGN KEY([LoaiSach_ID])
REFERENCES [dbo].[LoaiSach] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_LoaiSach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([NhaXuatBan_ID])
REFERENCES [dbo].[NhaXuatBan] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO

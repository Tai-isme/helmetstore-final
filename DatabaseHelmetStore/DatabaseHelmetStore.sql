USE [master]
GO
/****** Object:  Database [HelmetStoreee]    Script Date: 3/2/2025 10:03:49 AM ******/
CREATE DATABASE [HelmetStoreee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HelmetSoreee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\HelmetSoreee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HelmetSoreee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\HelmetSoreee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HelmetStoreee] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HelmetStoreee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HelmetStoreee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HelmetStoreee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HelmetStoreee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HelmetStoreee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HelmetStoreee] SET ARITHABORT OFF 
GO
ALTER DATABASE [HelmetStoreee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HelmetStoreee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HelmetStoreee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HelmetStoreee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HelmetStoreee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HelmetStoreee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HelmetStoreee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HelmetStoreee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HelmetStoreee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HelmetStoreee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HelmetStoreee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HelmetStoreee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HelmetStoreee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HelmetStoreee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HelmetStoreee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HelmetStoreee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HelmetStoreee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HelmetStoreee] SET RECOVERY FULL 
GO
ALTER DATABASE [HelmetStoreee] SET  MULTI_USER 
GO
ALTER DATABASE [HelmetStoreee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HelmetStoreee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HelmetStoreee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HelmetStoreee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HelmetStoreee] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HelmetStoreee', N'ON'
GO
ALTER DATABASE [HelmetStoreee] SET QUERY_STORE = OFF
GO
USE [HelmetStoreee]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HelmetStoreee]
GO
/****** Object:  Table [dbo].[giohang]    Script Date: 3/2/2025 10:03:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang](
	[makhachhang] [varchar](30) NOT NULL,
	[masanpham] [varchar](255) NOT NULL,
	[size] [nvarchar](10) NOT NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK__giohang__562B4AF43EB5E687] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC,
	[masanpham] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 3/2/2025 10:03:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makhachhang] [varchar](30) NOT NULL,
	[tendangnhap] [varchar](255) NULL,
	[matkhau] [varchar](255) NULL,
	[hovaten] [nvarchar](255) NULL,
	[gioitinh] [nvarchar](100) NULL,
	[ngaysinh] [date] NULL,
	[sodienthoai] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[quoctich] [nvarchar](255) NULL,
	[diachikhachhang] [nvarchar](255) NULL,
	[diachinhanhang] [nvarchar](255) NULL,
	[dangkynhanbangtin] [tinyint] NULL,
	[maxacthuc] [varchar](50) NULL,
	[thoigianhieulucmaxacthuc] [datetime] NULL,
	[trangthaixacthuc] [tinyint] NULL,
	[hinhavatar] [varchar](255) NULL,
	[isAdmin] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 3/2/2025 10:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[masanpham] [varchar](255) NOT NULL,
	[tensanpham] [nvarchar](255) NULL,
	[hinhanhsanpham] [varchar](255) NULL,
	[mausac] [nvarchar](255) NULL,
	[kieumau] [nvarchar](255) NULL,
	[gianhap] [decimal](10, 0) NULL,
	[giaban] [decimal](10, 0) NULL,
	[giamgia] [int] NULL,
	[mota] [nvarchar](max) NULL,
 CONSTRAINT [PK__sanpham__8F121B2F54D64AF7] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham_size]    Script Date: 3/2/2025 10:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham_size](
	[masanpham] [varchar](255) NOT NULL,
	[size] [nvarchar](10) NOT NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK__sanpham___4DEA2CC15D3CB89A] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'1', N'THT-001', N'M', 4)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'1', N'THT-011', N'M', 3)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'1', N'THT-083', N'M', 2)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'2', N'THT-001', N'M', 1)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'2', N'THT-003', N'M', 1)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'2', N'THT-004', N'M', 1)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'2', N'THT-006', N'M', 1)
INSERT [dbo].[giohang] ([makhachhang], [masanpham], [size], [soluong]) VALUES (N'2', N'THT-007', N'M', 1)
INSERT [dbo].[khachhang] ([makhachhang], [tendangnhap], [matkhau], [hovaten], [gioitinh], [ngaysinh], [sodienthoai], [email], [quoctich], [diachikhachhang], [diachinhanhang], [dangkynhanbangtin], [maxacthuc], [thoigianhieulucmaxacthuc], [trangthaixacthuc], [hinhavatar], [isAdmin]) VALUES (N'1', N'1', N'1', N'tsds2222', N'male', CAST(N'2025-02-02' AS Date), N'2222', N'thienisme2004@gmail.com', N'22', N'2222', N'222', 0, N'354753', CAST(N'2025-03-02T06:28:36.000' AS DateTime), 1, N'1.jpg', NULL)
INSERT [dbo].[khachhang] ([makhachhang], [tendangnhap], [matkhau], [hovaten], [gioitinh], [ngaysinh], [sodienthoai], [email], [quoctich], [diachikhachhang], [diachinhanhang], [dangkynhanbangtin], [maxacthuc], [thoigianhieulucmaxacthuc], [trangthaixacthuc], [hinhavatar], [isAdmin]) VALUES (N'2', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-001', N'Nón Bảo Hiểm', N'5.png', N'Green', N'Fullface', NULL, CAST(1348000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-002', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Three-Square', NULL, CAST(2119000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-003', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Three-Square', NULL, CAST(1700000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-004', N'Nón Bảo Hiểm', N'1.png', N'White', N'Fullface', NULL, CAST(1201000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-005', N'Nón Bảo Hiểm', N'1.png', N'White', N'Fullface', NULL, CAST(1677000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-006', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Half', NULL, CAST(392000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-007', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Half', NULL, CAST(2633000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-008', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Half', NULL, CAST(2966000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-009', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Three-Square', NULL, CAST(311000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-010', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Half', NULL, CAST(2926000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-011', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Fullface', NULL, CAST(1800000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-012', N'Nón Bảo Hiểm', N'1.png', N'Orange', N'Half', NULL, CAST(1251000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-013', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Three-Square', NULL, CAST(1134000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-014', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(1612000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-015', N'Nón Bảo Hiểm', N'1.png', N'Purple', N'Half', NULL, CAST(2865000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-016', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Fullface', NULL, CAST(772000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-017', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Three-Square', NULL, CAST(1419000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-018', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(1763000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-019', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Three-Square', NULL, CAST(1928000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-020', N'Nón Bảo Hiểm', N'1.png', N'White', N'Fullface', NULL, CAST(949000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-021', N'Nón Bảo Hiểm', N'1.png', N'Purple', N'Half', NULL, CAST(2418000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-022', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Fullface', NULL, CAST(828000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-023', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(1132000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-024', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Half', NULL, CAST(2961000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-025', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Three-Square', NULL, CAST(1903000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-026', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Three-Square', NULL, CAST(2572000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-027', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Fullface', NULL, CAST(1378000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-028', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Fullface', NULL, CAST(112000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-029', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Fullface', NULL, CAST(386000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-030', N'Nón Bảo Hiểm', N'1.png', N'White', N'Half', NULL, CAST(1900000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-031', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Half', NULL, CAST(161000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-032', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Three-Square', NULL, CAST(1558000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-033', N'Nón Bảo Hiểm', N'1.png', N'White', N'Half', NULL, CAST(205000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-034', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Three-Square', NULL, CAST(1381000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-035', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Fullface', NULL, CAST(1614000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-036', N'Nón Bảo Hiểm', N'1.png', N'Orange', N'Half', NULL, CAST(2366000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-037', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(2897000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-038', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Fullface', NULL, CAST(2218000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-039', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Fullface', NULL, CAST(757000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-040', N'Nón Bảo Hiểm', N'1.png', N'White', N'Fullface', NULL, CAST(1661000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-041', N'Nón Bảo Hiểm', N'1.png', N'White', N'Three-Square', NULL, CAST(2288000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-042', N'Nón Bảo Hiểm', N'1.png', N'Purple', N'Three-Square', NULL, CAST(167000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-043', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Fullface', NULL, CAST(1821000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-044', N'Nón Bảo Hiểm', N'1.png', N'Purple', N'Three-Square', NULL, CAST(1935000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-045', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Half', NULL, CAST(2506000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-046', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(526000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-047', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Fullface', NULL, CAST(2088000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-048', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Fullface', NULL, CAST(346000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-049', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Half', NULL, CAST(1190000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-050', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Three-Square', NULL, CAST(2748000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-051', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Half', NULL, CAST(2080000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-052', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Half', NULL, CAST(866000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-053', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Fullface', NULL, CAST(927000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-054', N'Nón Bảo Hiểm', N'1.png', N'Purple', N'Three-Square', NULL, CAST(1902000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-055', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Fullface', NULL, CAST(2992000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-056', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Three-Square', NULL, CAST(2649000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-057', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Fullface', NULL, CAST(2475000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-058', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Fullface', NULL, CAST(1170000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-059', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Three-Square', NULL, CAST(1710000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-060', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Three-Square', NULL, CAST(1628000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-061', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Three-Square', NULL, CAST(2949000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-062', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Three-Square', NULL, CAST(975000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-063', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Three-Square', NULL, CAST(336000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-064', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Half', NULL, CAST(264000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-065', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(179000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-066', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Half', NULL, CAST(651000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-067', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Half', NULL, CAST(1898000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-068', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Fullface', NULL, CAST(202000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-069', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Half', NULL, CAST(858000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-070', N'Nón Bảo Hiểm', N'1.png', N'White', N'Fullface', NULL, CAST(2172000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-071', N'Nón Bảo Hiểm', N'1.png', N'Orange', N'Half', NULL, CAST(2122000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-072', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Half', NULL, CAST(2036000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-073', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Three-Square', NULL, CAST(1257000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-074', N'Nón Bảo Hiểm', N'1.png', N'Yellow', N'Half', NULL, CAST(1509000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-075', N'Nón Bảo Hiểm', N'1.png', N'Purple', N'Half', NULL, CAST(2977000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-076', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Three-Square', NULL, CAST(1534000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-077', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Fullface', NULL, CAST(974000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-078', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Half', NULL, CAST(2223000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-079', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Half', NULL, CAST(1277000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-080', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Fullface', NULL, CAST(1503000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-081', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Fullface', NULL, CAST(1414000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-082', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Three-Square', NULL, CAST(704000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-083', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Three-Square', NULL, CAST(2706000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-084', N'Nón Bảo Hiểm', N'1.png', N'Orange', N'Three-Square', NULL, CAST(971000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-085', N'Nón Bảo Hiểm', N'1.png', N'Pink', N'Half', NULL, CAST(1518000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-086', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Three-Square', NULL, CAST(1801000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-087', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Half', NULL, CAST(2740000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-088', N'Nón Bảo Hiểm', N'1.png', N'Blue', N'Three-Square', NULL, CAST(245000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-089', N'Nón Bảo Hiểm', N'1.png', N'White', N'Three-Square', NULL, CAST(1331000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-090', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Three-Square', NULL, CAST(2992000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-091', N'Nón Bảo Hiểm', N'1.png', N'White', N'Fullface', NULL, CAST(1093000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-092', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Half', NULL, CAST(2045000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-093', N'Nón Bảo Hiểm', N'1.png', N'Orange', N'Fullface', NULL, CAST(1679000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-094', N'Nón Bảo Hiểm', N'1.png', N'Orange', N'Half', NULL, CAST(1093000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-095', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Half', NULL, CAST(2494000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-096', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Three-Square', NULL, CAST(597000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-097', N'Nón Bảo Hiểm', N'1.png', N'Gray', N'Fullface', NULL, CAST(919000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-098', N'Nón Bảo Hiểm', N'1.png', N'Red', N'Three-Square', NULL, CAST(2969000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-099', N'Nón Bảo Hiểm', N'1.png', N'Black', N'Fullface', NULL, CAST(373000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [hinhanhsanpham], [mausac], [kieumau], [gianhap], [giaban], [giamgia], [mota]) VALUES (N'THT-100', N'Nón Bảo Hiểm', N'1.png', N'Green', N'Fullface', NULL, CAST(2674000 AS Decimal(10, 0)), NULL, N'Mũ bảo hiểm chất lượng cao, an toàn và thời trang')
GO
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-001', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-001', N'M', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-001', N'S', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-002', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-002', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-002', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-003', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-003', N'M', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-003', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-004', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-004', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-004', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-005', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-005', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-005', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-006', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-006', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-006', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-007', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-007', N'M', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-007', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-008', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-008', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-008', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-009', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-009', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-009', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-010', N'L', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-010', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-010', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-011', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-011', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-011', N'S', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-012', N'L', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-012', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-012', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-013', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-013', N'M', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-013', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-014', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-014', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-014', N'S', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-015', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-015', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-015', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-016', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-016', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-016', N'S', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-017', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-017', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-017', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-018', N'L', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-018', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-018', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-019', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-019', N'M', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-019', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-020', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-020', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-020', N'S', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-021', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-021', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-021', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-022', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-022', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-022', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-023', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-023', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-023', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-024', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-024', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-024', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-025', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-025', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-025', N'S', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-026', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-026', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-026', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-027', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-027', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-027', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-028', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-028', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-028', N'S', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-029', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-029', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-029', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-030', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-030', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-030', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-031', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-031', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-031', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-032', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-032', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-032', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-033', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-033', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-033', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-034', N'L', 7)
GO
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-034', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-034', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-035', N'L', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-035', N'M', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-035', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-036', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-036', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-036', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-037', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-037', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-037', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-038', N'L', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-038', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-038', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-039', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-039', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-039', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-040', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-040', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-040', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-041', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-041', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-041', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-042', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-042', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-042', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-043', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-043', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-043', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-044', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-044', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-044', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-045', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-045', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-045', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-046', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-046', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-046', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-047', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-047', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-047', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-048', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-048', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-048', N'S', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-049', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-049', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-049', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-050', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-050', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-050', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-051', N'L', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-051', N'M', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-051', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-052', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-052', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-052', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-053', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-053', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-053', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-054', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-054', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-054', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-055', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-055', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-055', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-056', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-056', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-056', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-057', N'L', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-057', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-057', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-058', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-058', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-058', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-059', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-059', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-059', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-060', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-060', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-060', N'S', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-061', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-061', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-061', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-062', N'L', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-062', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-062', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-063', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-063', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-063', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-064', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-064', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-064', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-065', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-065', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-065', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-066', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-066', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-066', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-067', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-067', N'M', 7)
GO
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-067', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-068', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-068', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-068', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-069', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-069', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-069', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-070', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-070', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-070', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-071', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-071', N'M', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-071', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-072', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-072', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-072', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-073', N'L', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-073', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-073', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-074', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-074', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-074', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-075', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-075', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-075', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-076', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-076', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-076', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-077', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-077', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-077', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-078', N'L', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-078', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-078', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-079', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-079', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-079', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-080', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-080', N'M', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-080', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-081', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-081', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-081', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-082', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-082', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-082', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-083', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-083', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-083', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-084', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-084', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-084', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-085', N'L', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-085', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-085', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-086', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-086', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-086', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-087', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-087', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-087', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-088', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-088', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-088', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-089', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-089', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-089', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-090', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-090', N'M', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-090', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-091', N'L', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-091', N'M', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-091', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-092', N'L', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-092', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-092', N'S', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-093', N'L', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-093', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-093', N'S', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-094', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-094', N'M', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-094', N'S', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-095', N'L', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-095', N'M', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-095', N'S', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-096', N'L', 3)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-096', N'M', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-096', N'S', 5)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-097', N'L', 6)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-097', N'M', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-097', N'S', 9)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-098', N'L', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-098', N'M', 8)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-098', N'S', 1)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-099', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-099', N'M', 4)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-099', N'S', 10)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-100', N'L', 7)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-100', N'M', 2)
INSERT [dbo].[sanpham_size] ([masanpham], [size], [soluong]) VALUES (N'THT-100', N'S', 4)
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD  CONSTRAINT [FK__giohang__makhach__4BAC3F29] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[khachhang] ([makhachhang])
GO
ALTER TABLE [dbo].[giohang] CHECK CONSTRAINT [FK__giohang__makhach__4BAC3F29]
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD  CONSTRAINT [FK__giohang__masanph__4CA06362] FOREIGN KEY([masanpham])
REFERENCES [dbo].[sanpham] ([masanpham])
GO
ALTER TABLE [dbo].[giohang] CHECK CONSTRAINT [FK__giohang__masanph__4CA06362]
GO
ALTER TABLE [dbo].[sanpham_size]  WITH CHECK ADD  CONSTRAINT [FK__sanpham_s__masan__3D5E1FD2] FOREIGN KEY([masanpham])
REFERENCES [dbo].[sanpham] ([masanpham])
GO
ALTER TABLE [dbo].[sanpham_size] CHECK CONSTRAINT [FK__sanpham_s__masan__3D5E1FD2]
GO
USE [master]
GO
ALTER DATABASE [HelmetStoreee] SET  READ_WRITE 
GO

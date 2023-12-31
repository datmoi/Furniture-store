USE [master]
GO
/****** Object:  Database [QuanLi_NoiThat]    Script Date: 6/11/2023 9:55:14 PM ******/
CREATE DATABASE [QuanLi_NoiThat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLi_NoiThat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\QuanLi_NoiThat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLi_NoiThat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\QuanLi_NoiThat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLi_NoiThat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLi_NoiThat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLi_NoiThat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLi_NoiThat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLi_NoiThat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLi_NoiThat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLi_NoiThat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLi_NoiThat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLi_NoiThat] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLi_NoiThat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLi_NoiThat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLi_NoiThat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLi_NoiThat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLi_NoiThat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLi_NoiThat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLi_NoiThat] SET QUERY_STORE = OFF
GO
USE [QuanLi_NoiThat]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Image] [nvarchar](500) NULL,
	[Role] [bit] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NOT NULL,
	[Bill_date] [datetime] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NOT NULL,
	[Product_id] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [varchar](10) NOT NULL,
	[Categories_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details_Bill]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details_Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bill_id] [int] NOT NULL,
	[Product_id] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Details_Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Discount_code] [nvarchar](50) NOT NULL,
	[Discount_percent] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Start_date] [datetime] NOT NULL,
	[End_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [varchar](10) NOT NULL,
	[Product_name] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[In_stock] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Images] [nvarchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Set_Categories]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Set_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [varchar](10) NOT NULL,
	[Category_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Set_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Set_Discounts]    Script Date: 6/11/2023 9:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Set_Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [varchar](10) NOT NULL,
	[Discount_id] [int] NOT NULL,
	[Quantity_used] [int] NULL,
 CONSTRAINT [PK_Set_Product_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (3, N'VanAnh100', N'Hồ Thị Vân Anh', N'ava', N'anhhtvpc02834@fpt.edu.vn', N'0335031622', N'Hậu Giang', N'5d451c5c0df9380c7afa57b3.jfif', 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (4, N'Thucmin22', N'Nguyễn Minh Thức', N'ava', N'thucnmpc02975@fpt.edu.vn', N'0336785432', N'Kiên Giang', N'z3739484959822_e65a7ce15611702eda39a111513ce22f.jpg', 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (5, N'Datmv23232', N'Mai Văn Đạt', N'ava11', N'datmvpc02991@fpt.edu.vn', N'0338900984', N'Sóc Trăng', NULL, 0, 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (7, N'ThanhNguyen12', N'Nguyễn Văn Thành', N'ava', N'thanhnguyen123@gmail.com', N'0338753578', N'Cần Thơ', NULL, 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (8, N'HaTran9289', N'Trần Thị Hà', N'ava', N'hatran1234@gmail.com', N'0336497636', N'Đồng Tháp', NULL, 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (9, N'Thauy0182', N'Thai Hoang An11111', N'1', N'thaihoang99@gmail.com', N'0886077290', NULL, NULL, 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (12, N'Thuylam2222', N'Lâm Diễm Thúy', N'1', N'thuylam999999@gmail.com', N'0886077296', N'Cà Mau', N'hinh-nen-hang-xom-cua-toi-la-totoro-1.png', 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (13, N'Huelam019', N'Lâm Huệ', N'111', N'huehoe018@gmail.com', N'0982918291', N'Cà Mau', N'hinh-nen-hang-xom-cua-toi-la-totoro-1.png', 0, 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (15, N'Thuylam100', N'Lâm Diễm Thúy', N'1', N'thuylam121002@gmail.com', N'0886077291', N'Bạc Liêu', N'z3732635371307_822f0b1f874730741dbc8e0903596a24.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (16, N'Diemlam101', N'Lâm Diễm  Thúy', N'1211', N'thuylam29999@gmail.com', N'0886071296', N'1111', N'cung-hoang-dao-cac-cap-doi-scaled.jpg', 0, 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (17, N'Thucmin211', N'Trần Tinh', N'1', N'ttttttt1029@gmail.com', N'0833052757', N'222', N'cung-hoang-dao-cac-cap-doi-scaled.jpg', 0, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (19, N'Tinhtinh121', N'Trần Tinh', N'22', N'thaiho2g1029@gmail.com', N'0833052751', N'22', N'cung-hoang-dao-cac-cap-doi-scaled.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (20, N'Maiquco0128', N'Mai Quốc Bảo', N'1', N'dun018@gmail.com', N'0918291821', N'Vĩnh Long', N'hinh-nen-hang-xom-cua-toi-la-totoro-1.png', 1, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (25, N'Quyen190', N'Trương Thị', N'12', N'quyen129@gmail', N'0998189221', N'Bạc Liêu', N'heo-wallpapers-pc-19-01-2019-7-1024x576.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Fullname], [Password], [Email], [Phone], [Address], [Image], [Role], [Active]) VALUES (26, N'Kookie0901', N'Jeon Jung Kook', N'1', N'kookie9198@gmail.com', N'0886855689', NULL, N'hinh-nen-hang-xom-cua-toi-la-totoro-1.png', 0, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (7, 3, CAST(N'2021-10-31T19:30:45.000' AS DateTime), 14900000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (8, 3, CAST(N'2022-10-31T19:30:45.000' AS DateTime), 910000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (9, 3, CAST(N'2022-10-31T19:30:45.000' AS DateTime), 4500000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (10, 3, CAST(N'2022-10-31T19:30:45.000' AS DateTime), 22900000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (11, 4, CAST(N'2022-11-05T19:30:45.000' AS DateTime), 44500000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (12, 4, CAST(N'2022-11-05T19:30:45.000' AS DateTime), 35900000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (13, 4, CAST(N'2022-11-05T19:30:45.000' AS DateTime), 8793000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (14, 5, CAST(N'2022-11-15T19:30:45.000' AS DateTime), 20793000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (15, 5, CAST(N'2022-11-15T19:30:45.000' AS DateTime), 45800000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (16, 5, CAST(N'2022-11-15T19:30:45.000' AS DateTime), 4900000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (17, 5, CAST(N'2023-01-10T00:00:00.000' AS DateTime), 9000000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (18, 5, CAST(N'2023-01-10T00:00:00.000' AS DateTime), 9000000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (19, 5, CAST(N'2023-01-10T00:00:00.000' AS DateTime), 9000000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (20, 5, CAST(N'2023-01-10T00:00:00.000' AS DateTime), 9000000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (21, 5, CAST(N'2023-01-10T00:00:00.000' AS DateTime), 9000000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (22, 4, CAST(N'2023-06-09T19:54:16.043' AS DateTime), 5500000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (23, 17, CAST(N'2020-06-11T17:40:35.240' AS DateTime), 1942300000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (24, 12, CAST(N'2023-06-11T18:27:21.807' AS DateTime), 33800000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (25, 26, CAST(N'2023-06-11T18:30:42.053' AS DateTime), 21300000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (26, 25, CAST(N'2023-06-11T18:58:35.683' AS DateTime), 1134150000.0000)
INSERT [dbo].[Bills] ([Id], [Account_id], [Bill_date], [Total]) VALUES (27, 17, CAST(N'2023-06-11T20:50:42.387' AS DateTime), 31910000.0000)
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (10, 4, N'PD009', 1, 5500000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (15, 4, N'PD007', 1, 31910000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (18, 4, N'PD008', 2, 971150000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (19, 4, N'PD004', 4, 15900000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (20, 17, N'PD008', 2, 971150000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (24, 12, N'PD047', 1, 4900000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (25, 12, N'PD069', 1, 28900000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (26, 26, N'PD005', 1, 21300000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (27, 25, N'PD008', 1, 971150000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (28, 25, N'PD081', 1, 136500000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (29, 25, N'PD085', 1, 26500000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (30, 25, N'PD008', 1, 971150000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (31, 25, N'PD009', 1, 5500000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (32, 25, N'PD010', 1, 910000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (33, 17, N'PD007', 1, 31910000.0000, 1)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (34, 17, N'PD011', 2, 990000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (35, 17, N'PD001', 1, 14900000.0000, 0)
INSERT [dbo].[Carts] ([Id], [Account_id], [Product_id], [Quantity], [Price], [Status]) VALUES (36, 17, N'PD008', 1, 971150000.0000, 0)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'', N'')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR001', N'Giường ngủ')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR002', N'Bàn đầu giường')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR003', N'Tủ áo')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR004', N'Tủ âm tường')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR005', N'Tủ hộc kéo')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR006', N'Bàn trang điểm')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'BR007', N'Nệm')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'DR001', N'Bàn ăn')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'DR002', N'Ghế ăn')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'DR003', N'Ghế bar')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'DR004', N'Tủ ly')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'DR005', N'Xe đây')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'LR001', N'Sofa')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'LR002', N'Sofa góc')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'LR003', N'Ghế thư giãn')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'LR004', N'Bàn nước')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'LR005', N'Bàn bên')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'R0001', N'Phòng ngủ')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'R0002', N'Phòng ăn')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'R0003', N'Phòng khách')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'R0004', N'Phòng làm việc')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'WR001', N'Ghế')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'WR002', N'Ghế làm việc')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'WR003', N'Ghế xoay')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'WR004', N'Kệ sách')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'WR005', N'Kệ treo')
INSERT [dbo].[Categories] ([Id], [Categories_name]) VALUES (N'WR006', N'Bàn làm việc')
GO
SET IDENTITY_INSERT [dbo].[Details_Bill] ON 

INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (12, 7, N'PD001', 1, 14900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (13, 8, N'PD010', 1, 910000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (14, 9, N'PD015', 1, 4500000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (15, 10, N'PD020', 1, 22900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (16, 11, N'PD025', 1, 44500000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (17, 12, N'PD030', 1, 35900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (18, 13, N'PD035', 1, 8793000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (19, 14, N'PD040', 1, 20793000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (20, 15, N'PD045', 1, 45800000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (21, 16, N'PD050', 1, 4900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (23, 7, N'PD002', 2, 29800000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (24, 17, N'PD002', 1, 90000000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (25, 18, N'PD065', 2, 1871150000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (26, 19, N'PD068', 1, 28900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (27, 22, N'PD009', 1, 5500000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (28, 23, N'PD008', 2, 971150000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (29, 24, N'PD047', 1, 4900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (30, 24, N'PD069', 1, 28900000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (31, 25, N'PD005', 1, 21300000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (32, 26, N'PD008', 1, 971150000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (33, 26, N'PD081', 1, 136500000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (34, 26, N'PD085', 1, 26500000.0000)
INSERT [dbo].[Details_Bill] ([Id], [Bill_id], [Product_id], [Quantity], [Price]) VALUES (35, 27, N'PD007', 1, 31910000.0000)
SET IDENTITY_INSERT [dbo].[Details_Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (1, N'kheaaaC47R', 10, 5, CAST(N'2023-05-11T00:00:00.000' AS DateTime), CAST(N'2023-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (2, N'x01jtMYKaH', 15, 3, CAST(N'2023-05-11T00:00:00.000' AS DateTime), CAST(N'2023-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (3, N'm3pC556rbe', 5, 10, CAST(N'2023-05-11T00:00:00.000' AS DateTime), CAST(N'2023-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (4, N'ythe8je9hH', 20, 10, CAST(N'2023-05-10T00:00:00.000' AS DateTime), CAST(N'2023-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (5, N'03bWWGXCGt', 5, 10, CAST(N'2023-05-11T00:00:00.000' AS DateTime), CAST(N'2023-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (6, N'39tqw90tzK', 10, 15, CAST(N'2023-05-11T00:00:00.000' AS DateTime), CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (7, N'r2Q3Gx4aXK', 10, 5, CAST(N'2023-05-15T00:00:00.000' AS DateTime), CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (8, N'8ChrceFqr8', 15, 4, CAST(N'2023-05-15T00:00:00.000' AS DateTime), CAST(N'2023-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([Id], [Discount_code], [Discount_percent], [Quantity], [Start_date], [End_date]) VALUES (9, N'CshrceFqda', 5, 4, CAST(N'2023-10-06T00:00:00.000' AS DateTime), CAST(N'2023-10-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD001', N'Giường Hộc Kéo Iris 1M6 Vải Belfast 41', 14900000.0000, 55, N'Giường Hộc Kéo Iris 1M6 Vải Belfast 41 với tông màu xám trang nhã giúp không gian phòng ngủ thêm phần sang trọng và hiện đại.', N'giuong-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD002', N'Giường Hộc Kéo Iris 1M8 Vải Belfast 41', 15900000.0000, 55, N'Giường Hộc Kéo Iris 1M6 Vải Belfast 41 với tông màu xám trang nhã giúp không gian phòng ngủ thêm phần sang trọng và hiện đại.', N'giuong-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD003', N'Giường hộc kéo Iris 1m6 Stone', 14900000.0000, 55, N'Giường hộc kéo Iris 1m6 với thiết kế đóng nút đầu giường, điểm đặc biệt là bốn ngăn chứa đồ rộng thuận tiện cất những vật dụng trong phòng ngủ như gối, mền, drap hết sức gọn gàng.', N'giuong-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD004', N'Giường hộc kéo Iris 1m8 Stone', 15900000.0000, 55, N'iường hộc kéo Iris 1m6 với thiết kế đóng nút đầu giường, điểm đặc biệt là bốn ngăn chứa đồ rộng thuận tiện cất những vật dụng trong phòng ngủ như gối, mền, drap hết sức gọn gàng', N'giuong-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD005', N'Giường ngủ Miami 1m8 bọc vải Dolce 094', 21300000.0000, 43, N'Giường ngủ bọc vải Miami sử dụng gỗ Sồi trắng nhập khẩu từ Mỹ kết hợp MDF chống ẩm cao cấp tạo nên sự chắc chắn cho sản phẩm.', N'giuong-5.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD006', N'Giường ngủ Miami 1m8 bọc vải Dolce 150', 2130000.0000, 43, N'Giường ngủ bọc vải Miami sử dụng gỗ Sồi trắng nhập khẩu từ Mỹ kết hợp MDF chống ẩm cao cấp tạo nên sự chắc chắn cho sản phẩm.', N'giuong-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD007', N'Giường ngủ gỗ Maxine 1m6', 31910000.0000, 43, N'Giường ngủ gỗ Maxine 1m6 với đường nét thiết kế đến điểm nhấn đều hài hòa và đều rất giá trị.', N'giuong-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD008', N'Giường Le Marais 1m8 Da Peatmoos L3l', 971150000.0000, 43, N'Chưa có bài đánh giá.', N'giuong-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD009', N'Bàn đầu giường Mây mẫu 2', 5500000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD010', N'Bàn đầu giường Cabo PMA532058 F1', 910000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD011', N'Bàn đầu giường Shadow', 990000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-5.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD012', N'Bàn đầu giường Osaka', 5500000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD013', N'Bàn đầu giường Canyon', 6500000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD014', N'Bàn đầu giường Skagen bên phải', 5500000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD015', N'Bàn đầu giường Skagen bên trái', 4500000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD016', N'Bàn đầu giường Pop', 7500000.0000, 22, N'Một chiếc bàn nhỏ chứa đựng công năng và cũng rất duyên dáng, thanh lịch cho không gian phòng ngủ.', N'ban-dau-giuong-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD017', N'Tủ áo Acrylic', 32900000.0000, 44, N'Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.', N'Tu-ao-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD018', N'Tủ áo Gallery', 99900000.0000, 44, N'Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.', N'tu-ao-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD019', N'Tủ áo Harmony', 12900000.0000, 42, N'Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.', N'tu-ao-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD020', N'Tủ áo hiện đại', 22900000.0000, 44, N'Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.', N'tu-ao-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD021', N'Tủ áo Hiện đại', 24900000.0000, 33, N'Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.', N'Tu-ao-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD022', N'Tủ áo Maxine', 43900000.0000, 44, N'Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất hay lắp đặt.', N'tu-ao-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD023', N'Tủ âm Canon', 23500000.0000, 12, N'Chưa có bài đánh giá.', N'tu_am_tuong_1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD024', N'Tủ âm Diamond', 99500000.0000, 12, N'Chưa có bài đánh giá.', N'tu_am_tuong_2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD025', N'Tủ âm Kiwi', 44500000.0000, 12, N'Chưa có bài đánh giá.', N'tu_am_tuong_3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD026', N'Tủ âm Whitecalypso', 67500000.0000, 12, N'Chưa có bài đánh giá.', N'tu_am_tuong_2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD027', N'Tủ học kéo Osaka', 23900000.0000, 55, N'Chưa có bài đánh giá.', N'TU-HOC-KEO-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD028', N'Tủ học kéo Pio', 16900000.0000, 55, N'Chưa có bài đánh giá.', N'TU-HOC-KEO-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD029', N'Tủ học kéo Dubai', 12900000.0000, 55, N'Chưa có bài đánh giá.', N'TU-HOC-KEO-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD030', N'Tủ học kéo City', 35900000.0000, 55, N'Chưa có bài đánh giá.', N'TU-HOC-KEO-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD031', N'Bàn phấn Madame màu Ebony', 64500000.0000, 44, N'Chưa có bài đánh giá.', N'Ban-phan-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD032', N'Bàn phấn Madame Termocotto P67W', 64500000.0000, 44, N'Chưa có bài đánh giá.', N'Ban-phan-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD033', N'Bàn trang điểm Mây', 24500000.0000, 44, N'Chưa có bài đánh giá.', N'Ban-phan-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD034', N'Bàn phấn Madame Skagen', 13500000.0000, 44, N'Chưa có bài đánh giá.', N'Ban-phan-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD035', N'Nệm Sen Việt 1m4', 8793000.0000, 43, N'Nệm lò xo túi Sen Việt được ra mắt từ năm 2017.', N'nem_1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD036', N'Nệm Sen Việt 1m6', 11793000.0000, 43, N'Nệm lò xo túi Sen Việt được ra mắt từ năm 2017.', N'nem_2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD037', N'Nệm Sen Việt 1m8', 12793000.0000, 43, N'Nệm lò xo túi Sen Việt được ra mắt từ năm 2017.', N'nem_3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD038', N'Nệm Luxury Golden Black 1m6', 52793000.0000, 43, N'Nệm lò xo túi Sen Việt được ra mắt từ năm 2017.', N'nem_4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD039', N'Nệm Luxury Golden Black 1m8', 57793000.0000, 43, N'Nệm lò xo túi Sen Việt được ra mắt từ năm 2017.', N'nem_1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD040', N'Nệm Luxury Carbon 1m6', 20793000.0000, 43, N'Nệm lò xo túi Sen Việt được ra mắt từ năm 2017.', N'nem_2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD041', N'Bàn ăn Peak hiện địa mặt Ceramic vân mây', 45800000.0000, 34, N'Bàn ăn Peak hiện đại với bề mặt Ceramic được nhập khẩu từ Ý', N'ban-an-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD042', N'Bàn ăn Roma 6 chỗ', 9800000.0000, 34, N'Bàn ăn Peak hiện đại với bề mặt Ceramic được nhập khẩu từ Ý', N'ban-an-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD043', N'Bàn ăn gỗ Pio 6 chỗ 1m8', 13800000.0000, 34, N'Bàn ăn Peak hiện đại với bề mặt Ceramic được nhập khẩu từ Ý', N'ban-an-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD044', N'Bàn ăn gỗ Miami 1m7', 13800000.0000, 34, N'Bàn ăn Peak hiện đại với bề mặt Ceramic được nhập khẩu từ Ý', N'ban-an-5.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD045', N'Bàn ăn Jazz', 45800000.0000, 34, N'Bàn ăn Peak hiện đại với bề mặt Ceramic được nhập khẩu từ Ý', N'ban-an-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD046', N'Ghế ăn Peak vải cam', 4900000.0000, 33, N'Ghế ăn Peak là tâm điểm nội thất đáng chú ý bởi nó bao phủ xung quanh bằng lớp vải mang sắc cam rực rỡ, nổi bật.', N'ghe-an-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD047', N'Ghế ăn Peak vải xanh', 4900000.0000, 33, N'Ghế ăn Peak là tâm điểm nội thất đáng chú ý bởi nó bao phủ xung quanh bằng lớp vải mang sắc cam rực rỡ, nổi bật.', N'ghe-an-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD048', N'Ghế ăn Rusy 80981k', 12800000.0000, 33, N'Ghế ăn Peak là tâm điểm nội thất đáng chú ý bởi nó bao phủ xung quanh bằng lớp vải mang sắc cam rực rỡ, nổi bật.', N'ghe-an-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD049', N'Ghế ăn xoay Albert Kuip Taupe', 13900000.0000, 33, N'Ghế ăn Peak là tâm điểm nội thất đáng chú ý bởi nó bao phủ xung quanh bằng lớp vải mang sắc cam rực rỡ, nổi bật.', N'ghe-an-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD050', N'Ghế ăn Gerda đen trắng 85510k', 1.0000, 33, N'Ghế ăn Peak là tâm điểm nội thất đáng chú ý bởi nó bao phủ xung quanh bằng lớp vải mang sắc cam rực rỡ, nổi bật.', N'ghe-an-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD051', N'Ghế Bar Bridge màu nâu da Cognac', 20480000.0000, 22, N'', N'ghe-bar-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD052', N'Ghế Bar Fifties da màu Cognac', 20480000.0000, 22, N'', N'ghe-bar-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD053', N'Ghế Bar Fifties da màu mud brown', 20480000.0000, 22, N'', N'ghe-bar-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD054', N'Ghế Bar Aida da Nougat', 20480000.0000, 22, N'', N'ghe-bar-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD055', N'Ghế Bar Boheme da taupe', 20480000.0000, 22, N'', N'ghe-bar-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD056', N'Tủ Ly Jazz', 25400000.0000, 23, N'', N'tu-ly-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD057', N'Tủ Ly OBLOMFC AC5001', 36400000.0000, 23, N'', N'tu-ly-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD058', N'Tủ Ly Bridge gỗ nâu', 57400000.0000, 23, N'', N'tu-ly-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD059', N'Tủ Ly Shadow', 25400000.0000, 23, N'', N'tu-ly-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD060', N'Tủ Ly Canyon', 25400000.0000, 23, N'', N'tu-ly-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD061', N'Xe đẩy đồ ăn màu vàng đồng', 17500000.0000, 12, N'', N'Xe-day-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD062', N'Xe đẩy đồ ăn Love', 17500000.0000, 12, N'', N'Xe-day-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD063', N'Xe đẩy đồ ăn Giro', 17500000.0000, 12, N'', N'Xe-day-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD064', N'Xe đẩy đồ ăn Tray West Coast', 17500000.0000, 12, N'', N'Xe-day-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD065', N'Xe đẩy đồ ăn Finish', 17500000.0000, 12, N'', N'Xe-day-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD066', N'Sofa 3 chỗ ONA HIM da đen', 77000000.0000, 34, N'', N'Sofa-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD067', N'Sofa 3 chỗ Osaka mẫu 1 vải 29', 28900000.0000, 34, N'', N'sofa-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD068', N'Sofa 3 chỗ Osaka mẫu 1 vải 46', 28900000.0000, 34, N'', N'Sofa-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD069', N'Sofa 3 chỗ Osaka mẫu 1 vải 65', 28900000.0000, 34, N'', N'sofa-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD070', N'Sofa 3 chỗ Osaka mẫu 1 vải màu vàng', 28900000.0000, 34, N'', N'sofa-5.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD071', N'Sofa limited dura góc phải + gối da beige', 164120000.0000, 55, N'', N'Sofa-limited-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD072', N'Sofa limited dura góc phải + gối da cognac', 164120000.0000, 12, N'', N'Sofa-limited-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD073', N'Sofa limited dura góc trái+ gối da brown', 164120000.0000, 12, N'', N'Sofa-limited-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD074', N'Sofa limited dura góc trái+ gối da red', 164120000.0000, 12, N'', N'Sofa-limited-4.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD075', N'Sofa Poppy góc trái vải màu cam', 294120000.0000, 12, N'', N'Sofa-limited-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD076', N'Ghế thư giãn Lazboy 10T352 Shannon da Sienna', 34900000.0000, 13, N'', N'ghe-thu-gian-dien-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD077', N'Ghế thư giãn Lazboy 10T560 Shannon da Pebble', 34900000.0000, 13, N'', N'ghe-thu-gian-dien-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD078', N'Ghế thư giãn Lazboy 10T560 Canyon Sienna', 34900000.0000, 13, N'', N'ghe-thu-gian-dien-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD079', N'Ghế thư giãn Lazboy Điện Lancer 1PT5151 da Sienna', 34900000.0000, 13, N'', N'ghe-thu-gian-dien-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD080', N'Ghế thư giãn Lazboy 10T349 Shannon da Pebble', 34900000.0000, 13, N'', N'ghe-thu-gian-dien-5.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD081', N'Bàn nước Otus Brass', 136500000.0000, 20, N'', N'ban-nuoc-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD082', N'Bàn nước Turbi', 36500000.0000, 20, N'', N'ban-nuoc-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD083', N'Bàn nước Elegance màu tự nhiên', 26500000.0000, 20, N'', N'ban-nuoc-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD084', N'Bàn nước Ellegance màu đen', 23500000.0000, 20, N'', N'ban-nuoc-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD085', N'Bàn nước Ellegance màu nâu', 26500000.0000, 20, N'', N'ban-nuoc-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD086', N'Bàn bên Cave Amber 230244Z', 7890000.0000, 23, NULL, N'ban-ben-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD087', N'Bàn bên Cave Green 230244Z', 7890000.0000, 23, NULL, N'ban-ben-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD088', N'Bàn bên Flamingo 84038k', 7890000.0000, 23, NULL, N'ban-ben-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD089', N'Bàn bên Luxury Marble 84762K', 7890000.0000, 23, NULL, N'ban-ben-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD090', N'Bàn bên Luxury Triangle Champ 84156K', 7890000.0000, 23, NULL, N'ban-ben-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD091', N'Ghế Collete Grey', 9176000.0000, 22, NULL, N'GHE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD092', N'Ghế Gala da Brown L01', 21993000.0000, 43, NULL, N'GHE-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD093', N'Ghế Gala ', 4993000.0000, 43, NULL, N'GHE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD094', N'Ghế Led', 4993000.0000, 43, NULL, N'GHE-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD095', N'Ghế Led Grey', 4993000.0000, 43, NULL, N'GHE-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD096', N'Ghế làm việc check out 83959k', 24500000.0000, 22, NULL, N'GHE-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD097', N'Ghế làm việc Labora high brown 80724K', 24500000.0000, 22, NULL, N'GHE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD098', N'Ghế làm việc Labora high light brown 85725K', 24500000.0000, 22, NULL, N'GHE-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD099', N'Ghế làm việc Labora light brown 85723K', 24500000.0000, 22, NULL, N'GHE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD100', N'Ghế Làm Việc Xoay Franky Brown 1300008Z

 A', 24500000.0000, 22, NULL, N'GHE-3.jpg')
GO
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD101', N'Ghế làm việc xoay Choral FSH9 màu đỏ', 61338750.0000, 6, N'', N'Ghe-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD102', N'Ghế làm việc xoay Choral FSV1 màu đen', 61338750.0000, 6, NULL, N'GHE-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD103', N'Ghế làm việc xoay Choral FSV1 màu vàng', 61338750.0000, 6, NULL, N'GHE-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD104', N'Ghế làm việc xoay Choral P676 màu đen', 61338750.0000, 6, NULL, N'GHE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD105', N'Ghế làm việc xoay Contessa II FPT1 màu đen', 61338750.0000, 6, NULL, N'GHE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD106', N'Kệ sách Cabo PMA732007', 16700000.0000, 34, NULL, N'KE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD107', N'Kệ sách Maxine - 4 tầng/2 ngăn kéo', 16700000.0000, 34, N'', N'KE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD108', N'Kệ sách Osaka', 16700000.0000, 34, NULL, N'KE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD109', N'Kệ sách Porto', 16700000.0000, 34, NULL, N'KE-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD110', N'Kệ Sách Line màu bronze
', 16700000.0000, 34, NULL, N'KE-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD111', N'Kệ treo Inside Taupe P176', 13299000.0000, 34, N'', N'ke-treo-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD112', N'Kệ treo tường Moss', 4299000.0000, 34, NULL, N'ke-treo-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD113', N'Kệ treo tường White', 4299000.0000, 34, NULL, N'ke-treo-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD114', N'Kệ treo tường Natura', 4299000.0000, 34, NULL, N'ke-treo-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD115', N'Kệ Treo Artigo', 4299000.0000, 34, NULL, N'ke-treo-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD116', N'Bàn làm việc Finn 260011', 13690000.0000, 43, NULL, N'BAN-LAM-VIEC-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD117', N'Bàn làm việc Hopper 38929P', 13690000.0000, 43, NULL, N'BAN-LAM-VIEC-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD118', N'Bàn làm việc Maxine', 13690000.0000, 43, NULL, N'BAN-LAM-VIEC-3.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD119', N'Bàn làm việc Osaka KA', 13690000.0000, 43, NULL, N'BAN-LAM-VIEC-1.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD120', N'Bàn làm việc Pio', 13690000.0000, 43, NULL, N'BAN-LAM-VIEC-2.jpg')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'PD122', N'Kệ Để Sách Tủ Khóa GreenHouse 702', 4900000.0000, 5, N'Kích thước: Dài 80cm x Rộng 32cm x Cao 174cm 

Chất liệu:

Gỗ công nghiệp PB cao cấp chuẩn CARB-P2 (*)

Khung sắt sơn tĩnh điện chống gỉ, thấm nước.

(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe

Chống thấm, cong vênh, trầy xước, mối mọt.', N'pro_den_noi_that_moho_ke_de_sach_tu_khoa_11_5753b0817b9d4954bb1c5072694c0971_grande.webp')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'THUY17', N'AAAA', 23.0000, 32, N'23', N'2021-09-17 (1).png')
INSERT [dbo].[Products] ([Id], [Product_name], [Price], [In_stock], [Description], [Images]) VALUES (N'Thuy22', N'2222', 22.0000, 2, N'22', NULL)
GO
SET IDENTITY_INSERT [dbo].[Set_Categories] ON 

INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (124, N'PD001', N'BR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (125, N'PD002', N'BR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (126, N'PD003', N'BR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (127, N'PD004', N'BR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (128, N'PD005', N'BR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (129, N'PD006', N'BR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (130, N'PD007', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (131, N'PD008', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (132, N'PD009', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (133, N'PD010', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (134, N'PD011', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (135, N'PD012', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (136, N'PD013', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (137, N'PD014', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (138, N'PD015', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (139, N'PD016', N'BR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (140, N'PD017', N'BR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (141, N'PD018', N'BR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (142, N'PD019', N'BR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (143, N'PD020', N'BR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (144, N'PD021', N'BR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (145, N'PD022', N'BR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (146, N'PD023', N'BR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (147, N'PD024', N'BR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (148, N'PD025', N'BR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (149, N'PD026', N'BR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (150, N'PD027', N'BR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (151, N'PD028', N'BR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (152, N'PD029', N'BR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (153, N'PD030', N'BR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (154, N'PD031', N'BR006')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (155, N'PD032', N'BR006')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (156, N'PD033', N'BR006')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (157, N'PD034', N'BR006')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (158, N'PD035', N'BR006')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (159, N'PD036', N'BR007')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (160, N'PD037', N'BR007')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (161, N'PD038', N'BR007')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (162, N'PD039', N'BR007')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (163, N'PD040', N'BR007')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (164, N'PD041', N'DR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (165, N'PD042', N'DR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (166, N'PD043', N'DR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (167, N'PD044', N'DR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (168, N'PD045', N'DR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (169, N'PD046', N'DR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (170, N'PD047', N'DR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (171, N'PD048', N'DR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (172, N'PD049', N'DR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (173, N'PD050', N'DR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (174, N'PD051', N'DR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (175, N'PD052', N'DR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (176, N'PD053', N'DR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (177, N'PD054', N'DR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (178, N'PD055', N'DR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (179, N'PD056', N'DR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (180, N'PD057', N'DR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (181, N'PD058', N'DR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (182, N'PD059', N'DR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (183, N'PD060', N'DR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (184, N'PD061', N'DR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (185, N'PD062', N'DR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (186, N'PD063', N'DR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (187, N'PD064', N'DR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (188, N'PD065', N'DR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (189, N'PD066', N'LR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (190, N'PD067', N'LR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (191, N'PD068', N'LR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (192, N'PD069', N'LR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (193, N'PD070', N'LR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (194, N'PD071', N'LR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (195, N'PD072', N'LR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (196, N'PD073', N'LR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (197, N'PD074', N'LR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (198, N'PD075', N'LR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (199, N'PD076', N'LR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (200, N'PD077', N'LR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (201, N'PD078', N'LR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (202, N'PD079', N'LR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (203, N'PD080', N'LR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (204, N'PD081', N'LR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (205, N'PD082', N'LR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (206, N'PD083', N'LR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (207, N'PD084', N'LR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (208, N'PD085', N'LR004')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (209, N'PD086', N'LR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (210, N'PD087', N'LR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (211, N'PD088', N'LR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (212, N'PD089', N'LR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (213, N'PD090', N'LR005')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (214, N'PD091', N'WR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (215, N'PD092', N'WR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (216, N'PD093', N'WR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (217, N'PD094', N'WR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (218, N'PD095', N'WR001')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (219, N'PD096', N'WR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (220, N'PD097', N'WR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (221, N'PD098', N'WR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (222, N'PD099', N'WR002')
GO
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (223, N'PD100', N'WR002')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (224, N'PD101', N'WR003')
INSERT [dbo].[Set_Categories] ([Id], [Product_id], [Category_id]) VALUES (225, N'PD102', N'WR003')
SET IDENTITY_INSERT [dbo].[Set_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Set_Discounts] ON 

INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (1, N'PD001', 5, 2)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (2, N'PD003', 5, 3)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (3, N'PD001', 1, 2)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (4, N'PD001', 3, 1)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (5, N'PD002', 2, 3)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (6, N'PD002', 4, 2)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (7, N'PD003', 1, 1)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (8, N'PD004', 2, 2)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (9, N'PD005', 3, 3)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (10, N'PD006', 4, 1)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (11, N'PD007', 1, 2)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (12, N'PD008', 2, 1)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (13, N'PD009', 3, 1)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (14, N'PD010', 4, 2)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (15, N'PD011', 1, 3)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (16, N'PD011', 2, 1)
INSERT [dbo].[Set_Discounts] ([Id], [Product_id], [Discount_id], [Quantity_used]) VALUES (17, N'PD011', 3, 2)
SET IDENTITY_INSERT [dbo].[Set_Discounts] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Accounts] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Accounts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Accounts] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Accounts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Details_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Details_Bill_Bills] FOREIGN KEY([Bill_id])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[Details_Bill] CHECK CONSTRAINT [FK_Details_Bill_Bills]
GO
ALTER TABLE [dbo].[Details_Bill]  WITH CHECK ADD  CONSTRAINT [FK_Details_Bill_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Details_Bill] CHECK CONSTRAINT [FK_Details_Bill_Products]
GO
ALTER TABLE [dbo].[Set_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Set_Categories_Categories] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Set_Categories] CHECK CONSTRAINT [FK_Set_Categories_Categories]
GO
ALTER TABLE [dbo].[Set_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Set_Categories_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Set_Categories] CHECK CONSTRAINT [FK_Set_Categories_Products]
GO
ALTER TABLE [dbo].[Set_Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Set_Discounts_Discounts] FOREIGN KEY([Discount_id])
REFERENCES [dbo].[Discounts] ([Id])
GO
ALTER TABLE [dbo].[Set_Discounts] CHECK CONSTRAINT [FK_Set_Discounts_Discounts]
GO
ALTER TABLE [dbo].[Set_Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Set_Discounts_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Set_Discounts] CHECK CONSTRAINT [FK_Set_Discounts_Products]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [chk_total] CHECK  (([total]>(0)))
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [chk_total]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [chk_price] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [chk_price]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [chk_quantity] CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [chk_quantity]
GO
ALTER TABLE [dbo].[Details_Bill]  WITH CHECK ADD  CONSTRAINT [chk_price1] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Details_Bill] CHECK CONSTRAINT [chk_price1]
GO
ALTER TABLE [dbo].[Details_Bill]  WITH CHECK ADD  CONSTRAINT [chk_quantity1] CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Details_Bill] CHECK CONSTRAINT [chk_quantity1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [chk_Instock] CHECK  (([in_stock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [chk_Instock]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [chk_Price3] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [chk_Price3]
GO
USE [master]
GO
ALTER DATABASE [QuanLi_NoiThat] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [PetShop]    Script Date: 12/27/2022 9:17:00 AM ******/
CREATE DATABASE [PetShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetShop', FILENAME = N'D:\School\Nam 3\ASP.NET Core\Personal Projects\Project_PetShop\PetShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetShop_log', FILENAME = N'D:\School\Nam 3\ASP.NET Core\Personal Projects\Project_PetShop\PetShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PetShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PetShop] SET  MULTI_USER 
GO
ALTER DATABASE [PetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PetShop] SET QUERY_STORE = OFF
GO
USE [PetShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/27/2022 9:17:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[EncryptString] [nchar](10) NULL,
	[Status] [bit] NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CartName] [nvarchar](300) NULL,
	[Description] [nvarchar](max) NULL,
	[Thumb] [nvarchar](max) NULL,
	[Alias] [nvarchar](50) NULL,
	[Published] [bit] NULL,
	[Ordering] [int] NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](300) NULL,
	[Phone] [nvarchar](10) NULL,
	[CurrentDate] [datetime] NULL,
	[Active] [bit] NULL,
	[Salt] [nchar](10) NULL,
	[LastLogin] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Parent] [int] NULL,
	[Levels] [int] NULL,
	[Slug] [nvarchar](50) NULL,
	[NameWithType] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Shipdate] [datetime] NULL,
	[TransactionID] [int] NULL,
	[Deleted] [bit] NULL,
	[Paid] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentID] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[TotalMoney] [int] NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ShortDesc] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CatId] [int] NULL,
	[Price] [int] NULL,
	[Thumb] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[Status] [bit] NULL,
	[Title] [nvarchar](50) NULL,
	[UnitsInstock] [int] NULL,
	[Discount] [int] NULL,
	[Active] [bit] NOT NULL,
	[BestSellers] [bit] NOT NULL,
	[Alias] [nvarchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 12/27/2022 9:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [PhoneNumber], [Email], [Password], [EncryptString], [Status], [UserName], [RoleID], [LastLogin], [CreateDate]) VALUES (1, N'1545487742', N'maikhoi.cd123@gmail.com', N'addbe44ce32f5fbcfa86aa629a1c4c82', N'*5~@f     ', 1, N'maikhoi', 1, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [PhoneNumber], [Email], [Password], [EncryptString], [Status], [UserName], [RoleID], [LastLogin], [CreateDate]) VALUES (2, N'0368408750', N'mainguyen.cd123@gmail.com', N'da83a06c9d2b90d3b3972fdb3c488700', N'gdrz:     ', 1, N'mainguyen', 1, NULL, CAST(N'2022-12-27T00:42:34.203' AS DateTime))
INSERT [dbo].[Accounts] ([AccountID], [PhoneNumber], [Email], [Password], [EncryptString], [Status], [UserName], [RoleID], [LastLogin], [CreateDate]) VALUES (3, N'02132132', N'www@gmail.com', N'4d78778e508589d08159a40103a41693', N'b0qbr     ', 1, N'www', 2, NULL, CAST(N'2022-12-27T01:59:54.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatId], [CartName], [Description], [Thumb], [Alias], [Published], [Ordering], [Title]) VALUES (1, N' Nutrionals', N'dssssss', NULL, N'ttttt', 1, NULL, NULL)
INSERT [dbo].[Categories] ([CatId], [CartName], [Description], [Thumb], [Alias], [Published], [Ordering], [Title]) VALUES (2, N'Pakage', N'hhhhhhh', NULL, N'hhhh', 1, NULL, NULL)
INSERT [dbo].[Categories] ([CatId], [CartName], [Description], [Thumb], [Alias], [Published], [Ordering], [Title]) VALUES (3, N'Toy', N'ddd', N'cccccccccccc', N'uuu', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (1, N'MaiTienKhoi', NULL, NULL, NULL, N'maikhoi.cd123@gmail.com', N'0368408750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (2, N'fff', NULL, NULL, NULL, N'maikhoi.cd123@gmail.com', N'0368408750', NULL, 1, N'a!i)s     ', NULL, N'47a858ca4b7c308854a1e5e17ba2a8c3', CAST(N'2022-12-26T12:57:34.120' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (3, N'fff', NULL, NULL, NULL, N'maikhoi.cd123@gmail.com', N'0368408750', NULL, 1, N'$52z5     ', NULL, N'11bc43cd0441a516a4768ecb4e0c3932', CAST(N'2022-12-26T13:07:52.053' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (4, N'fff', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'maikhoi.cd123@gmail.com', N'0368408750', NULL, 1, N'{6ctj     ', NULL, N'bb00c25d53b3a0ab8a763ec884882ba5', CAST(N'2022-12-26T13:09:07.320' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (5, N'fff', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'maikhoi.cd123@gmail.com', N'0368408750', NULL, 1, N'%*as~     ', NULL, N'a5efa7f8a2e468daa420ba5c9953ce22', CAST(N'2022-12-26T13:38:23.873' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (7, N'fff', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'maikhoi.cd123@gmail.com', N'0368408750', NULL, 1, N'@~v64     ', NULL, N'f761c6c36228f9c7e861465924b29afc', CAST(N'2022-12-26T14:09:17.453' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (9, N'gggg', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'maikhoi.cd123@gmail.com', N'541545454', NULL, 1, N':q+l]     ', NULL, N'6832c4ae63c2feda96adcfd115fe6a0e', CAST(N'2022-12-26T14:21:03.217' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (11, N'yyy', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'maikhoi.cd123@gmail.com', N'2152125121', NULL, 1, N'd!fxc     ', NULL, N'a7d7e6bfba259491273412d3f432d586', CAST(N'2022-12-26T14:32:46.603' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (12, N'tttt', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'maikhoi.cd123@gmail.com', N'5615612303', NULL, 1, N'v~c1b     ', NULL, N'68c17c851b49d1941be3d47d58087824', CAST(N'2022-12-26T14:40:17.327' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (13, N'mai thái nguyên', NULL, NULL, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên', N'mainguyen.cd123@gmail.com', N'0368408750', NULL, 1, N'(69fn     ', NULL, N'b6121a9af7b3d58f601efb20ef94c149', CAST(N'2022-12-26T15:50:24.410' AS DateTime), 0, 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (14, N'ggg', NULL, NULL, NULL, N'mainguyen.cd123@gmail.com', N'0202303223', NULL, 1, N'&#tgr     ', NULL, N'5aaedb7cdd616dc3e3315b68fe1772ef', CAST(N'2022-12-27T09:06:49.907' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (16, N'ggg', NULL, NULL, NULL, N'mainguyen.cd123@gmail.com', N'0123456789', NULL, 1, N'%fv!z     ', NULL, N'6654fd854bdd614f223cdc68611cc003', CAST(N'2022-12-27T09:08:40.790' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [CurrentDate], [Active], [Salt], [LastLogin], [Password], [CreateDate], [LocationID], [District], [Ward]) VALUES (17, N'yyy', NULL, NULL, NULL, N'mainguyen.cd123@gmail.com', N'5204525', NULL, 1, N'fs]w~     ', NULL, N'058881e9fb19bfeedec72cc48f4caca4', CAST(N'2022-12-27T09:09:35.990' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (1, N'chau doc', 1, 1, N'chaudoc', N'longxuyen', N'aaa')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1, 1, 16, NULL, 2, NULL, 5120000, CAST(N'2022-12-26T13:09:22.223' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (2, 1, 18, NULL, 1, NULL, 5120000, CAST(N'2022-12-26T13:09:22.230' AS DateTime), 5000000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (3, 2, 17, NULL, 3, NULL, 300000, CAST(N'2022-12-26T13:40:26.783' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (4, 2, 16, NULL, 2, NULL, 300000, CAST(N'2022-12-26T13:40:26.787' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (5, 3, 6, NULL, 4, NULL, 2400000, CAST(N'2022-12-26T14:09:57.697' AS DateTime), 600000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (6, 4, 12, NULL, 1, NULL, 2400000, CAST(N'2022-12-26T14:11:55.637' AS DateTime), 800000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (7, 4, 10, NULL, 2, NULL, 2400000, CAST(N'2022-12-26T14:11:55.637' AS DateTime), 800000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (8, 5, 17, NULL, 2, NULL, 10120000, CAST(N'2022-12-26T14:22:52.907' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (9, 5, 18, NULL, 2, NULL, 10120000, CAST(N'2022-12-26T14:22:52.913' AS DateTime), 5000000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (10, 6, 17, NULL, 1, NULL, 120000, CAST(N'2022-12-26T14:33:20.863' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (11, 6, 16, NULL, 1, NULL, 120000, CAST(N'2022-12-26T14:33:20.870' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (12, 7, 17, NULL, 1, NULL, 120000, CAST(N'2022-12-26T14:41:13.913' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (13, 7, 16, NULL, 1, NULL, 120000, CAST(N'2022-12-26T14:41:13.920' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (14, 8, 14, NULL, 1, NULL, 805000, CAST(N'2022-12-26T14:47:40.387' AS DateTime), 5000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (15, 8, 10, NULL, 1, NULL, 805000, CAST(N'2022-12-26T14:47:40.387' AS DateTime), 800000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (16, 9, 17, NULL, 2, NULL, 920000, CAST(N'2022-12-26T15:51:24.593' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (17, 9, 11, NULL, 1, NULL, 920000, CAST(N'2022-12-26T15:51:24.600' AS DateTime), 800000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (18, 10, 17, NULL, 1, NULL, 120000, CAST(N'2022-12-26T16:55:07.093' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (19, 10, 16, NULL, 1, NULL, 120000, CAST(N'2022-12-26T16:55:07.100' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (20, 11, 7, NULL, 2, NULL, 10000000, CAST(N'2022-12-27T07:20:35.863' AS DateTime), 5000000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (21, 12, 17, NULL, 2, NULL, 120000, CAST(N'2022-12-27T07:52:42.630' AS DateTime), 60000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (22, 13, 18, NULL, 5, NULL, 26600000, CAST(N'2022-12-27T09:06:00.453' AS DateTime), 5000000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (23, 13, 12, NULL, 2, NULL, 26600000, CAST(N'2022-12-27T09:06:00.473' AS DateTime), 800000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (1, 4, CAST(N'2022-12-26T13:09:22.170' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 5120000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (2, 5, CAST(N'2022-12-26T13:40:26.747' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 300000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (3, 7, CAST(N'2022-12-26T14:09:57.637' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 2400000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (4, 7, CAST(N'2022-12-26T14:11:55.630' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 2400000, 0, 0, 0, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (5, 9, CAST(N'2022-12-26T14:22:52.870' AS DateTime), NULL, 1, 0, 0, NULL, NULL, NULL, 10120000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (6, 11, CAST(N'2022-12-26T14:33:20.827' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 120000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (7, 12, CAST(N'2022-12-26T14:41:13.873' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 120000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (8, 12, CAST(N'2022-12-26T14:47:40.383' AS DateTime), NULL, 1, 0, 0, NULL, NULL, NULL, 805000, 0, 0, 0, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (9, 13, CAST(N'2022-12-26T15:51:24.533' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 920000, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (10, 13, CAST(N'2022-12-26T16:55:06.980' AS DateTime), NULL, 1, 1, 0, NULL, NULL, NULL, 120000, 0, 0, 0, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (11, 13, CAST(N'2022-12-27T07:20:35.797' AS DateTime), NULL, 1, 0, 0, NULL, NULL, NULL, 10000000, 0, 0, 0, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (12, 13, CAST(N'2022-12-27T07:52:42.537' AS DateTime), NULL, 1, 0, 0, NULL, NULL, NULL, 120000, 0, 0, 0, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Shipdate], [TransactionID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Note], [TotalMoney], [LocationID], [District], [Ward], [Address]) VALUES (13, 13, CAST(N'2022-12-27T09:06:00.347' AS DateTime), NULL, 1, 0, 0, NULL, NULL, NULL, 26600000, 0, 0, 0, N'375, Đường Hà Hoàng Hổ, Phường Mỹ Xuyên, TP.Long Xuyên')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (6, N'Ooooo', N'pppp', NULL, 1, 600000, N'ooooo.jpg', CAST(N'2022-12-10T15:58:14.000' AS DateTime), CAST(N'2022-12-27T07:17:30.557' AS DateTime), NULL, NULL, 1, NULL, 1, 1, N'ooooo')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (7, N'Jjjj', N'kkkkk', NULL, 1, 5000000, N'jjjj.jpg', CAST(N'2022-12-10T16:27:49.000' AS DateTime), CAST(N'2022-12-27T07:17:42.470' AS DateTime), NULL, NULL, 1, NULL, 1, 1, N'jjjj')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (8, N'Ttttt', N'tttt', NULL, 2, 600000, N'ttttt.jpg', CAST(N'2022-12-10T16:38:14.000' AS DateTime), CAST(N'2022-12-27T08:21:10.663' AS DateTime), NULL, NULL, 1, NULL, 1, 1, N'ttttt')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (9, N'Yyyy', N'yyyy', N'yyyyyyyyyyyyyyyyyyyyyyyyy', 1, 100000, N'yyyy.png', CAST(N'2022-12-10T16:55:28.840' AS DateTime), CAST(N'2022-12-10T16:55:28.840' AS DateTime), NULL, N'food', 1, 300, 0, 0, N'yyyy')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (10, N'Kkkkkk', N'lll', N'1231312321', 2, 800000, N'kkkkkk.jpg', CAST(N'2022-12-10T17:10:55.000' AS DateTime), CAST(N'2022-12-27T07:18:16.550' AS DateTime), NULL, N'ooooooo', 1, NULL, 1, 1, N'kkkkkk')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (11, N'Kkkkkk', N'lll', N'1231312321', 2, 800000, N'kkkkkk.jpg', CAST(N'2022-12-10T17:11:45.000' AS DateTime), CAST(N'2022-12-27T07:18:32.837' AS DateTime), NULL, N'ooooooo', 1, NULL, 1, 1, N'kkkkkk')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (12, N'Kkkkkk', N'lll', N'1231312321', 2, 800000, N'kkkkkk.png', CAST(N'2022-12-10T17:12:02.503' AS DateTime), CAST(N'2022-12-10T17:12:02.503' AS DateTime), NULL, N'ooooooo', 1, NULL, 0, 0, N'kkkkkk')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (13, N'Kkkkkk', N'lll', N'1231312321', 2, 800000, N'kkkkkk.jpg', CAST(N'2022-12-10T17:12:08.000' AS DateTime), CAST(N'2022-12-27T07:18:42.490' AS DateTime), NULL, N'ooooooo', 1, NULL, 1, 1, N'kkkkkk')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (14, N'Tttttt', N'tttt', N'kjkjkjk', 1, 5000, N'tttttt.png', CAST(N'2022-12-10T17:14:36.873' AS DateTime), CAST(N'2022-12-10T17:14:36.873' AS DateTime), NULL, N'1111', 1, NULL, 0, 0, N'tttttt')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (16, N'Jjjj', N'jjj', N'jj', 1, 60000, N'jjjj.png', CAST(N'2022-12-10T17:19:04.890' AS DateTime), CAST(N'2022-12-10T17:19:04.890' AS DateTime), NULL, N'888', 1, NULL, 0, 0, N'jjjj')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (17, N'Jjjj', N'jjj', N'jj', 1, 60000, N'jjjj.png', CAST(N'2022-12-10T17:20:47.693' AS DateTime), CAST(N'2022-12-10T17:20:47.693' AS DateTime), NULL, N'888', 1, NULL, 0, 0, N'jjjj')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (18, N'Ttttt', N'hhhhh', N'llllllllllllllllllllllllllll', 1, 5000000, N'ttttt.jpg', CAST(N'2022-12-10T19:37:14.000' AS DateTime), CAST(N'2022-12-27T08:21:43.370' AS DateTime), NULL, N'cc', 200, 10, 1, 1, N'ttttt')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatId], [Price], [Thumb], [DateCreated], [DateModified], [Status], [Title], [UnitsInstock], [Discount], [Active], [BestSellers], [Alias]) VALUES (19, N'Toy Cat', N'hjhjhj', N'jhjmnn', 3, 300000, N'toy-cat.jpg', CAST(N'2022-12-27T08:49:15.903' AS DateTime), CAST(N'2022-12-27T08:49:15.900' AS DateTime), NULL, N'nvbnv', 100, NULL, 1, 1, N'toy-cat')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị viên ')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'User', N'User Outside')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'llll', N'pppppp')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [Status], [Description]) VALUES (1, N'Chờ lấy hàng', N'Đã xác nhận và soạn hàng')
INSERT [dbo].[Transactions] ([TransactionID], [Status], [Description]) VALUES (2, N'Đang giao', N'Đơn hàng đang được đưa tới người mua')
INSERT [dbo].[Transactions] ([TransactionID], [Status], [Description]) VALUES (3, N'Đã huỷ', N'Huỷ đơn hàng thành công')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Transactions] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transactions] ([TransactionID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Transactions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatId])
REFERENCES [dbo].[Categories] ([CatId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [PetShop] SET  READ_WRITE 
GO

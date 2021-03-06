USE [master]
GO
/****** Object:  Database [NewNational]    Script Date: 12/13/2016 4:35:20 PM ******/
CREATE DATABASE [NewNational]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewNational', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NewNational.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NewNational_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NewNational_log.ldf' , SIZE = 6912KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NewNational] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewNational].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewNational] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewNational] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewNational] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewNational] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewNational] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewNational] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NewNational] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewNational] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewNational] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewNational] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewNational] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewNational] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewNational] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewNational] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewNational] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NewNational] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewNational] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewNational] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewNational] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewNational] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewNational] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewNational] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewNational] SET RECOVERY FULL 
GO
ALTER DATABASE [NewNational] SET  MULTI_USER 
GO
ALTER DATABASE [NewNational] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewNational] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewNational] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewNational] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NewNational] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NewNational', N'ON'
GO
USE [NewNational]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Url] [nvarchar](150) NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Title] [nvarchar](250) NULL,
	[Keyword] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [int] NULL,
	[ParentId] [bigint] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Messager] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogSystem]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogSystem](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[Messenger] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_LogSystem] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[TargetUrl] [nvarchar](350) NULL,
	[ParentId] [bigint] NULL,
	[Tanoxomy] [nvarchar](50) NOT NULL,
	[Order] [tinyint] NOT NULL,
	[stExtension] [nvarchar](150) NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageMetas]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageMetas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PageId] [bigint] NOT NULL,
	[stKey] [nvarchar](50) NOT NULL,
	[stValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_PageMetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](350) NOT NULL,
	[Url] [nvarchar](350) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Keywords] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserCreate] [bigint] NOT NULL,
	[UserModified] [bigint] NOT NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Note] [nvarchar](512) NULL,
	[Feature] [bit] NULL,
	[Home] [bit] NULL,
	[CategoriesId] [bigint] NULL,
	[Taxanomy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[stKey] [nvarchar](50) NOT NULL,
	[stValue] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slidehows]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slidehows](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](350) NULL,
	[Note] [nvarchar](512) NULL,
	[TargetUrl] [nvarchar](250) NULL,
	[Order] [int] NULL CONSTRAINT [DF_Slidehows_Order]  DEFAULT ((0)),
	[Tanoxomy] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Slidehows] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[PageId] [bigint] NOT NULL,
	[stTag] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMetas]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMetas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[stKey] [nvarchar](50) NOT NULL,
	[stValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserMetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2016 4:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[RoleId] [bigint] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Url], [Note], [Title], [Keyword], [Description], [Status], [ParentId]) VALUES (1, N'Trang chủ', N'trang-chu', N'trang chủ', N'trang chủ', N'trang chủ', N'trang chủ', 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Url], [Note], [Title], [Keyword], [Description], [Status], [ParentId]) VALUES (2, N'Giới thiệu', N'gioi-thieu', N'Giới thiệu', N'Giới thiệu', N'Giới thiệu', N'Giới thiệu', 0, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[LogSystem] ON 

INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (1, CAST(N'2016-12-12 14:40:32.417' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (2, CAST(N'2016-12-12 14:47:53.257' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (3, CAST(N'2016-12-12 14:48:58.333' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (4, CAST(N'2016-12-12 14:50:00.767' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (5, CAST(N'2016-12-12 14:51:09.480' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (6, CAST(N'2016-12-12 14:52:02.633' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (7, CAST(N'2016-12-12 14:52:40.840' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (8, CAST(N'2016-12-12 14:53:50.710' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (9, CAST(N'2016-12-12 15:00:49.207' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (10, CAST(N'2016-12-12 15:04:00.737' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (11, CAST(N'2016-12-12 15:19:10.570' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (12, CAST(N'2016-12-12 16:20:08.903' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (13, CAST(N'2016-12-12 16:30:40.317' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (14, CAST(N'2016-12-12 16:33:48.657' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (15, CAST(N'2016-12-12 16:36:53.840' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (16, CAST(N'2016-12-12 16:38:37.027' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (17, CAST(N'2016-12-12 16:42:01.520' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (18, CAST(N'2016-12-12 16:43:00.260' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (19, CAST(N'2016-12-12 16:44:22.613' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (20, CAST(N'2016-12-12 16:59:34.207' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (21, CAST(N'2016-12-12 17:16:10.130' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (22, CAST(N'2016-12-12 17:18:38.797' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (23, CAST(N'2016-12-12 17:25:49.697' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (24, CAST(N'2016-12-12 17:35:58.117' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (25, CAST(N'2016-12-12 17:36:28.293' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (26, CAST(N'2016-12-12 19:30:03.873' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (27, CAST(N'2016-12-12 20:06:11.410' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (28, CAST(N'2016-12-12 20:32:44.227' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (29, CAST(N'2016-12-12 20:34:02.377' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (30, CAST(N'2016-12-12 20:57:12.817' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (31, CAST(N'2016-12-12 21:00:01.620' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (32, CAST(N'2016-12-12 21:03:58.850' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (33, CAST(N'2016-12-12 21:27:59.813' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (34, CAST(N'2016-12-12 21:29:01.373' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (35, CAST(N'2016-12-12 21:30:24.443' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (36, CAST(N'2016-12-12 21:41:54.687' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (37, CAST(N'2016-12-12 21:59:54.630' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (38, CAST(N'2016-12-12 22:11:55.110' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (39, CAST(N'2016-12-12 22:15:23.300' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (40, CAST(N'2016-12-12 22:18:19.107' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (41, CAST(N'2016-12-13 08:39:25.420' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (42, CAST(N'2016-12-13 09:46:02.057' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (43, CAST(N'2016-12-13 09:57:33.267' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (44, CAST(N'2016-12-13 10:01:43.720' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (45, CAST(N'2016-12-13 10:05:11.400' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (46, CAST(N'2016-12-13 10:10:46.787' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (47, CAST(N'2016-12-13 10:11:21.063' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Bài viết]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<Reader>b__c(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Insert(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (48, CAST(N'2016-12-13 10:13:40.433' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (49, CAST(N'2016-12-13 10:38:45.037' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (50, CAST(N'2016-12-13 10:40:13.180' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (51, CAST(N'2016-12-13 10:40:33.463' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<NonQuery>b__0(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteNonQuery()
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (52, CAST(N'2016-12-13 10:41:51.653' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<NonQuery>b__0(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteNonQuery()
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (53, CAST(N'2016-12-13 10:42:52.790' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (54, CAST(N'2016-12-13 10:53:29.583' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (55, CAST(N'2016-12-13 11:03:18.020' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (56, CAST(N'2016-12-13 11:04:55.413' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (57, CAST(N'2016-12-13 11:08:31.907' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (58, CAST(N'2016-12-13 11:34:02.847' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (59, CAST(N'2016-12-13 11:45:15.573' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (60, CAST(N'2016-12-13 11:47:34.563' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (61, CAST(N'2016-12-13 12:31:29.913' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (62, CAST(N'2016-12-13 12:42:10.937' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (63, CAST(N'2016-12-13 13:32:44.780' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (64, CAST(N'2016-12-13 13:41:24.813' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (65, CAST(N'2016-12-13 13:51:22.813' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (66, CAST(N'2016-12-13 13:54:30.693' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (67, CAST(N'2016-12-13 13:55:00.743' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (68, CAST(N'2016-12-13 13:55:01.607' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (69, CAST(N'2016-12-13 13:55:01.707' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (70, CAST(N'2016-12-13 13:59:41.523' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (71, CAST(N'2016-12-13 14:10:15.720' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (72, CAST(N'2016-12-13 14:10:32.630' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (73, CAST(N'2016-12-13 14:11:21.593' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (74, CAST(N'2016-12-13 14:11:32.673' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (75, CAST(N'2016-12-13 14:12:42.873' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (76, CAST(N'2016-12-13 14:12:42.890' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (77, CAST(N'2016-12-13 14:12:42.897' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (78, CAST(N'2016-12-13 14:12:42.903' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (79, CAST(N'2016-12-13 14:12:42.913' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (80, CAST(N'2016-12-13 14:14:10.527' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (81, CAST(N'2016-12-13 14:14:20.373' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (82, CAST(N'2016-12-13 14:20:12.877' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (83, CAST(N'2016-12-13 14:20:30.997' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (84, CAST(N'2016-12-13 14:20:31.017' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (85, CAST(N'2016-12-13 14:20:31.020' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (86, CAST(N'2016-12-13 14:20:31.023' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (87, CAST(N'2016-12-13 14:20:31.043' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (88, CAST(N'2016-12-13 14:20:31.047' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (89, CAST(N'2016-12-13 14:20:31.053' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (90, CAST(N'2016-12-13 14:20:31.057' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (91, CAST(N'2016-12-13 14:29:09.967' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (92, CAST(N'2016-12-13 14:29:33.323' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (93, CAST(N'2016-12-13 14:29:33.360' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Delete Tag]System.ArgumentException: The number of primary key values passed must match number of primary key values defined on the entity.
Parameter name: keyValues
   at System.Data.Entity.Internal.WrappedEntityKey..ctor(EntitySet entitySet, String entitySetName, Object[] keyValues, String keyValuesParamName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Find(Object[] keyValues)
   at System.Data.Entity.DbSet`1.Find(Object[] keyValues)
   at ClassLibrary.Services.TagService.Delete(Int64 id) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 98', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (94, CAST(N'2016-12-13 14:29:33.367' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (95, CAST(N'2016-12-13 14:29:33.430' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (96, CAST(N'2016-12-13 14:29:33.437' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Insert Tag]System.InvalidOperationException: The changes to the database were committed successfully, but an error occurred while updating the object context. The ObjectContext might be in an inconsistent state. Inner exception message: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration. ---> System.InvalidOperationException: Saving or accepting changes failed because more than one entity of type ''ClassLibrary.Models.Tag'' have the same primary key value. Ensure that explicitly set primary key values are unique. Ensure that database-generated primary keys are configured correctly in the database and in the Entity Framework model. Use the Entity Designer for Database First/Model First configuration. Use the ''HasDatabaseGeneratedOption" fluent API or ''DatabaseGeneratedAttribute'' for Code First configuration.
   at System.Data.Entity.Core.Objects.ObjectStateManager.FixupKey(EntityEntry entry)
   at System.Data.Entity.Core.Objects.EntityEntry.AcceptChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.AcceptAllChanges()
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.TagService.Insert(Tag entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\TagService.cs:line 40', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (97, CAST(N'2016-12-13 14:36:08.463' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (98, CAST(N'2016-12-13 14:59:01.347' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (99, CAST(N'2016-12-13 14:59:40.663' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Validation.DbEntityValidationException: Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
GO
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (100, CAST(N'2016-12-13 14:59:52.000' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Validation.DbEntityValidationException: Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (101, CAST(N'2016-12-13 15:01:49.787' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (102, CAST(N'2016-12-13 15:06:01.963' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (103, CAST(N'2016-12-13 15:07:00.357' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<NonQuery>b__0(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteNonQuery()
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (104, CAST(N'2016-12-13 15:09:54.490' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (105, CAST(N'2016-12-13 15:11:56.707' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<NonQuery>b__0(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteNonQuery()
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (106, CAST(N'2016-12-13 15:12:32.187' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (107, CAST(N'2016-12-13 15:12:47.033' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<NonQuery>b__0(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteNonQuery()
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (108, CAST(N'2016-12-13 15:14:26.417' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (109, CAST(N'2016-12-13 15:15:13.397' AS DateTime), N'::1', N'Tài khoản: bacnd [Lỗi Cập nhật Page]System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<NonQuery>b__0(DbCommand t, DbCommandInterceptionContext`1 c)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Internal.InterceptableDbCommand.ExecuteNonQuery()
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<Update>b__2(UpdateTranslator ut)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   at System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__35()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass2a.<SaveChangesInternal>b__27()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at ClassLibrary.Services.PagesService.Update(Page entity) in F:\ProjectManager\Teamword_News\NewNationals\ClassLibrary\Services\PagesService.cs:line 72', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (110, CAST(N'2016-12-13 15:16:11.740' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (111, CAST(N'2016-12-13 15:26:33.283' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (112, CAST(N'2016-12-13 15:30:20.390' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (113, CAST(N'2016-12-13 15:36:26.700' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (114, CAST(N'2016-12-13 15:40:08.240' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (115, CAST(N'2016-12-13 15:42:05.353' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (116, CAST(N'2016-12-13 15:50:42.520' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (117, CAST(N'2016-12-13 15:54:40.897' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (118, CAST(N'2016-12-13 15:56:21.657' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (119, CAST(N'2016-12-13 15:59:53.443' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (120, CAST(N'2016-12-13 16:06:54.267' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (121, CAST(N'2016-12-13 16:09:44.133' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (122, CAST(N'2016-12-13 16:12:07.890' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
INSERT [dbo].[LogSystem] ([LogId], [CreateDate], [IPAddress], [Messenger], [Status]) VALUES (123, CAST(N'2016-12-13 16:15:32.857' AS DateTime), N'::1', N'Đăng Nhập hệ thống với tài khoản: bacnd', 0)
SET IDENTITY_INSERT [dbo].[LogSystem] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (2, N'ok ok', N'ok-ok-2', N'seo title', N'seo key', N'seo descript', 1, CAST(N'2016-12-13 10:53:46.910' AS DateTime), CAST(N'2016-12-13 10:53:46.910' AS DateTime), 2, 2, N'/Images/AnhBaiViet/ltv.jpg', N'<p>C&ocirc;ng nghệ ph&aacute;t triển l&agrave; kh&ocirc;ng chỉ l&agrave; th&agrave;nh quả của những bộ phận R&amp;D đầy s&aacute;ng tạo v&agrave; mạo hiểm, m&agrave; c&ograve;n l&agrave; c&ocirc;ng sức của 1 bộ phận &acirc;m thầm kh&ocirc;ng k&eacute;m phần quan trọng đứng ph&iacute;a sau. Đ&oacute; l&agrave; c&ocirc;ng đoạn Testing &ndash; kiểm tra chất lượng sản phẩm.</p>

<p><strong>I. Vai tr&ograve; của testing trong R&amp;D v&agrave; Production</strong></p>

<p>Trong thế giới CNTT ng&agrave;y nay, hai từ c&ocirc;ng nghệ lu&ocirc;n đi k&egrave;m với &yacute; nghĩa v&agrave; tốc độ vũ b&atilde;o của n&oacute;. C&aacute;c c&ocirc;ng ty lớn nhỏ tr&ecirc;n thế giới cạnh tranh nhau gay gắt về c&ocirc;ng nghệ, đưa ra những kiến tr&uacute;c cao hơn, mạnh hơn, nhanh hơn, ch&iacute;nh x&aacute;c hơn v&agrave; rẻ hơn. C&ocirc;ng nghệ ph&aacute;t triển l&agrave; kh&ocirc;ng chỉ l&agrave; th&agrave;nh quả của những bộ phận R&amp;D đầy s&aacute;ng tạo v&agrave; mạo hiểm, m&agrave; c&ograve;n l&agrave; c&ocirc;ng sức của 1 bộ phận &acirc;m thầm kh&ocirc;ng k&eacute;m phần quan trọng đứng ph&iacute;a sau để l&agrave;m nền tảng cũng như bảo đảm cho những c&ocirc;ng nghệ ấy được mang đến cho người sử dụng th&ocirc;ng qua c&aacute;c sản phẩm ổn định, đ&oacute; l&agrave; bộ phận testing.</p>

<p>Bộ phận testing, hay ng&agrave;nh testing n&oacute;i chung c&oacute; nhiệm vụ bảo đảm c&aacute;c sản phẩm, ứng dụng bắt nguồn từ những c&ocirc;ng nghệ mới đảm bảo những ti&ecirc;u ch&iacute; kỹ thuật được đề ra, thử nghiệm sản phẩm/ứng dụng với nhiều m&ocirc;i trường t&ugrave;y biến kh&aacute;c nhau, t&igrave;m v&agrave; ph&aacute;t hiện những lỗi mang t&iacute;nh ứng dụng hoặc thậm ch&iacute; những lỗi mang t&iacute;nh c&ocirc;ng nghệ với mục đ&iacute;ch cuối c&ugrave;ng l&agrave; bảo đảm sản phẩm khi đến tay người sử dụng phải l&agrave; tốt nhất, nhanh nhất v&agrave; ổn định nhất.</p>

<p>Ng&agrave;nh testing đ&oacute;ng vai tr&ograve; rất quan trọng đối với kh&acirc;u R&amp;D, v&igrave; n&oacute; hoạch định chiến lược nghi&ecirc;n cứu v&agrave; ứng dụng, c&oacute; ảnh hưởng rất lớn đến hoạt động t&agrave;i ch&iacute;nh của c&aacute;c h&atilde;ng c&ocirc;ng nghệ cao. Trong kh&acirc;u sản xuất (production), ng&agrave;nh testing bảo đảm c&aacute;c sản phẩm được l&agrave;m ra đạt được ti&ecirc;u ch&iacute; v&agrave; ti&ecirc;u chuẩn kỹ thuật đ&atilde; đề ra, từ đ&oacute; đảm bảo chất lượng sản phẩm cũng như ph&aacute;t hiện sớm những lỗi kỹ thuật sinh ra từ qu&aacute; tr&igrave;nh sản xuất. Ng&agrave;nh testing c&ograve;n đ&oacute;ng một vai tr&ograve; quan trọng trong kh&acirc;u hậu m&atilde;i, ghi nhận c&aacute;c &yacute; kiến, đề xuất hoặc c&aacute;c b&aacute;o c&aacute;o hỏng h&oacute;c từ người sử dụng để từ đ&oacute; đưa ra những điều chỉnh c&ocirc;ng nghệ để n&acirc;ng cao chất lượng sản phẩm của m&igrave;nh.</p>

<p><strong>II. Xu hướng Outsource ng&agrave;nh testing</strong></p>

<p>Như đ&atilde; thấy, testing đ&oacute;ng một vai tr&ograve; rất quan trọng trong lĩnh vực kinh doanh c&ocirc;ng nghệ cao v&agrave; c&aacute;c c&ocirc;ng ty thường d&agrave;nh một phần ng&acirc;n s&aacute;ch rất lớn v&agrave;o c&aacute;c bộ phận testing của m&igrave;nh. Cisco System d&agrave;nh hơn 6% tổng chi ph&iacute; v&agrave;o trong ng&agrave;nh testing trong cả 2 kh&acirc;u tiền sản xuất (pre-audit) v&agrave; hậu m&atilde;i (post-sale), con số đ&oacute; c&oacute; thể cao hơn với những c&ocirc;ng ty chỉ thuần về c&ocirc;ng nghệ như Oracle, hay điển h&igrave;nh nhất l&agrave; Microsoft, với h&agrave;ng tỷ USD h&agrave;ng năm d&agrave;nh cho bộ phận testing của m&igrave;nh.</p>

<p>Những c&ocirc;ng ty chuy&ecirc;n về testing oursourcing thường c&oacute; một lực lượng kỹ sư chuy&ecirc;n nghiệp, những thiết bị d&ugrave;ng cho chuy&ecirc;n ng&agrave;nh testing tốt nhất v&agrave; thường c&oacute; &iacute;t nhất từ v&agrave;i chục đến v&agrave;i trăm kh&aacute;ch h&agrave;ng kh&aacute;c nhau. Những c&ocirc;ng ty testing outsourcing lớn c&oacute; thể c&oacute; đến h&agrave;ng ngh&igrave;n kỹ sư l&agrave;m việc ở nhiều nước kh&aacute;c nhau v&agrave; nắm những c&ocirc;ng nghệ phức tạp nhất trong ng&agrave;nh CNTT ng&agrave;y nay.</p>

<p><strong>III. Testing ở Việt Nam ph&aacute;t triển như thế n&agrave;o?</strong></p>

<p>Ng&agrave;nh testing, hay outsourcing testing ở Việt Nam đ&atilde; manh nha ph&aacute;t triển giai đoạn những năm gần đ&acirc;y, mặc d&ugrave; quy m&ocirc; c&ograve;n nhỏ, v&agrave; chỉ giới hạn ở một v&agrave;i lĩnh vực trong đ&oacute; phải kể đến Software Testing v&agrave; Network Product Testing. Trước đ&acirc;y, hầu hết c&aacute;c hợp đồng testing n&agrave;y đều xuất ph&aacute;t ở những c&ocirc;ng ty c&ocirc;ng nghệ cao đến từ Sillicon Valley, Irvine v.v&hellip; nhằm tận dụng nguồn nh&acirc;n lực gi&aacute; rẻ v&agrave; sự cần c&ugrave; của c&aacute;c kỹ sư Việt Nam, v&agrave; c&ocirc;ng việc đơn thuần l&agrave; những thao t&aacute;c đơn giản như được hoạch định sẵn bởi c&aacute;c kỹ sư v&agrave; quản l&yacute; dự &aacute;n người nước ngo&agrave;i. Tuy nhi&ecirc;n, thời gian gần đ&acirc;y đ&atilde; c&oacute; những thay đổi r&otilde; rệt về quan điểm cũng như sự nh&igrave;n nhận đ&aacute;nh gi&aacute; khả năng đ&uacute;ng đắn của c&aacute;c đối t&aacute;c nước ngo&agrave;i về tr&igrave;nh độ của c&aacute;c kỹ sư Việt Nam, do đ&oacute; nhiều c&ocirc;ng ty outsourcing đ&atilde; mạnh dạn x&acirc;y dựng những đội ngũ kỹ sư giỏi, v&agrave; mạnh dạn t&igrave;m đến những đối t&aacute;c kh&aacute;c tr&ecirc;n thế giới để x&uacute;c tiến c&ocirc;ng việc của m&igrave;nh, với đội ngũ kỹ sư Việt Nam l&agrave;m n&ograve;ng cốt.</p>

<p>N&oacute;i về testing outsourcing, c&oacute; thể nghĩ ngay đến những điển h&igrave;nh th&agrave;nh c&ocirc;ng của c&aacute;c c&ocirc;ng ty Việt Nam như Global CyberSoft, TMA, PSV v.v&hellip; v&agrave; ng&agrave;y c&agrave;ng c&oacute; nhiều c&ocirc;ng ty kh&aacute;c nhau được th&agrave;nh lập để chuẩn bị cho l&agrave;n s&oacute;ng outsourcing m&agrave;u mỡ n&agrave;y. C&ugrave;ng với R&amp;D, Software Developing, Technology Testing cũng đang dần trở th&agrave;nh 1 mũi nhọn của CNTT Việt Nam vươn ra tầm mức thế giới.</p>

<p><strong>IV. Nghề nghiệp Testing Engineer</strong></p>

<p>Trước hết, một Testing Engineer phải l&agrave; một master về c&ocirc;ng nghệ m&agrave; họ đang test, kh&aacute;c với những Field Engineer đi lắp đặt v&agrave; cấu h&igrave;nh, Tester phải hiểu tường tận c&ocirc;ng nghệ đến mức thấp nhất, kể c&aacute;c cấu tr&uacute;c protocol stack, từng Field, Bit, Byte, v.v&hellip; vừa cụ thể vừa to&agrave;n diện để đảm bảo mức ch&iacute;nh x&aacute;c 100%, vốn l&agrave; y&ecirc;u cầu mặc định của mọi kh&aacute;ch h&agrave;ng.</p>

<p>Một Testing Engineer ngo&agrave;i kiến thức chuy&ecirc;n m&ocirc;n cao, c&ograve;n phải l&agrave; một người l&agrave;m việc hết sức chi tiết (detail-oriented), v&igrave; testing đ&ograve;i hỏi sự tỉ mỉ, cẩn thận v&agrave; sự ki&ecirc;n nhẫn cao độ. Bạn c&oacute; thể phải &ldquo;thử&rdquo; h&agrave;ng ngh&igrave;n, chục ngh&igrave;n trường hợp kh&aacute;c nhau để c&oacute; thể đưa ra một kết luận m&agrave; người kh&aacute;c xem l&agrave; hiển nhi&ecirc;n mặc định. Sự n&oacute;ng vội, hấp tấp lu&ocirc;n l&agrave; kẻ th&ugrave; lớn nhất của c&ocirc;ng việc testing. Trong một v&agrave;i kh&iacute;a cạnh n&agrave;o đ&oacute;, một Tester cũng c&oacute; thể xem như một Hacker. Nếu chỉ đơn thuần l&agrave; tr&igrave;nh độ, sự ki&ecirc;n định v&agrave; cẩn thận, th&igrave; người Tester c&oacute; kh&aacute;c chi một c&ocirc;ng nh&acirc;n bậc cao hay hay c&aacute;i m&aacute;y? Một đức t&iacute;nh kh&aacute;c m&agrave; những người Tester cần l&agrave; sự nhạy b&eacute;n v&agrave; s&aacute;ng tạo trong c&ocirc;ng việc, v&igrave; n&oacute; sẽ gi&uacute;p Tester t&igrave;m ra những lỗ hổng, những lỗi phức tạp m&agrave; c&aacute;c kỹ sư ph&aacute;t triển, nh&agrave; sản xuất cũng kh&ocirc;ng thể ngờ đến được. Một mindset của người kỹ sư Testing thường mang trong m&igrave;nh l&agrave; &ldquo;kh&ocirc;ng c&oacute; g&igrave; l&agrave; kh&ocirc;ng thể&rdquo;</p>

<p>Sự trung thực, v&agrave; đạo đức c&ocirc;ng việc cũng l&agrave; một trong những yếu tố quan trọng đối với một Testing Engineer. Trong ng&agrave;nh Testing, việc tiếp x&uacute;c v&agrave; nắm giữ những c&ocirc;ng nghệ mới, biết được những lỗ hổng quan trọng của c&aacute;c c&ocirc;ng nghệ, sản phẩm xem như bạn đang nắm trong m&igrave;nh những b&iacute; mật c&ocirc;ng nghiệp đ&ocirc;i khi c&oacute; ảnh hưởng rất lớn. Do đ&oacute; hầu hết c&aacute;c nh&agrave; tuyển dụng Testing đều đặt vấn đề trung thực v&agrave; đạo đức c&ocirc;ng việc l&ecirc;n rất cao, v&agrave; c&oacute; thể bạn bị rớt ngay từ v&ograve;ng đầu nếu bạn kh&ocirc;ng đạt yếu tố n&agrave;y.</p>

<p>Nh&igrave;n b&ecirc;n ngo&agrave;i c&oacute; vẻ l&agrave; một c&ocirc;ng việc rất nh&agrave;m ch&aacute;n, đ&ocirc;i khi bạn cảm thấy bị lạc lỏng hay thậm ch&iacute; mất định hướng trong c&ocirc;ng việc, tự hỏi rằng &ldquo;m&igrave;nh đang l&agrave;m g&igrave;?&rdquo;, những l&uacute;c như thế cấp quản l&yacute; của bạn c&oacute; thể gi&uacute;p bạn &iacute;t nhiều, nhưng quan trọng nhất bạn phải biết c&aacute;ch tự định hướng cũng như tự động vi&ecirc;n m&igrave;nh để c&oacute; động lực l&agrave;m việc, cũng như t&igrave;m hướng ra cho m&igrave;nh, đưa m&igrave;nh về quỹ đạo c&ocirc;ng việc hiệu quả.</p>

<p>Theo Connection Magazine</p>
', N'sdffdfsdf', 1, 1, 2, N'12323')
INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (3, N'ok ok', N'ok-ok-3', N'sdfdfdsf', N'sdfsdfsdf', N'sdfsdf', 1, CAST(N'2016-12-13 11:04:07.317' AS DateTime), CAST(N'2016-12-13 11:04:07.317' AS DateTime), 2, 2, N'/Images/AnhBaiViet/ltv.jpg', N'<p>sdfdsfdsf</p>
', N'sdfdsfsdf', 0, 0, 2, N'sdfdsf')
INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (4, N'ok ok nguyen duc bac', N'ok-ok-nguyen-duc-bac-4', N'seo title', N'seo key', N'seo descript', 1, CAST(N'2016-12-13 11:35:07.677' AS DateTime), CAST(N'2016-12-13 11:35:07.677' AS DateTime), 2, 2, N'/Images/AnhBaiViet/ltv.jpg', N'<p>dfdfsdf</p>
', N'tóm tắt giới thiệu', 0, 0, 2, N'sdfdsf')
INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (5, N'dfdfdf', N'dfdfdf-5', N'sdfdsf', N'sdfsdf', N'sdfdf', 1, CAST(N'2016-12-13 13:42:28.853' AS DateTime), CAST(N'2016-12-13 13:42:29.053' AS DateTime), 2, 2, N'/Images/AnhBaiViet/ltv.jpg', N'<p>sdfsdfsdfsdf</p>
', N'dsfd', 0, 0, 2, N'sdfsdfsdf')
INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (6, N'test ok', N'test-ok-6', N'seo title', N'sdfsdf', N'sssf', 1, CAST(N'2016-12-13 16:16:02.000' AS DateTime), CAST(N'2016-12-13 16:16:09.893' AS DateTime), 2, 2, NULL, N'<p>sdfdsf</p>
', N'dfdfsdf', 0, 1, 1, N'sdfdf')
INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (7, N'aaaaaaaaaakkkk', N'aaaaaaaaaakkkk-7', N'sadsad', N'ádsad', N'ádsad', -1, CAST(N'2016-12-13 15:16:33.000' AS DateTime), CAST(N'2016-12-13 15:17:00.057' AS DateTime), 2, 2, N'/Images/AnhBaiViet/ltv.jpg', N'<p>&aacute;dsadsa</p>
', N'dsadsad', 1, 0, NULL, N'dfsdf')
INSERT [dbo].[Pages] ([Id], [Name], [Url], [Title], [Keywords], [Description], [Status], [CreateDate], [ModifiedDate], [UserCreate], [UserModified], [Thumbnail], [Content], [Note], [Feature], [Home], [CategoriesId], [Taxanomy]) VALUES (8, N'tttsss', N'tttsss-8', N'seo title', N'sdfsdfsdf', N'seo descript', 1, CAST(N'2016-12-13 16:16:19.000' AS DateTime), CAST(N'2016-12-13 16:16:29.693' AS DateTime), 2, 2, N'/Images/AnhBaiViet/ltv.jpg', N'<p>sdfdsfdsfsdfsdfdsf</p>
', N'sdfsdfsdfsdf', 0, 1, 1, N'Content')
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [Note]) VALUES (1, N'ADMIN', N'quản trị')
INSERT [dbo].[Roles] ([Id], [RoleName], [Note]) VALUES (2, N'MOD', N'duyệt bài')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Slidehows] ON 

INSERT [dbo].[Slidehows] ([Id], [Name], [ImageUrl], [Note], [TargetUrl], [Order], [Tanoxomy], [Status], [StartDate], [EndDate]) VALUES (1, N'demo', N'/Images/avatar/avatar.jpg', N'dfdfd', N'_blank', 1, N'123', 0, CAST(N'2016-12-09 00:00:00.000' AS DateTime), CAST(N'2016-12-07 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Slidehows] OFF
INSERT [dbo].[Tags] ([PageId], [stTag]) VALUES (7, N'testing')
INSERT [dbo].[Tags] ([PageId], [stTag]) VALUES (7, N'code')
INSERT [dbo].[Tags] ([PageId], [stTag]) VALUES (8, N'testing')
INSERT [dbo].[Tags] ([PageId], [stTag]) VALUES (8, N'code')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [UserEmail], [UserPassword], [FullName], [Avatar], [Status], [CreateDate], [ModifiedDate], [RoleId]) VALUES (2, N'bacnd', N'nguyenducbachy@gmail.com', N'000E10000A000DC0003900049000BA00059000AB000BE00056000E000057000F20000F000880003E', N'Nguyễn Đức Bắc', N'/Images/avatar/avatar.jpg', 1, CAST(N'2016-12-12 16:59:54.380' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [UserEmail], [UserPassword], [FullName], [Avatar], [Status], [CreateDate], [ModifiedDate], [RoleId]) VALUES (4, N'admin', N'nguyenducbachy@gmail.com', N'000E10000A000DC0003900049000BA00059000AB000BE00056000E000057000F20000F000880003E', N'Nguyễn Đức Bắc', N'/Images/avatar/avatar.jpg', 1, CAST(N'2016-12-12 16:44:38.217' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [DF_Menus_Order]  DEFAULT ((0)) FOR [Order]
GO
USE [master]
GO
ALTER DATABASE [NewNational] SET  READ_WRITE 
GO

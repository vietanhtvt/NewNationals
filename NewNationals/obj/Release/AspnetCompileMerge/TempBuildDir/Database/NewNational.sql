USE [master]
GO
/****** Object:  Database [NewNational]    Script Date: 12/13/2016 7:53:12 AM ******/
CREATE DATABASE [NewNational]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewNational', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NewNational.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NewNational_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NewNational_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Categories]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[LogSystem]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[Menus]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[PageMetas]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[Pages]    Script Date: 12/13/2016 7:53:12 AM ******/
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
	[Status] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserCreate] [bigint] NOT NULL,
	[UserModified] [bigint] NOT NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Note] [nvarchar](512) NULL,
	[Feature] [bit] NOT NULL,
	[Home] [bit] NOT NULL,
	[CategoriesId] [bigint] NULL,
	[Taxanomy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[Slidehows]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 12/13/2016 7:53:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[PageId] [bigint] NOT NULL,
	[Tag] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMetas]    Script Date: 12/13/2016 7:53:12 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2016 7:53:12 AM ******/
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
SET IDENTITY_INSERT [dbo].[LogSystem] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [Note]) VALUES (1, N'ADMIN', N'quản trị')
INSERT [dbo].[Roles] ([Id], [RoleName], [Note]) VALUES (2, N'MOD', N'duyệt bài')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Slidehows] ON 

INSERT [dbo].[Slidehows] ([Id], [Name], [ImageUrl], [Note], [TargetUrl], [Order], [Tanoxomy], [Status], [StartDate], [EndDate]) VALUES (1, N'demo', N'/Images/avatar/avatar.jpg', N'dfdfd', N'_blank', 1, N'123', 0, CAST(N'2016-12-09 00:00:00.000' AS DateTime), CAST(N'2016-12-07 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Slidehows] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [UserEmail], [UserPassword], [FullName], [Avatar], [Status], [CreateDate], [ModifiedDate], [RoleId]) VALUES (2, N'bacnd', N'nguyenducbachy@gmail.com', N'000E10000A000DC0003900049000BA00059000AB000BE00056000E000057000F20000F000880003E', N'Nguyễn Đức Bắc', N'/Images/avatar/avatar.jpg', 1, CAST(N'2016-12-12 16:59:54.380' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [UserEmail], [UserPassword], [FullName], [Avatar], [Status], [CreateDate], [ModifiedDate], [RoleId]) VALUES (4, N'admin', N'nguyenducbachy@gmail.com', N'000E10000A000DC0003900049000BA00059000AB000BE00056000E000057000F20000F000880003E', N'Nguyễn Đức Bắc', N'/Images/avatar/avatar.jpg', 0, CAST(N'2016-12-12 16:44:38.217' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [DF_Menus_Order]  DEFAULT ((0)) FOR [Order]
GO
USE [master]
GO
ALTER DATABASE [NewNational] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [UserManagementDB]    Script Date: 8/23/2020 4:27:07 PM ******/
CREATE DATABASE [UserManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UserManagementDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UserManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UserManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UserManagementDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [UserManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [UserManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UserManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UserManagementDB', N'ON'
GO
USE [UserManagementDB]
GO
/****** Object:  Table [dbo].[tblPromotionDetails]    Script Date: 8/23/2020 4:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPromotionDetails](
	[Username] [varchar](50) NOT NULL,
	[PromotionID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Photo] [varchar](50) NULL,
	[Rank] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 8/23/2020 4:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPromotions](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [varchar](50) NULL,
	[CreatorName] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 8/23/2020 4:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[Username] [varchar](50) NULL,
	[Role] [varchar](10) NULL,
	[Status] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 8/23/2020 4:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](64) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Photo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Status] [varchar](10) NULL,
	[Available] [bit] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'123', 15, N'OTT', N'img\123.png', 5)
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'a', 4, N'Nguyen Van An', N'img\a.png', 5)
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'b', 8, N'Le Van Ba', N'img\b.jpg', 5)
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'd', 5, N'Dang Thanh Hai', N'img/hai.png', 5)
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'e', 7, N'e', N'img\e.png', 5)
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'f', 13, N'f', N'img\f.png', 5)
INSERT [dbo].[tblPromotionDetails] ([Username], [PromotionID], [Name], [Photo], [Rank]) VALUES (N'h3', 14, N'Hieu Thu Ba', N'img\h3.png', 7.9)
SET IDENTITY_INSERT [dbo].[tblPromotions] ON 

INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (1, N'a', N'Nguyen Van An', CAST(N'2020-08-23 11:30:18.307' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (2, N'a', N'Nguyen Van An', CAST(N'2020-08-23 11:36:35.127' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (3, N'hp', N'hieu', NULL)
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (4, N'a', N'Nguyen Van An', CAST(N'2020-08-23 11:43:44.773' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (5, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:12:27.957' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (6, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:14:38.807' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (7, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:15:37.620' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (8, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:21:33.703' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (9, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:23:26.657' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (10, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:28:51.433' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (11, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:34:10.597' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (12, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:34:16.433' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (13, N'a', N'Nguyen Van An', CAST(N'2020-08-23 14:35:04.093' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (14, N'a', N'Nguyen Van An', CAST(N'2020-08-23 15:08:11.347' AS DateTime))
INSERT [dbo].[tblPromotions] ([PromotionID], [CreatorID], [CreatorName], [DateCreated]) VALUES (15, N'a', N'Nguyen Van An', CAST(N'2020-08-23 16:19:15.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblPromotions] OFF
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'a', N'Admin', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'b', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'c', N'Admin', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'd', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'e', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'f', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'z', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'x', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'Noobmaster', N'Admin', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'h1', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'h3', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'123', N'Sub', N'Active')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'1', N'Sub', N'Inactive')
INSERT [dbo].[tblRoles] ([Username], [Role], [Status]) VALUES (N'hp', N'Admin', N'Active')
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'1', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'asd@asd.asd', N'1', N'img\1.jpg', N'1', N'Inactive', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'123', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'ott@mail.com', N'1231231231', N'img\123.png', N'OTT', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', N'an@sth.com', N'03452978612', N'img\a.png', N'Nguyen Van An', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'b', N'3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d', N'BaLV@gmail.com', N'0334812973', N'img\b.jpg', N'Le Van Ba', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'c', N'c', N'DatDT@gmail.com', N'0925349116', N'img/default.png', N'Dinh Tien Dat', N'Active', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'd', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', N'HaiDT@gmail.com', N'1547823541', N'img/hai.png', N'Dang Thanh Hai', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'e', N'e', N'e@ee.eee', N'e', N'img\e.png', N'e', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'f', N'f', N'f@ff.fff', N'f', N'img\f.png', N'f', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'h1', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'HieuTN@gmail.net', N'9999999999', N'img\h1.jpg', N'Hieu Thu Nhat', N'Active', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'h3', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'HTB@mail.vn', N'1236549871', N'img\h3.png', N'Hieu Thu Ba', N'Active', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'hp', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Hieu@mail.sth', N'0925349223', N'img\hp.jpg', N'Pham Hieu', N'Active', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'Noobmaster', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'nm@gmail.com', N'0125756398', N'img\Noobmaster.jpg', N'Noobmaster', N'Active', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'x', N'z', N'asd@asd.asd', N'd', N'img\x.jpg', N'd', N'Active', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Email], [Phone], [Photo], [Name], [Status], [Available]) VALUES (N'z', N'z', N'asd@asd.asd', N'd', N'img/default.png', N'd', N'Active', 1)
ALTER TABLE [dbo].[tblPromotionDetails]  WITH CHECK ADD FOREIGN KEY([PromotionID])
REFERENCES [dbo].[tblPromotions] ([PromotionID])
GO
ALTER TABLE [dbo].[tblRoles]  WITH CHECK ADD  CONSTRAINT [FK_tblRoles_tblUsers] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUsers] ([Username])
GO
ALTER TABLE [dbo].[tblRoles] CHECK CONSTRAINT [FK_tblRoles_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [UserManagementDB] SET  READ_WRITE 
GO

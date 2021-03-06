USE [master]
GO
/****** Object:  Database [XorHub]    Script Date: 28-09-2017 17:21:37 ******/
CREATE DATABASE [XorHub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XorHub', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XorHub.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XorHub_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XorHub_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XorHub] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XorHub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XorHub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XorHub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XorHub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XorHub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XorHub] SET ARITHABORT OFF 
GO
ALTER DATABASE [XorHub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XorHub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XorHub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XorHub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XorHub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XorHub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XorHub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XorHub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XorHub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XorHub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XorHub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XorHub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XorHub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XorHub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XorHub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XorHub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XorHub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XorHub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XorHub] SET  MULTI_USER 
GO
ALTER DATABASE [XorHub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XorHub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XorHub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XorHub] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XorHub] SET DELAYED_DURABILITY = DISABLED 
GO
USE [XorHub]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 28-09-2017 17:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assignment](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[TeacherName] [varchar](10) NULL,
	[Deadline] [datetime] NOT NULL,
	[BatchId] [int] NULL,
	[Document] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 28-09-2017 17:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Batch](
	[BatchId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginInfo]    Script Date: 28-09-2017 17:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginInfo](
	[Username] [varchar](10) NOT NULL,
	[Passwd] [varchar](15) NOT NULL,
	[Usertype] [varchar](1) NOT NULL,
	[Stat] [bit] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[BatchId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solution]    Script Date: 28-09-2017 17:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Solution](
	[SolutionId] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentId] [int] NULL,
	[Username] [varchar](10) NULL,
	[Stat] [varchar](1) NOT NULL,
	[UploadedOn] [datetime] NOT NULL,
	[Document] [varchar](100) NOT NULL,
	[Comment] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SolutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([AssignmentId], [Title], [PostedDate], [TeacherName], [Deadline], [BatchId], [Document]) VALUES (1007, N'Question1', CAST(N'2017-09-28 14:40:02.437' AS DateTime), N'rutwik', CAST(N'2017-09-27 00:00:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Assignment] OFF
SET IDENTITY_INSERT [dbo].[Batch] ON 

INSERT [dbo].[Batch] ([BatchId], [Name]) VALUES (1, N'Fresh2k17')
INSERT [dbo].[Batch] ([BatchId], [Name]) VALUES (2, N'Fresh2k18')
SET IDENTITY_INSERT [dbo].[Batch] OFF
INSERT [dbo].[LoginInfo] ([Username], [Passwd], [Usertype], [Stat], [Name], [BatchId]) VALUES (N'admin123', N'@admin123', N'A', 1, N'ADMIN', NULL)
INSERT [dbo].[LoginInfo] ([Username], [Passwd], [Usertype], [Stat], [Name], [BatchId]) VALUES (N'batch2', N'@batch2110', N'S', 1, N'batch2', 2)
INSERT [dbo].[LoginInfo] ([Username], [Passwd], [Usertype], [Stat], [Name], [BatchId]) VALUES (N'rutwik', N'@rutwik110', N'T', 1, N'Rutwik', NULL)
INSERT [dbo].[LoginInfo] ([Username], [Passwd], [Usertype], [Stat], [Name], [BatchId]) VALUES (N'student', N'@student110', N'S', 1, N'Student', 1)
INSERT [dbo].[LoginInfo] ([Username], [Passwd], [Usertype], [Stat], [Name], [BatchId]) VALUES (N'teacher', N'@teacher', N'T', 0, N'Teacher', NULL)
SET IDENTITY_INSERT [dbo].[Solution] ON 

INSERT [dbo].[Solution] ([SolutionId], [AssignmentId], [Username], [Stat], [UploadedOn], [Document], [Comment]) VALUES (1, 1007, N'student', N'A', CAST(N'2017-09-28 14:45:00.937' AS DateTime), N'1007.pdf', N'Good')
SET IDENTITY_INSERT [dbo].[Solution] OFF
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD FOREIGN KEY([TeacherName])
REFERENCES [dbo].[LoginInfo] ([Username])
GO
ALTER TABLE [dbo].[LoginInfo]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[Solution]  WITH CHECK ADD FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignment] ([AssignmentId])
GO
ALTER TABLE [dbo].[Solution]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[LoginInfo] ([Username])
GO
USE [master]
GO
ALTER DATABASE [XorHub] SET  READ_WRITE 
GO

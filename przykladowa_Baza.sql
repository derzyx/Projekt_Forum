USE [master]
GO
/****** Object:  Database [ForumRybackie]    Script Date: 09.02.2022 18:05:09 ******/
CREATE DATABASE [ForumRybackie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ForumRybackie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ForumRybackie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ForumRybackie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ForumRybackie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ForumRybackie] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ForumRybackie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ForumRybackie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ForumRybackie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ForumRybackie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ForumRybackie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ForumRybackie] SET ARITHABORT OFF 
GO
ALTER DATABASE [ForumRybackie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ForumRybackie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ForumRybackie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ForumRybackie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ForumRybackie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ForumRybackie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ForumRybackie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ForumRybackie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ForumRybackie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ForumRybackie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ForumRybackie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ForumRybackie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ForumRybackie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ForumRybackie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ForumRybackie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ForumRybackie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ForumRybackie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ForumRybackie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ForumRybackie] SET  MULTI_USER 
GO
ALTER DATABASE [ForumRybackie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ForumRybackie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ForumRybackie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ForumRybackie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ForumRybackie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ForumRybackie] SET QUERY_STORE = OFF
GO
USE [ForumRybackie]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ForumRybackie]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 09.02.2022 18:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [int] NULL,
	[PostId] [int] NULL,
	[Date] [datetime] NULL,
	[Contents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 09.02.2022 18:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Contents] [nvarchar](max) NULL,
	[AuthorId] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09.02.2022 18:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[AccountDescription] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([Id], [AuthorId], [PostId], [Date], [Contents]) VALUES (2, 4, 1, CAST(N'2022-02-03T18:53:29.680' AS DateTime), N'Super')
INSERT [dbo].[Answer] ([Id], [AuthorId], [PostId], [Date], [Contents]) VALUES (5, 1, 1, CAST(N'2022-02-03T19:27:48.273' AS DateTime), N'Okej')
INSERT [dbo].[Answer] ([Id], [AuthorId], [PostId], [Date], [Contents]) VALUES (6, 1, 2, CAST(N'2022-02-03T20:12:30.883' AS DateTime), N'ok')
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title], [Contents], [AuthorId], [Date]) VALUES (1, N'Pierwszy post', N'Witam, to jest pierwszy post na tym forum.', 4, CAST(N'2022-01-31T18:16:55.123' AS DateTime))
INSERT [dbo].[Post] ([Id], [Title], [Contents], [AuthorId], [Date]) VALUES (2, N'Post numer 2', N'A to jest drugi post.', 1, CAST(N'2022-01-31T18:17:42.053' AS DateTime))
INSERT [dbo].[Post] ([Id], [Title], [Contents], [AuthorId], [Date]) VALUES (3, N'Przywitanie', N'Cześć jestem StaryRybak655', 1, CAST(N'2022-01-31T18:32:22.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [AccountDescription], [Email]) VALUES (1, N'StaryRybak655', N'XSW21qaz', N'brak', N'rybak65@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [Password], [AccountDescription], [Email]) VALUES (2, N'Szupakx120', N'ZAQ12wsx', N'Łowię ryby od dziecka.', N'szczupak120@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [Password], [AccountDescription], [Email]) VALUES (4, N'Bob1', N'Qwertyuiop', N'jestem bob', N'bob1@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Post]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Users] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Users]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Users] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Users]
GO
USE [master]
GO
ALTER DATABASE [ForumRybackie] SET  READ_WRITE 
GO

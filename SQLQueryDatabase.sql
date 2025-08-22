USE [master]
GO
/****** Object:  Database [PruebaTecnica]    Script Date: 22/08/2025 7:43:04 a. m. ******/
CREATE DATABASE [PruebaTecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaTecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PruebaTecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaTecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PruebaTecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PruebaTecnica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaTecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaTecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaTecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaTecnica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaTecnica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaTecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaTecnica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaTecnica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaTecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaTecnica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PruebaTecnica] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaTecnica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaTecnica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaTecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaTecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaTecnica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaTecnica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PruebaTecnica] SET QUERY_STORE = ON
GO
ALTER DATABASE [PruebaTecnica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PruebaTecnica]
GO
/****** Object:  Table [dbo].[api_jobs]    Script Date: 22/08/2025 7:43:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_jobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Base_Url] [varchar](200) NOT NULL,
	[Body_Config] [varchar](1000) NOT NULL,
	[Headers_Config] [varchar](1000) NOT NULL,
	[Description_Ep] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 22/08/2025 7:43:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[nombre_parametro] [nvarchar](100) NOT NULL,
	[valor] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[nombre_parametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/08/2025 7:43:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[category] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[api_jobs] ON 
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (1, N'https://login.microsoftonline.com/consumers/oauth2/v2.0/devicecode
', N'client_id=50a60eeb-8db4-4389-9ff1-9a7dcdf57d0c&scope=offline_access%20Files.ReadWrite%20openid%20profile  
', N'application/x-www-form-urlencoded
', N'Login and autenticator
')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (2, N'https://login.microsoftonline.com/consumers/oauth2/v2.0/token
', N'grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Adevice_code&client_id=50a60eeb-8db4-4389-9ff1-9a7dcdf57d0c&device_code=
', N'application/x-www-form-urlencoded
', N'Get token
')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (3, N'https://graph.microsoft.com/v1.0/me/drive/root:/RPA/Logs:/
', N'N/A
', N'Bearer', N'Validate Folder
')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (5, N'https://graph.microsoft.com/v1.0/$batch
', N'{
  "requests": [
    {
      "id": "1",
      "method": "POST",
      "url": "/me/drive/root/children",
      "headers": { "Content-Type": "application/json" },
      "body": { "name": "RPA", "folder": {}, "@microsoft.graph.conflictBehavior": "fail" }
    },
    {
      "id": "2",
      "dependsOn": ["1"],
      "method": "POST",
      "url": "/me/drive/root:/RPA:/children",
      "headers": { "Content-Type": "application/json" },
      "body": { "name": "Logs", "folder": {}, "@microsoft.graph.conflictBehavior": "fail" }
    }
  ]
}', N'application/json;Authorization/Bearer ', N'Create Folder
')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (6, N'https://graph.microsoft.com/v1.0/me/drive/root:/RPA/Logs/testYYYY-MM-DD.json:/content', N'N/A
', N'Content-Type/text/plain;Authorization/Bearer 
', N'Upload json to folder
')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (9, N'https://graph.microsoft.com/v1.0/me/drive/root:/RPA/Reportes:/', N'N/A', N'Bearer', N'Valiodate excel folder')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (10, N'https://graph.microsoft.com/v1.0/me/drive/root:/RPA:/children', N'{
  "name": "Reportes",
  "folder": {},
  "@microsoft.graph.conflictBehavior": "fail"   // o "rename" / "replace"
}', N'application/json;Authorization/Bearer ', N'Create Folder
')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (11, N'https://graph.microsoft.com/v1.0/me/drive/root:/RPA/Reportes/Reporte_YYYY-MM-DD.xlsx:/content?@microsoft.graph.conflictBehavior=replace', N'System.IO.File.ReadAllBytes(@"MyFile")', N'Content-Type/text/plain;Authorization/Bearer 
', N'Upload file to foldere')
GO
INSERT [dbo].[api_jobs] ([ID], [Base_Url], [Body_Config], [Headers_Config], [Description_Ep]) VALUES (12, N'https://graph.microsoft.com/v1.0/me/drive/root:/', N'N/A', N'Authorization/Bearer', N'Validate File')
GO
SET IDENTITY_INSERT [dbo].[api_jobs] OFF
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'FilenameJson', N'test.json')
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'FilePathExel', N'C:\\Temp\\Reportes\\')
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'filepathjson', N'C:\\Temp\\')
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'NameExcel', N'Reporte_YYYY-MM-DD.xlsx')
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'PathScreen', N'C:\\Temp\\Evidencias\\')
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'Url', N'https://fakestoreapi.com/products')
GO
INSERT [dbo].[Parametros] ([nombre_parametro], [valor]) VALUES (N'UrlForm', N'https://forms.gle/ze9wwNn254XXLDS46')
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT (getdate()) FOR [Date]
GO
USE [master]
GO
ALTER DATABASE [PruebaTecnica] SET  READ_WRITE 
GO

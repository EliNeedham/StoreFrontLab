IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bikes]') AND type in (N'U'))
ALTER TABLE [dbo].[Bikes] DROP CONSTRAINT IF EXISTS [FK_Bikes_TireType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bikes]') AND type in (N'U'))
ALTER TABLE [dbo].[Bikes] DROP CONSTRAINT IF EXISTS [FK_Bikes_BikeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bikes]') AND type in (N'U'))
ALTER TABLE [dbo].[Bikes] DROP CONSTRAINT IF EXISTS [FK_Bikes_BikeStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bikes]') AND type in (N'U'))
ALTER TABLE [dbo].[Bikes] DROP CONSTRAINT IF EXISTS [FK_Bikes_BikeMakeID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[TireType]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[TireType]
GO
/****** Object:  Table [dbo].[BikeType]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[BikeType]
GO
/****** Object:  Table [dbo].[BikeStatuses]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[BikeStatuses]
GO
/****** Object:  Table [dbo].[Bikes]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[Bikes]
GO
/****** Object:  Table [dbo].[BikeMakeID]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[BikeMakeID]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [StoreFront]    Script Date: 11/6/2020 1:43:08 PM ******/
DROP DATABASE IF EXISTS [StoreFront]
GO
/****** Object:  Database [StoreFront]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE DATABASE [StoreFront]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreFront', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreFront_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StoreFront] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreFront].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreFront] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreFront] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreFront] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreFront] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreFront] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreFront] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreFront] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreFront] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreFront] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreFront] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreFront] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreFront] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreFront] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreFront] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreFront] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreFront] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreFront] SET  MULTI_USER 
GO
ALTER DATABASE [StoreFront] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreFront] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreFront] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreFront] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreFront] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreFront] SET QUERY_STORE = OFF
GO
USE [StoreFront]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BikeMakeID]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BikeMakeID](
	[BikeMakeID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [varchar](100) NOT NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NULL,
 CONSTRAINT [PK_BikeMakeID] PRIMARY KEY CLUSTERED 
(
	[BikeMakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bikes]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bikes](
	[BikeID] [int] IDENTITY(1,1) NOT NULL,
	[BikeModel] [nchar](50) NOT NULL,
	[BikeTypeID] [int] NULL,
	[Price] [money] NOT NULL,
	[UnitsSold] [int] NULL,
	[Year] [date] NOT NULL,
	[BikeImage] [varchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[TireID] [int] NULL,
	[BikeStatusID] [int] NULL,
	[BikeMakeID] [int] NOT NULL,
	[IsSiteFeature] [bit] NULL,
 CONSTRAINT [PK_Bikes_1] PRIMARY KEY CLUSTERED 
(
	[BikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BikeStatuses]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BikeStatuses](
	[BikeStatusID] [int] IDENTITY(1,1) NOT NULL,
	[BikeStatusName] [varchar](25) NOT NULL,
	[Notes] [varchar](100) NULL,
 CONSTRAINT [PK_BikeStatuses] PRIMARY KEY CLUSTERED 
(
	[BikeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BikeType]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BikeType](
	[BikeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BikeType] [nchar](20) NOT NULL,
 CONSTRAINT [PK_BikeType] PRIMARY KEY CLUSTERED 
(
	[BikeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TireType]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TireType](
	[TireID] [int] IDENTITY(1,1) NOT NULL,
	[TireSize] [int] NOT NULL,
	[Tubeless] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TireType] PRIMARY KEY CLUSTERED 
(
	[TireID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 11/6/2020 1:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
	[FavoriteBike] [varchar](50) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010121903572_InitialCreate', N'StoreFrontLab.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE336167E2FB0FF41D0D36E915AB9EC0CA681DD227592DD6073C33853ECDB80966847188952252A93A0E82FEB437F52FF420F254A166FBAD88AED14058A583CFCCEE1E147F2903C9C3F7FFF63FCE37318584F3849FD884CECA3D1A16D61E2469E4F96133BA38BEF3ED83FFEF08F6FC6175EF86CFD5CCA9D3039A849D289FD48697CEA38A9FB8843948E42DF4DA2345AD0911B850EF222E7F8F0F07BE7E8C8C100610396658D3F6684FA21CE7FC0CF69445C1CD30C0537918783947F8792598E6ADDA210A73172F1C49ED128C1974944E8359A8F0A79DB3A0B7C04B6CC70B0B02D44484411054B4F3FA578464178398BE1030A1E5E620C720B14A498B7E07425DEB53187C7AC31CEAA6209E566298DC29E804727DC3B8E5C7D2D1FDB95F7C07F17E067FAC25A9DFB70625F7938FFF4310AC001B2C2D3699030E1897D53A9384BE35B4C4765C55101799900DCD728F932AA231E589DEB1D546C3A1E1DB2FF0EAC6916D02CC11382339AA0E0C0BACFE681EFFE0FBF3C445F30999C1CCD17271FDEBD47DEC9FB7FE39377F596425B414EF8009FEE9328C609D8861755FB6DCB11EB3972C5AA5AAD4EE115E0120C0CDBBA41CFD7982CE9230C99E30FB675E93F63AFFCC2C9F589F8308EA0124D32F8799B05019A07B82A771A75B2FF37683D7EF77E10ADB7E8C95FE65D2FE9878193C0B8FA8883BC347DF4E3627809FDFD998BC1780CD96F915F45E9E75994252E6B4C64147940C91253D1BAB1B3226F274A33A8E1695DA2EE3FB599A52ABDB5A2AC41EB8C8452C5B6474369EFEBEAEDCCB8B33886CECBA9C53CD24438DD723592EA1F5882D48A3E475DE943A0597FE7D9F022447E30C074D8410BC4220B3F0971D5CA9F22201F22BD6DBE47690AB381F75F943E36980E7F0E60FA0CBB5902249D5114C6AFAEEDFE3122F8360BE78CFBDBD33558D73C7C8D2E910B63EE82B05A1BE35D47EE9728A317C43B47147FA26E09C87E3EF861778041CC39735D9CA6974066EC4D2308B54BC02B424F8E7BC3B1296AD7E1C834407EA88F47A4C9F47329BA8A49F4124A5C6210D3C5264DA65E474B9F7433B514359B5A48B49ACAC5FA9ACAC0BA59CA25CD86E602AD76165283457B790F0D1FEEE5B0FB1FEF6DB6789BE6829A1BF3A8E43F98E004A631EF1E518A13B2EA812EF3C62E8285BCFB98D2575F9B724D3FA3201B5AD55AA3219F04861F0D39ECFE8F86DC4CF8FCE47B2C2AE9B0092A8501BE93BC7E7FD53EE624CBB63D1C84666E5BF976E600D370394BD3C8F5F351A039FEE28717A2FD10C359ED2719456BE4D310681810DD674B1E7C81B6D932A9EEC8390E30C5D6995B1C0F4E51EA224F752334C8EB6158B9A26A0C5B9D8A88C67DABE804A6E38455426C1394C248F5095587854F5C3F4641AB97A49A1D9730D6F64A875C728E634C98C2564F7451AE3F046106547AA44E69F3D0D8A931AE998886A8D5D4E76D21ECAADF95B389AD70B2257636F092C76FAF42CC668F6D819CCD2EE96280F1406F1704E57B95AE0490372EFB465069C76420280FA9B64250D1633B20A8E8923747D0628BDAB5FFA5FDEABED153DC286F7F596F74D70EB829F863CFA859C49E5087420D9CA8F43C9FB342FC4C359B33B093EFCF521EEACA1461E0334CC5239B55BCAB8D439D661099444D802BA2B580F2AB40054819503D8C2BCFF21AADE351440FD8F2DCAD1196CFFD126C8D032A76FD4AB42668BE3895C9D969F751B5AC628342F24E9B851A8E8610F2E42536BC83534CE7B2AA63BAC4C27DA2E15AC378673438A825723538A96CCCE05E2AA9D9EE255D40D62724DBC84B52F864F052D998C1BDC439DAEE244D50D0232CD8C845E2123ED0602B4F3AAAD5A62A1B3B45AE14FF30760C4955E31B14C73E59D692ACF8176B5664584DBF9BF54F3C0A0B0CC74D35F94795B595261A256889A552500D965EFA494ACF114573C4CE79A65EA88869D756C3F45FAAAC2F9F6A2796EB4029CDFEE637ABBA0B7C61B555C3118E72096D0C594C93636818A0AF6EB1B43714A04473763F8D822C24E610CB5CBBB8C1ABD72FBEA8086347B25F09A1147F2981AEE8FC4E5DA30E8BC1BAA98A61D6EF2A3384C9E165045A77B9292A35A39487547514D3C1D5CEBACE14CCF4EC2E3952ECDF5BAD08AF33B6787A4A1D807FEA8951CB7050C06A65DD51C524943AA658D21D51CA34A9434A453DACACE7930846D60BD6C23378542FD15D839A415247574BBB236B7249EAD09AE235B03536CB65DD5135E92675604D7177EC55EE893C8DEEF1EA65DCBF6CB07C159BDCCDD62F03C6EBCC89C32C7FB5BBFC3A50ED734F2C7E5BAF80F1EF7BC927E34E6F033E15A71B9BF1C980619E7D847B7071F269BCBC37630A97DBC204DF74B96FC6EBC7DA57E586B2D593452AEDD5964FDADA8DF936ABFD518DB2EF2A446CAB742330EA25A5381C3181D1EC97601AF8984DE5A5C00D22FE02A7B448E8B08F0F8F8EA55739FBF342C649532FD06C534DCF64C43EDB426E16794289FB88123553628357242B50E510FA8A78F87962FF9AD73ACDCF33D85FF9E703EB2AFD44FC5F32287848326CFDA6667E0E9355DFE11D4765E86F6FE2814477975FFDFF7351F5C0BA4B60389D5A8792A3D7E97EF1D9442F6B8AAA1B58B3F6638AB73BDA84570A5A5469B4ACFF2861EED3411E249456FE3344CFFFEA6B9AF6D1C146889A870543E10DE242D3C38175B08C8F063CF849F34703FD1AAB7F44B08E69C607043EE90F263F1FE83E0D953577B80E69B64CDB9892723FB7A65F6F948BB9EBB549C9D2DE68A0AB99D83DE006CDB6DE2C44796359CC832D9D9A24E5C1B077C9FB57CF4CDE9764E455D0BEDB1CE46DA61D375C2BFDADB28DF7203F4E93EFB3FB9CE26D73CD7406BCE78999FD3287F78C6C7C99DF7D7EF0B6C9663A20DE73B2F5CA02DE33AEED6AFDDC31D33A2FA13BCFE955D3930C7739BA53E4B69CDDE2C81DB6FFF30848504494C5534B7D925853826B8BC2958859A9393B4D56AC0C1C45AF22D1ACB65F5BF982DFD8582ED3ACD690D3D9A49BCFFF8DBAB94CB36E43A6E42EB28DB5B98ABA0CF09679AC2989EA2D65170B2D6949666F8B591B2FE6DF5232F1204E11468FE176F9EDE40E0FE29221874E8F5C61F5A218D6CEDABFD108EB77EA2F5710EC5F6C24D81556CD4AE68A2CA272F1962C2A45A4139A1B4C91074BEA5942FD05722914B303E8FCAD787EA8C7AE41E6D8BB2277198D330A4DC6E13C100EBC5810D0A43F4F88166D1EDFC5EC573A4413C04C9F1DDCDF919F323FF02ABB2F3567420608165DF0E35ED697941DFB2E5F2AA4DB887404E2EEAB82A2071CC60180A57764869EF03AB601FDAEF112B92FAB134013487B47886E1F9FFB6899A030E518ABFAF01338EC85CF3FFC053A468A1DAA540000, N'6.2.0-61023')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1f61fab9-7a6f-4280-8893-1c75622d0af1', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'26049179-d233-4155-931f-f2cca8983870', N'1f61fab9-7a6f-4280-8893-1c75622d0af1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1df89f0a-801c-416e-81ea-b01dcbc32306', N'elizabethn86@yahoo.com', 0, N'AGXjA9Dxyx9nHsKrdPCpYGyi/CIv/BIQ/R5igqmXyXun6eqQtmhDmszZ2ybYXfgepA==', N'c587fb1b-7380-406e-81bd-656d92604673', NULL, 0, 0, NULL, 1, 0, N'elizabethn86@yahoo.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'26049179-d233-4155-931f-f2cca8983870', N'admin@example.com', 0, N'ANwh2SmEDss/70lX1Z8gqb+FBMjpl07dmG9+POuGMGmbLTA72gGGhKJOJpVU4NwCoQ==', N'8b9781b6-0fbc-4b11-b33b-743f882a9ce7', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'81a34bd1-7d88-4a62-b07a-23d4a9d784e7', N'EliNeedham@outlook.com', 0, N'AC3H1DxIdxc2vQZfKwxtLs6Asj/ySvphqXlmnTp3cPzGQkf527GsqnvZrVi6Td3uRQ==', N'61c092d0-31f9-459d-b5b6-a6ae19671cc7', NULL, 0, 0, NULL, 1, 0, N'EliNeedham@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e4a80a31-dc16-44b1-b022-3fa343e2a3fa', N'newuser@yahoo.com', 0, N'AFO91Waic7/4uwaPHIJGWBIJwU3y/N4J3ROVr55LoHgJ0lSPBmIyfs3WDa98LLuR7g==', N'1394201a-147d-433b-ab68-d4d2b3e2cd0c', NULL, 0, 0, NULL, 1, 0, N'newuser@yahoo.com')
GO
SET IDENTITY_INSERT [dbo].[BikeMakeID] ON 

INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (2, N'Yeti', N'Golden', N'CO')
INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (3, N'Trek', N'Waterloo', N'WI')
INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (4, N'Turner', N'Murietta', N'CA')
INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (5, N'Specialized', N'Morgan Hill', N'CA')
INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (6, N'Ibis', NULL, NULL)
INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (7, N'Radio Flyer', N'Kansas City', N'MO')
INSERT [dbo].[BikeMakeID] ([BikeMakeID], [Manufacturer], [City], [State]) VALUES (8, N'Sixthreezero', N'Martin City', N'MO')
SET IDENTITY_INSERT [dbo].[BikeMakeID] OFF
GO
SET IDENTITY_INSERT [dbo].[Bikes] ON 

INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (2, N'Rail                                              ', 9, 5999.0000, 25, CAST(N'2019-01-01' AS Date), N'65dae34c-69ac-4140-ae10-4444e48b5245.jpg', N'Rail 7 is a long-travel electric mountain bike built for ripping the big stuff. It features the same high-end trail tech as our analog trail bikes, an upgraded fork, drivetrain, battery, and more, plus a powerful new Bosch drive system thats basically like having your own shuttle.', 1, 1, 3, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (3, N'Slash 7                                           ', 10, 3499.9900, 1, CAST(N'2021-01-01' AS Date), N'3f3f9436-e7e3-43ab-ba1d-3210ac903d18.jpg', N'Slash 7 is a high-value all-mountain ripper that’s built for shredding singletrack at full speed. Its got a stout aluminum frame and capable suspension package that can smash through gnarly, choppy descents like nobodys business.', 1, 1, 3, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (4, N'Allez                                             ', 2, 8999.9900, 26, CAST(N'2019-01-01' AS Date), N'd4762a85-cb40-4c75-a146-82847f453f29.jpg', N'Focusing on weight, refinement, and reliability like nothing else in its class, the Allez is the first to make these technologies accessible to everyone.', 4, 1, 5, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (8, N'Steel Vintage                                     ', 2, 2120.9900, 5, CAST(N'1982-01-01' AS Date), N'3b8d1bf8-7eb0-4c07-a834-39eefa83df19.jpg', N'adfadfaf RAD BIKE', NULL, 1, 5, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (10, N'SB165                                             ', 10, 4999.9900, 15, CAST(N'2020-01-01' AS Date), N'a92d3368-90fc-4a40-afc9-d66c603f7b8c.jpg', N'Designed for ripping.', 6, 1, 2, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (11, N'SB150                                             ', 10, 2399.9900, 10, CAST(N'2020-01-01' AS Date), N'6f72b1c4-0c3d-414b-a705-d9c7a0e4a1b9.jpg', N'Designed for racing.', 1, 1, 2, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (12, N'EVRYjourney Electric Tricycle                     ', 9, 2399.9900, 10, CAST(N'2020-01-01' AS Date), N'2806e0d4-aa0d-4e02-b7a7-ecb66a1dc000.jpg', N'Do your grocery shopping on this little electric trike.', 4, 1, 8, NULL)
INSERT [dbo].[Bikes] ([BikeID], [BikeModel], [BikeTypeID], [Price], [UnitsSold], [Year], [BikeImage], [Description], [TireID], [BikeStatusID], [BikeMakeID], [IsSiteFeature]) VALUES (13, N'Classic Tricycle                                  ', 11, 59.9900, 30, CAST(N'2018-01-01' AS Date), N'a576dce6-5014-43c5-94dd-7e54a10d2261.jpg', N'Little red tricycle with a bell.', 5, 1, 7, NULL)
SET IDENTITY_INSERT [dbo].[Bikes] OFF
GO
SET IDENTITY_INSERT [dbo].[BikeStatuses] ON 

INSERT [dbo].[BikeStatuses] ([BikeStatusID], [BikeStatusName], [Notes]) VALUES (1, N'In Stock', NULL)
INSERT [dbo].[BikeStatuses] ([BikeStatusID], [BikeStatusName], [Notes]) VALUES (2, N'Out of Stock', NULL)
INSERT [dbo].[BikeStatuses] ([BikeStatusID], [BikeStatusName], [Notes]) VALUES (3, N'On Order', NULL)
SET IDENTITY_INSERT [dbo].[BikeStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[BikeType] ON 

INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (1, N'Cross Country       ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (2, N'Road Bike           ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (3, N'Hybrid/Commuter     ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (4, N'Cyclocross          ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (5, N'Enduro              ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (6, N'Folding             ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (7, N'Downhill            ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (9, N'Electric            ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (10, N'Mountain Bike       ')
INSERT [dbo].[BikeType] ([BikeTypeID], [BikeType]) VALUES (11, N'Tricycle            ')
SET IDENTITY_INSERT [dbo].[BikeType] OFF
GO
SET IDENTITY_INSERT [dbo].[TireType] ON 

INSERT [dbo].[TireType] ([TireID], [TireSize], [Tubeless]) VALUES (1, 29, N'yes       ')
INSERT [dbo].[TireType] ([TireID], [TireSize], [Tubeless]) VALUES (2, 29, N'no        ')
INSERT [dbo].[TireType] ([TireID], [TireSize], [Tubeless]) VALUES (3, 26, N'yes       ')
INSERT [dbo].[TireType] ([TireID], [TireSize], [Tubeless]) VALUES (4, 26, N'no        ')
INSERT [dbo].[TireType] ([TireID], [TireSize], [Tubeless]) VALUES (5, 10, N'no        ')
INSERT [dbo].[TireType] ([TireID], [TireSize], [Tubeless]) VALUES (6, 27, N'yes       ')
SET IDENTITY_INSERT [dbo].[TireType] OFF
GO
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteBike]) VALUES (N'81a34bd1-7d88-4a62-b07a-23d4a9d784e7', N'Elizabeth', N'Needham', N'specialized allez')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteBike]) VALUES (N'e4a80a31-dc16-44b1-b022-3fa343e2a3fa', N'Elizabeth', N'Needham', N'specialized allez')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/6/2020 1:43:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bikes]  WITH CHECK ADD  CONSTRAINT [FK_Bikes_BikeMakeID] FOREIGN KEY([BikeMakeID])
REFERENCES [dbo].[BikeMakeID] ([BikeMakeID])
GO
ALTER TABLE [dbo].[Bikes] CHECK CONSTRAINT [FK_Bikes_BikeMakeID]
GO
ALTER TABLE [dbo].[Bikes]  WITH CHECK ADD  CONSTRAINT [FK_Bikes_BikeStatuses] FOREIGN KEY([BikeStatusID])
REFERENCES [dbo].[BikeStatuses] ([BikeStatusID])
GO
ALTER TABLE [dbo].[Bikes] CHECK CONSTRAINT [FK_Bikes_BikeStatuses]
GO
ALTER TABLE [dbo].[Bikes]  WITH CHECK ADD  CONSTRAINT [FK_Bikes_BikeType] FOREIGN KEY([BikeTypeID])
REFERENCES [dbo].[BikeType] ([BikeTypeID])
GO
ALTER TABLE [dbo].[Bikes] CHECK CONSTRAINT [FK_Bikes_BikeType]
GO
ALTER TABLE [dbo].[Bikes]  WITH CHECK ADD  CONSTRAINT [FK_Bikes_TireType] FOREIGN KEY([TireID])
REFERENCES [dbo].[TireType] ([TireID])
GO
ALTER TABLE [dbo].[Bikes] CHECK CONSTRAINT [FK_Bikes_TireType]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
ALTER DATABASE [StoreFront] SET  READ_WRITE 
GO

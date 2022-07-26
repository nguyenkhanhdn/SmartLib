USE [master]
GO
/****** Object:  Database [SmartLib]    Script Date: 11/13/2022 10:44:07 PM ******/
CREATE DATABASE [SmartLib]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartLib', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SmartLib.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmartLib_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SmartLib_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SmartLib] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartLib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartLib] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartLib] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartLib] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartLib] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartLib] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartLib] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SmartLib] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartLib] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartLib] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartLib] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartLib] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartLib] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartLib] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartLib] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartLib] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmartLib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartLib] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartLib] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartLib] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartLib] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartLib] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmartLib] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartLib] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartLib] SET  MULTI_USER 
GO
ALTER DATABASE [SmartLib] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartLib] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartLib] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartLib] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SmartLib] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SmartLib]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/13/2022 10:44:07 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/13/2022 10:44:07 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/13/2022 10:44:07 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/13/2022 10:44:07 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/13/2022 10:44:07 PM ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Brief] [nvarchar](max) NOT NULL,
	[Publisher] [nvarchar](150) NULL,
	[PubYear] [varchar](4) NULL,
	[Author] [nvarchar](100) NULL,
	[BookCode] [varchar](50) NOT NULL,
	[QtyInStock] [int] NULL,
	[ViewNo] [int] NULL,
	[BorrowNo] [int] NULL,
	[CopyNo] [int] NULL,
	[CoverImg] [nvarchar](250) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Borrows]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Borrows](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[BookCode] [varchar](50) NOT NULL,
	[BorrowDate] [date] NOT NULL,
	[ReturnDate] [date] NULL,
	[Returned] [bit] NOT NULL CONSTRAINT [DF_Borrows_Returned]  DEFAULT ((0)),
 CONSTRAINT [PK_Borrows] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classes]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[BookCode] [varchar](50) NOT NULL,
	[RegDate] [date] NULL,
	[RecMethod] [nvarchar](150) NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[Note] [nvarchar](100) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Registration_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ClassId] [int] NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202207040321576_InitialCreate', N'SmartLib.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDD6EE3B612BE2F70DE41D0D539456AE5E7EC621BD82D5227392738F9C33A5B9CBB052DD18EB012A54A543641D127EB451FA9AFD0A144C9127F24CA566CA758606191C36F86C321391C0EF3E7EF7F8C7F7C0E03EB0927A91F91897D343AB42D4CDCC8F3C972626774F1DD07FBC71FFEF1CDF8C20B9FAD9F4BBA1346072D493AB11F298D4F1D27751F7188D251E8BB4994460B3A72A3D0415EE41C1F1E7EEF1C1D3918206CC0B2ACF1C78C503FC4F9077C4E23E2E2986628B8893C1CA4BC1C6A6639AA758B429CC6C8C5137B16A2845EFBF351416A5B67818F408C190E16B685088928A220E4E9A714CF681291E52C8602143CBCC418E81628483117FE74456EDA8FC363D60F67D5B08472B39446614FC0A313AE18476CBE967AED4A71A0BA0B50317D61BDCED537B1AF3C9C177D8C025080C8F0741A248C7862DF542CCED2F816D351D97054405E2600F7354ABE8CEA88079671BB83CA908E4787ECDF8135CD029A257842704613141C58F7D93CF0DDFFE19787E80B269393A3F9E2E4C3BBF7C83B79FF6F7CF2AEDE53E82BD0350AA0E83E89629C806C7851F5DFB69C663B476C5835ABB529B402B60473C2B66ED0F335264BFA08B3E5F8836D5DFACFD82B4BB8717D223E4C216844930C3E6FB32040F30057F54E2B4FF67F0BD7E377EF07E17A8B9EFC653EF4027F983809CCAB8F38C86BD3473F2EA65763BC3F73B2CB240AD977D3BE8ADACFB3284B5CD699484BF2809225A64DE9C6CECA788D4C9A410D6FD625EAFE9B369354366F2529EBD03A33A164B1EDD950CAFBBA7C8D2DEE2C8E61F072D3621A69333861A71A094D0FAC9260653447A64643A0337FE735F022447E30C02268C0059C8F859F84B8EAE54F11981C22BD65BE47690A6B80F75F943EB6880E3F07107D86DD2C01D39C5114C6AFCEEDFE3122F8360BE7CCE2B7C76BB0A179F81A5D229746C90561AD36C6BB8EDC2F51462F88778E28FE44DD12907D3EF8A139C020E29CB92E4ED34B3066EC4D23F0AD4BC02B424F8E7BC3B1D569D74EC834407EA8F6428475F47349BAF244D4149237A2215379246DA25E474B9F98895A92EA452D283A45E5647D4565606692724ABDA03941A79C05D5603E5E3E42C33B7939ECFE7B799B6DDEBAB5A0A6C619AC90F83F98E0049631EF1E518A13B21A0193756317CE423E7C8CE9ABEF4D39A79F51900DCD6AADD9902F02C3CF861C76FF67432E26143FF91EF34A0C8E3E2531C01BD1AB4F55DD734E906CDBD3A1D1CD6D33DFCE1AA09B2E67691AB97E3E0B14412F1EB268CA0F3E9CD51DBF287A23C640A06360E83EDBF2A004FA668B467547CE718029B6CEDC22283845A98B3C598DD021AF8760E58EAA106C150B690AF7ADC4132C1D27AC116287A01466AA4FA83C2D7CE2FA310A3AB524B434DCC258DF2B1E62CD398E31610C3B3561C25C1DFA6002547C8441E9D2D0D8A9595CBB216ABC56DD9877B9B0AB719722125BB1C90EDF596397DC7F7B15C36CD7D8168CB35D25260268C378BB30507E56313500F1E0B26F062A9C983406CA5DAAAD186853633B30D0A64ADE9C81164754D3F117CEABFB669ECD83F2F6B7F55675EDC0361BFAD833D32C7C4F6843A1054E64F33C9FB34AFC4C15873390939FCF52EEEA8A26C2C067983643362B7F57E9873AED20A211B501AE0CAD03945F004A40D284EA215C19CB6B958E7B113D60CBB85B2B2C5FFB05D89A0DC8D8F58BD01AA1FEBA54344EA3D347D5B3CA1A2423373A2CD4701406212E5ECD8E1B28451797951563E20BF7F1866B1DE383D1A2A00ECF55A3A4B233836BA934CD6E2DA91CB23E2ED9465A12DC278D96CACE0CAE256EA3DD4A5238053DDC828D54D4DCC2079A6C65A4A3DA6DAABAB1532447F182B1A3C9A21ADFA038F6C9B29655C54BAC59915235FD6ED63FDD282C301C3755641D55D2569C6894A025166A8135487AE927293D4714CD118BF34CBD502253EEAD9AE5BF6459DF3EE5412CF781929AFDE637ABC2B57D63A3953D110E7009DD0B993B93C7D01583AF6E6EB1143714A04411B69F46411612BD77A56F5D5CDED5DB172532C2D811E497BC274955928FDBD4BBD1A8C833628811AA3C97F547490FA1D375E977D6B5ADF345F5286568AA8EA20B57ED6CD4742E8CF94889AE61FF81EA44789D19C5F351EA00BCA827462DA54102ABD599A336B34EEA98CD1A734421B5A40E2954F590B29E40D210B25EB1169E46A36A0A730E72CA481D5DAE354756248FD4A115D56B602B6416EBCC5115F925756045B539F62AD9445C41F778CFD21E58D6DBB48A03ED66BB9606E37596C36136BDDABD7D1DA856DC138BDFCC4B60BC7C2F4D497BAA5BCF948A20C666A6A4C1D0AF398DEBEEE692D37A47AFC76CDC613796F5B63B7C3D5E3F837D55B3904E742249C5BD3AD90927B8313F4D753F96918E5705896D956A04637A49290E478C6034FB2598063E660B7849708388BFC0292DF236ECE3C3A363E1C9CDFE3C7F71D2D40B14A751DD1B98E6986D21058B3CA1C47D44899C10B1C1139115A8146BBE221E7E9ED8BFE6AD4EF3B005FB95171F5857E927E2FF9241C5439261EB3739C17398947983471A95A0BFBD89D70FE62ABFFAFFE7A2E9817597C0743AB50E0545AF33FCCD3711BDA4299A6E20CDDA2F25DEEE6C6B3C4650A20AB365FDB707739F0EF2EEA094F29F217AFE575FD1946F0B364254BC1F180A6F1015EADE07AC83A57D1BE0C127CDDF06F4EBACFAADC03AA269DF09F8A43F98F84AC07C192A5BEE701F529C96B6B124E57AEECCB2DE28E572D77B93948CBDD1449713AE7BC00D9A54BD998BF2C6929507DB3A15B9C88361EFD2EE5F3D01795F728E574EFB6E538DB7995DDC728FF4B74A2ADE833438455ACFEE5387B76D6BBAF0EF9EE75FF64B10DE3363E3DBFCEED380B76D6CBA00F19E1B5BAF64DF3DB3B55DED9F3BB634E32D74E7A9BB721692E61A471545EE4ACD2D42EE70FC9F476004854759BCA854E782B5E5B176305C91E899EA93D044C6D2C491F84A14ED6CFBF5956FF8AD9DE534ED6C35A99B6DBCF9FADFCA9BD3B4F3D62444EE22A9589992A84AF4EE58C7DAB2A6DE521271A3271D39EB5D3E6BEB9DFC5BCA191E44298DD9A3B95D7E3B29C283A864C8A9D3232558BE2886BDB3F6B71761FF4EFDE50A82FD254682DDC6AE59D15C9145546EDE8244258910A1B9C11479B0A59E25D45F209742350B40E74FC2F3A01EBB069963EF8ADC6534CE28741987F3A011F0624E401BFF3CEFB929F3F82E665FE9105D00317D16B8BF233F657EE055725F2A62421A08E65DF0702F1B4BCAC2BECB970AE9362286405C7D9553F480C33800B0F48ECCD0135E473630BF6BBC44EECB2A02A803E91E88A6DAC7E73E5A26284C39C6AA3D7C820D7BE1F30F7F011EC6823882540000, N'6.2.0-61023')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4c1cdd4d-a142-4b8b-8662-69550cd9af31', N'khanhdsp@gmail.com', 0, N'ANCeEn2vwFv6YKpmPjWAJ+0ozHvjD3SJjon5MdhDdq/chmt263iZLjYMS82aoggpbA==', N'36b934c5-8ca7-4207-999b-e00aa4fe69a0', NULL, 0, 0, NULL, 1, 0, N'khanhdsp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8efb025f-57cd-4572-aba3-c2297e0b033d', N'user01@smartlibrary.edu.vn', 0, N'AJmHtRznvQFpr1wSDpwljDtOpS3aNbm+lDVHp6Os81xvgS1Xc6t9cyyru16eKO2yUw==', N'e7d954d0-0115-466f-b7ff-63897536a1c1', NULL, 0, 0, NULL, 1, 0, N'user01')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd62d66d5-cebc-4134-8f53-777c31e8c11c', N'admin@smartlibrary.edu.vn', 0, N'ANc0x0DHyoyaEDCmMGt6V83gGSz2tx5UbpEAaFBuieC6g3y19cBPxEeLjAFAN/Ph/w==', N'5f110b8c-8595-44d9-8fde-06c344973cb0', NULL, 0, 0, NULL, 1, 0, N'admin')
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [CategoryId], [Brief], [Publisher], [PubYear], [Author], [BookCode], [QtyInStock], [ViewNo], [BorrowNo], [CopyNo], [CoverImg]) VALUES (8, N'Toán lớp 6', 1, N'<p>S&aacute;ch to&aacute;n lớp 6</p>
', N'NXB Giáo dục', N'2020', N'Author 4', N'0123456786', 10, 10, 0, 20, N'/ckfinder/userfiles/images/book01.png')
INSERT [dbo].[Books] ([Id], [Title], [CategoryId], [Brief], [Publisher], [PubYear], [Author], [BookCode], [QtyInStock], [ViewNo], [BorrowNo], [CopyNo], [CoverImg]) VALUES (7, N'Toán lớp 8', 1, N'<p>S&aacute;ch to&aacute;n lớp 8</p>
', N'NXB Giáo dục', N'2020', N'Author 3', N'0123456787', 11, 2, 0, 20, N'/ckfinder/userfiles/images/book01.png')
INSERT [dbo].[Books] ([Id], [Title], [CategoryId], [Brief], [Publisher], [PubYear], [Author], [BookCode], [QtyInStock], [ViewNo], [BorrowNo], [CopyNo], [CoverImg]) VALUES (4, N'Toán lớp 9', 1, N'<p>S&aacute;ch to&aacute;n lớp 9</p>
', N'NXB Giáo dục', N'2020', N'Author 2', N'0123456788', 10, 2, 0, 20, N'/ckfinder/userfiles/images/book01.png')
INSERT [dbo].[Books] ([Id], [Title], [CategoryId], [Brief], [Publisher], [PubYear], [Author], [BookCode], [QtyInStock], [ViewNo], [BorrowNo], [CopyNo], [CoverImg]) VALUES (3, N'Toán lớp 7', 1, N'<p>S&aacute;ch to&aacute;n lớp 7</p>
', N'NXB Giáo dục', N'2020', N'Author 1', N'0123456789', 10, 3, 0, 20, N'/ckfinder/userfiles/images/book01.png')
INSERT [dbo].[Books] ([Id], [Title], [CategoryId], [Brief], [Publisher], [PubYear], [Author], [BookCode], [QtyInStock], [ViewNo], [BorrowNo], [CopyNo], [CoverImg]) VALUES (13, N'Sách mới về', 2, N'<p>S&aacute;ch mới về</p>
', N'Kim Đồng', N'2022', N'MSN', N'02030405', 10, 3, 0, 10, N'/ckfinder/userfiles/images/book01.png')
INSERT [dbo].[Books] ([Id], [Title], [CategoryId], [Brief], [Publisher], [PubYear], [Author], [BookCode], [QtyInStock], [ViewNo], [BorrowNo], [CopyNo], [CoverImg]) VALUES (11, N'sách mới nhập', 1, N'<p>S&aacute;ch mới nhập</p>
', N'Kim Đồng', N'2022', N'Hoàng Thanh', N'0203045', 0, 10, 0, 10, N'/ckfinder/userfiles/images/book01.png')
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Borrows] ON 

INSERT [dbo].[Borrows] ([Id], [StudentId], [BookCode], [BorrowDate], [ReturnDate], [Returned]) VALUES (1, 2, N'0123456786', CAST(N'2022-07-07' AS Date), CAST(N'2022-08-10' AS Date), 1)
INSERT [dbo].[Borrows] ([Id], [StudentId], [BookCode], [BorrowDate], [ReturnDate], [Returned]) VALUES (2, 2, N'0123456787', CAST(N'2022-07-07' AS Date), CAST(N'2022-08-10' AS Date), 1)
INSERT [dbo].[Borrows] ([Id], [StudentId], [BookCode], [BorrowDate], [ReturnDate], [Returned]) VALUES (6, 1, N'0123456787', CAST(N'2022-08-07' AS Date), NULL, 0)
INSERT [dbo].[Borrows] ([Id], [StudentId], [BookCode], [BorrowDate], [ReturnDate], [Returned]) VALUES (7, 1, N'0123456786', CAST(N'2022-08-04' AS Date), CAST(N'2022-08-10' AS Date), 1)
INSERT [dbo].[Borrows] ([Id], [StudentId], [BookCode], [BorrowDate], [ReturnDate], [Returned]) VALUES (8, 1, N'02030405', CAST(N'2022-08-10' AS Date), CAST(N'2022-08-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Borrows] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (1, N'Toán')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Ngữ văn')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (3, N'Vật lý')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (4, N'Hóa học')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (5, N'Địa lý')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (6, N'Lịch sử')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (7, N'Sinh vật')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (9, N'Kỹ thuật')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (10, N'Ngoại ngữ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (1, N'Lớp 6/1')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (2, N'Lớp 6/2')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (3, N'Lớp 6/3')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (4, N'Lớp 7/1')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (5, N'Lớp 7/2')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (6, N'Lớp 7/3')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (7, N'Lớp 8/1')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (8, N'Lớp 8/2')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (9, N'Lớp 8/3')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (10, N'Lớp 9/1')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (11, N'Lớp 9/2')
INSERT [dbo].[Classes] ([Id], [ClassName]) VALUES (12, N'Lớp 9/3')
SET IDENTITY_INSERT [dbo].[Classes] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([Id], [StudentId], [BookCode], [RegDate], [RecMethod], [Address], [Phone], [Note], [Status]) VALUES (1, 2, N'0123456786', CAST(N'2022-05-08' AS Date), N'Nhận sách tại nhà', N'137 NTT', N'0905555666', NULL, 1)
INSERT [dbo].[Registration] ([Id], [StudentId], [BookCode], [RegDate], [RecMethod], [Address], [Phone], [Note], [Status]) VALUES (2, 2, N'0123456787', CAST(N'2022-05-08' AS Date), N'Nhận sách tại nhà', N'137 NTT', N'0905555666', NULL, 1)
INSERT [dbo].[Registration] ([Id], [StudentId], [BookCode], [RegDate], [RecMethod], [Address], [Phone], [Note], [Status]) VALUES (3, 2, N'0123456788', CAST(N'2022-05-08' AS Date), N'Nhận sách tại nhà', N'121 Lê Thanh Nghị - Hải Châu - Đà Nẵng', N'0905555666', N'Giao sách tại địa chỉ trên', 1)
INSERT [dbo].[Registration] ([Id], [StudentId], [BookCode], [RegDate], [RecMethod], [Address], [Phone], [Note], [Status]) VALUES (4, 1, N'02030405', CAST(N'2022-08-09' AS Date), N'Nhận sách tại nhà', N'121 Lê Thanh Nghị - Hải Châu - Đà Nẵng', N'0905555666', N'Giao sách tại địa chỉ trên', 1)
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [ClassId], [Address], [Phone], [Email]) VALUES (1, N'Nguyễn Văn A', 1, N'Sơn Trà', N'0905555111', N'admin@smartlibrary.edu.vn')
INSERT [dbo].[Students] ([Id], [Name], [ClassId], [Address], [Phone], [Email]) VALUES (2, N'Trần Trọng Trách', 1, N'Hải Châu', N'0903334455', N'khanhdsp@gmail.com')
INSERT [dbo].[Students] ([Id], [Name], [ClassId], [Address], [Phone], [Email]) VALUES (3, N'Học sinh 01', 1, N'Đà Nẵng', N'0905555666', N'user01@smartlibrary.edu.vn')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/13/2022 10:44:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/13/2022 10:44:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/13/2022 10:44:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/13/2022 10:44:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/13/2022 10:44:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/13/2022 10:44:07 PM ******/
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
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Books] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Books]
GO
ALTER TABLE [dbo].[Borrows]  WITH CHECK ADD  CONSTRAINT [FK_Borrows_Books] FOREIGN KEY([BookCode])
REFERENCES [dbo].[Books] ([BookCode])
GO
ALTER TABLE [dbo].[Borrows] CHECK CONSTRAINT [FK_Borrows_Books]
GO
ALTER TABLE [dbo].[Borrows]  WITH CHECK ADD  CONSTRAINT [FK_Borrows_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Borrows] CHECK CONSTRAINT [FK_Borrows_Students]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Books] FOREIGN KEY([BookCode])
REFERENCES [dbo].[Books] ([BookCode])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Books]
GO
ALTER TABLE [dbo].[Registration]  WITH NOCHECK ADD  CONSTRAINT [FK_Registration_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Classes]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK_Books] CHECK  (([QtyInStock]>=(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK_Books]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentsToRemind]    Script Date: 11/13/2022 10:44:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetStudentsToRemind]
as
SELECT  Students.Name, Students.Email, Books.Title, Borrows.BorrowDate
FROM   Borrows INNER JOIN Students
ON Borrows.StudentId = Students.Id INNER JOIN Books on Books.BookCode = Borrows.BookCode
where Borrows.Returned = 0 --chưa trả
and (DATEDIFF(DAY,BorrowDate,getdate())>14)
GO
USE [master]
GO
ALTER DATABASE [SmartLib] SET  READ_WRITE 
GO

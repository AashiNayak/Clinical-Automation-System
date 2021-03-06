USE [master]
GO
/****** Object:  Database [Clinic automation system]    Script Date: 7/15/2020 1:30:26 PM ******/
CREATE DATABASE [Clinic automation system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinic automation system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Clinic automation system.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clinic automation system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Clinic automation system_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Clinic automation system] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinic automation system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinic automation system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinic automation system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinic automation system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinic automation system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinic automation system] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinic automation system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinic automation system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinic automation system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinic automation system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinic automation system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinic automation system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinic automation system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinic automation system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinic automation system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinic automation system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinic automation system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinic automation system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinic automation system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinic automation system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinic automation system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinic automation system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinic automation system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinic automation system] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clinic automation system] SET  MULTI_USER 
GO
ALTER DATABASE [Clinic automation system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinic automation system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinic automation system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinic automation system] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Clinic automation system] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Clinic automation system]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Address] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[SpecializedId] [int] NOT NULL,
	[TotalExperience] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoctorAppointment]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoctorAppointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Subject] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[AppointmentDate] [date] NOT NULL,
	[AppointmentStatus] [varchar](10) NOT NULL CONSTRAINT [DF_DoctorAppointment_AppointmentStatus]  DEFAULT ('Requested'),
	[AppointmentRecieveDate] [datetime] NULL,
 CONSTRAINT [PK_DoctorAppointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Drug]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drug](
	[DrugId] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [varchar](150) NOT NULL,
	[ManufactureDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[UsedFor] [varchar](250) NOT NULL,
	[SideEffects] [varchar](250) NOT NULL,
	[TotalQuantityAvailable] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Drug_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Drug] PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DrugDelivery]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugDelivery](
	[DeliveryId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[SupplierId] [int] NULL,
	[DeliverDate] [date] NULL,
 CONSTRAINT [PK_DrugDelivery] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inbox]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inbox](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[FromEmailId] [varchar](50) NOT NULL,
	[ToEmailId] [varchar](50) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[MessageDetail] [varchar](50) NOT NULL,
	[MessageDate] [date] NOT NULL,
	[ReplyId] [int] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Inbox] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MemberLogin]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberLogin](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_MemberLogin] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientOrderDetails]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientOrderDetails](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DrugId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderStatus] [nchar](10) NOT NULL,
 CONSTRAINT [PK_OrderHeader] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleDetails]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Role Details] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpecializedDetails]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpecializedDetails](
	[SpecializedId] [int] IDENTITY(1,1) NOT NULL,
	[SpecializedName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SpecializedDetails] PRIMARY KEY CLUSTERED 
(
	[SpecializedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyAddress] [varchar](max) NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_MemberLogin] FOREIGN KEY([MemberId])
REFERENCES [dbo].[MemberLogin] ([MemberId])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_MemberLogin]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_SpecializedDetails] FOREIGN KEY([SpecializedId])
REFERENCES [dbo].[SpecializedDetails] ([SpecializedId])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_SpecializedDetails]
GO
ALTER TABLE [dbo].[DoctorAppointment]  WITH NOCHECK ADD  CONSTRAINT [FK_DoctorAppointment_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO
ALTER TABLE [dbo].[DoctorAppointment] CHECK CONSTRAINT [FK_DoctorAppointment_Doctor]
GO
ALTER TABLE [dbo].[DoctorAppointment]  WITH CHECK ADD  CONSTRAINT [FK_DoctorAppointment_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[DoctorAppointment] CHECK CONSTRAINT [FK_DoctorAppointment_Patient]
GO
ALTER TABLE [dbo].[DrugDelivery]  WITH CHECK ADD  CONSTRAINT [FK_DrugDelivery_PatientOrderDetails] FOREIGN KEY([OrderId])
REFERENCES [dbo].[PatientOrderDetails] ([OrderId])
GO
ALTER TABLE [dbo].[DrugDelivery] CHECK CONSTRAINT [FK_DrugDelivery_PatientOrderDetails]
GO
ALTER TABLE [dbo].[DrugDelivery]  WITH CHECK ADD  CONSTRAINT [FK_DrugDelivery_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[DrugDelivery] CHECK CONSTRAINT [FK_DrugDelivery_Supplier]
GO
ALTER TABLE [dbo].[MemberLogin]  WITH CHECK ADD  CONSTRAINT [FK_User_RoleDetails] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleDetails] ([RoleId])
GO
ALTER TABLE [dbo].[MemberLogin] CHECK CONSTRAINT [FK_User_RoleDetails]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_MemberLogin] FOREIGN KEY([MemberId])
REFERENCES [dbo].[MemberLogin] ([MemberId])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_MemberLogin]
GO
ALTER TABLE [dbo].[PatientOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_Drug] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drug] ([DrugId])
GO
ALTER TABLE [dbo].[PatientOrderDetails] CHECK CONSTRAINT [FK_OrderHeader_Drug]
GO
ALTER TABLE [dbo].[PatientOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[PatientOrderDetails] CHECK CONSTRAINT [FK_OrderHeader_Patient]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_MemberLogin] FOREIGN KEY([MemberId])
REFERENCES [dbo].[MemberLogin] ([MemberId])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_MemberLogin]
GO
/****** Object:  StoredProcedure [dbo].[AddAppointment]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddAppointment]
@pid int,
@did int,
@subject varchar(50),
@description varchar(max),
@adate date
as
begin
insert into DoctorAppointment(PatientId,DoctorId,Subject,Description,AppointmentRecieveDate,AppointmentDate)
values(@pid,@did,@subject,@description,GETDATE(),@adate) 
end
GO
/****** Object:  StoredProcedure [dbo].[AddMember]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddMember]
@email varchar(50),@pwd varchar(50), @roleid int, @id int output
as
begin 
insert into MemberLogin(Email,Password,RoleId)
values(@email,@pwd,@roleid)
select @id = MemberId from MemberLogin where Email=@email
end
GO
/****** Object:  StoredProcedure [dbo].[ReturnMemberId]    Script Date: 7/15/2020 1:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ReturnMemberId]
@email varchar(50),
@id int output
as
begin
select @id = MemberId from MemberLogin where Email= @email
end
GO
USE [master]
GO
ALTER DATABASE [Clinic automation system] SET  READ_WRITE 
GO

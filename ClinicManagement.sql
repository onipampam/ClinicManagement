USE [dbClinicManagement]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 29/11/2017 1:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [varchar](20) NOT NULL,
	[SupplyID] [int] NULL,
	[StaffID] [varchar](20) NULL,
	[SupplyQuantity] [int] NULL,
	[ExpirationDate] [date] NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedCheckDetail]    Script Date: 29/11/2017 1:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedCheckDetail](
	[MedCheckHID] [varchar](20) NOT NULL,
	[DateofVisit] [date] NULL,
	[TimeofVisit] [time](7) NULL,
	[Complaint] [text] NULL,
	[Diagnosis] [text] NULL,
	[Treatment] [text] NULL,
	[Remarks] [text] NULL,
 CONSTRAINT [PK_MedCheckDetail] PRIMARY KEY CLUSTERED 
(
	[MedCheckHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedCheckHeader]    Script Date: 29/11/2017 1:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedCheckHeader](
	[MedCheckHID] [varchar](20) NOT NULL,
	[StaffID] [varchar](20) NULL,
	[PatientID] [int] NULL,
	[InventoryID] [varchar](20) NULL,
	[MedCheckType] [int] NULL,
	[MedCheckStatus] [int] NULL,
 CONSTRAINT [PK_MedCheckHeader] PRIMARY KEY CLUSTERED 
(
	[MedCheckHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 29/11/2017 1:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientLast] [varchar](50) NULL,
	[PatientFirst] [varchar](max) NULL,
	[PatientMid] [varchar](50) NULL,
	[PatientGender] [int] NULL,
	[PatientBDate] [date] NULL,
	[PatientAddrss] [text] NULL,
	[PatientType] [int] NULL,
	[PatientClass] [int] NULL,
	[CollegeID] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCollege]    Script Date: 29/11/2017 1:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCollege](
	[CollegeID] [int] IDENTITY(1,1) NOT NULL,
	[CollegeCode] [varchar](10) NULL,
	[CollegeName] [varchar](max) NULL,
 CONSTRAINT [PK_PCollege] PRIMARY KEY CLUSTERED 
(
	[CollegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 29/11/2017 1:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [varchar](20) NOT NULL,
	[StaffLast] [varchar](50) NULL,
	[StaffFirst] [varchar](max) NULL,
	[StaffMid] [varchar](50) NULL,
	[StaffGender] [int] NULL,
	[StaffPassword] [varchar](20) NOT NULL,
	[StaffJoinedDate] [nchar](10) NULL,
	[StaffType] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 29/11/2017 1:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[SupplyID] [int] NOT NULL,
	[SupplyName] [varchar](max) NULL,
	[ReceivedDate] [date] NULL,
	[SupplyType] [int] NOT NULL,
 CONSTRAINT [PK_Supply] PRIMARY KEY CLUSTERED 
(
	[SupplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Staff]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Supply] FOREIGN KEY([SupplyID])
REFERENCES [dbo].[Supply] ([SupplyID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Supply]
GO
ALTER TABLE [dbo].[MedCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_MedCheckDetail_MedCheckHeader] FOREIGN KEY([MedCheckHID])
REFERENCES [dbo].[MedCheckHeader] ([MedCheckHID])
GO
ALTER TABLE [dbo].[MedCheckDetail] CHECK CONSTRAINT [FK_MedCheckDetail_MedCheckHeader]
GO
ALTER TABLE [dbo].[MedCheckHeader]  WITH CHECK ADD  CONSTRAINT [FK_MedCheckHeader_Inventory] FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[MedCheckHeader] CHECK CONSTRAINT [FK_MedCheckHeader_Inventory]
GO
ALTER TABLE [dbo].[MedCheckHeader]  WITH CHECK ADD  CONSTRAINT [FK_MedCheckHeader_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[MedCheckHeader] CHECK CONSTRAINT [FK_MedCheckHeader_Patient]
GO
ALTER TABLE [dbo].[MedCheckHeader]  WITH CHECK ADD  CONSTRAINT [FK_MedCheckHeader_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[MedCheckHeader] CHECK CONSTRAINT [FK_MedCheckHeader_Staff]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_PCollege] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[PCollege] ([CollegeID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_PCollege]
GO

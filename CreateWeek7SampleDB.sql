-- Change the context to the “master” database
USE master;

-- Go is the batch separator used to execute multiple SQL statements together. 
GO

DROP DATABASE IF EXISTS Week7SampleDB;
GO

CREATE DATABASE Week7SampleDB;
GO

-- Change the context to the newly created database
USE [Week7SampleDB]
GO

/****** Object:  Table [dbo].[newVendors]    Script Date: 17/10/2023 ******/

-- Turn the ANSI_NULLS setting on. With this, comparisons involving NULL values follow ANSI standards.
SET ANSI_NULLS ON
GO

-- Turn the QUOTED_IDENTIFIER setting on to enforce double quotes as string delimiters (which is an SQL standard).

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[newVendors](

	-- The IDENTITY(1,1) specification indicates that VendorID is an identity column, which automatically generates unique values starting from 1, with an increment of 1
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
) ON [PRIMARY]
)
GO

-- Enable identity insert for the “newVendors” table. It allows inserting explicit values into an identity column.
SET IDENTITY_INSERT [dbo].[newVendors] ON 

-- Start inserting records (values) into the newly created database
INSERT [dbo].[newVendors] ([VendorID], [VendorName]) VALUES (1, N'Vendor A')
INSERT [dbo].[newVendors] ([VendorID], [VendorName]) VALUES (2, N'Vendor B')
INSERT [dbo].[newVendors] ([VendorID], [VendorName]) VALUES (3, N'Vendor C')

/****** Object:  Table [dbo].[newInvoices]    Script Date: 17/10/2023 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newInvoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[VendorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
) ON [PRIMARY]
)
GO

-- The following ALTER TABLE command is used to add a foreign key constraint to the newInvoices table. It ensures that the values in the VendorID column must match values in the VendorID column of another table (presumably newVendors). ‘WITH CHECK’ indicates that the constraint will be checked immediately.
ALTER TABLE [dbo].[newInvoices]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[newVendors] ([VendorID])
GO

 INSERT [dbo].[newInvoices] ([InvoiceTotal], [VendorID]) VALUES (600,1)
 INSERT [dbo].[newInvoices] ([InvoiceTotal], [VendorID]) VALUES (400,1)
 INSERT [dbo].[newInvoices] ([InvoiceTotal], [VendorID]) VALUES (300,2)
 INSERT [dbo].[newInvoices] ([InvoiceTotal], [VendorID]) VALUES (200,2)
 INSERT [dbo].[newInvoices] ([InvoiceTotal], [VendorID]) VALUES (900,3)

-- REFERENCES/READING:
-- https://learnsql.com/blog/sql-server-cheat-sheet/sql-server-cheat-sheet-a4.pdf   

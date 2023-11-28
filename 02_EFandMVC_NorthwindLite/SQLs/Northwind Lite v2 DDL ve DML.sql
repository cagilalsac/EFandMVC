use master
go
if exists (select name from sys.databases where name = 'NorthwindLiteV2')
begin
	alter database NorthwindLiteV2 set single_user with rollback immediate
	drop database NorthwindLiteV2
end
go
create database NorthwindLiteV2
go
USE [NorthwindLiteV2]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2.09.2023 18:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 2.09.2023 18:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2.09.2023 18:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2.09.2023 18:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Dairy Products', N'Cheeses')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Meat/Poultry', N'Prepared meats')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Produce', N'Dried fruit and bean curd')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (8, N'Seafood', N'Seaweed and fish')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10248, 11, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10248, 42, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10248, 72, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10249, 14, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10249, 51, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10250, 41, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10250, 51, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10250, 65, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10251, 22, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10251, 57, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10251, 65, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10252, 20, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10252, 33, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10252, 60, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10253, 31, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10253, 39, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10253, 49, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10254, 24, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10254, 55, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10254, 74, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10255, 2, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10255, 16, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10255, 36, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10255, 59, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10256, 53, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10256, 77, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10257, 27, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10257, 39, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10257, 77, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10258, 2, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10258, 5, 65, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10258, 32, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10259, 21, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10259, 37, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10260, 41, 16, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10260, 57, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10260, 62, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10260, 70, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10261, 21, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10261, 35, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10262, 5, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10262, 7, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10262, 56, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10263, 16, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10263, 24, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10263, 30, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10263, 74, 36, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10264, 2, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10264, 41, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10265, 17, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10265, 70, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10266, 12, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10267, 40, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10267, 59, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10267, 76, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10268, 29, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10268, 72, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10269, 33, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10269, 72, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10270, 36, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10270, 43, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10271, 33, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10272, 20, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10272, 31, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10272, 72, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10273, 10, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10273, 31, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10273, 33, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10273, 40, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10273, 76, 33, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10274, 71, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10274, 72, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10275, 24, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10275, 59, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10276, 10, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10276, 13, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10277, 28, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10277, 62, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10278, 44, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10278, 59, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10278, 63, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10278, 73, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10279, 17, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10280, 24, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10280, 55, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10280, 75, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10281, 19, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10281, 24, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10281, 35, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10282, 30, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10282, 57, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10283, 15, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10283, 19, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10283, 60, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10283, 72, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10284, 27, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10284, 44, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10284, 60, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10284, 67, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10285, 1, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10285, 40, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10285, 53, 36, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10286, 35, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10286, 62, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10287, 16, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10287, 34, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10287, 46, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10288, 54, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10288, 68, 3, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10289, 3, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10289, 64, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10290, 5, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10290, 29, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10290, 49, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10290, 77, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10291, 13, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10291, 44, 24, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10291, 51, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10292, 20, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10293, 18, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10293, 24, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10293, 63, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10293, 75, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10294, 1, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10294, 17, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10294, 43, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10294, 60, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10294, 75, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10295, 56, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10296, 11, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10296, 16, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10296, 69, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10297, 39, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10297, 72, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10298, 2, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10298, 36, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10298, 59, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10298, 62, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10299, 19, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10299, 70, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10300, 66, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10300, 68, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10301, 40, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10301, 56, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10302, 17, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10302, 28, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10302, 43, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10303, 40, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10303, 65, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10303, 68, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10304, 49, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10304, 59, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10304, 71, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10305, 18, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10305, 29, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10305, 39, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10306, 30, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10306, 53, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10306, 54, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10307, 62, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10307, 68, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10308, 69, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10308, 70, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10309, 4, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10309, 6, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10309, 42, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10309, 43, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10309, 71, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10310, 16, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10310, 62, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10311, 42, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10311, 69, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10312, 28, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10312, 43, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10312, 53, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10312, 75, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10313, 36, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10314, 32, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10314, 58, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10314, 62, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10315, 34, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10315, 70, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10316, 41, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10316, 62, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10317, 1, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10318, 41, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10318, 76, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10319, 17, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10319, 28, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10319, 76, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10320, 71, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10321, 35, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10322, 52, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10323, 15, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10323, 25, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10323, 39, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10324, 16, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10324, 35, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10324, 46, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10324, 59, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10324, 63, 80, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10325, 6, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10325, 13, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10325, 14, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10325, 31, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10325, 72, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10326, 4, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10326, 57, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10326, 75, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10327, 2, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10327, 11, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10327, 30, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10327, 58, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10328, 59, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10328, 65, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10328, 68, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10329, 19, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10329, 30, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10329, 38, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10329, 56, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10330, 26, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10330, 72, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10331, 54, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10332, 18, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10332, 42, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10332, 47, 16, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10333, 14, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10333, 21, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10333, 71, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10334, 52, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10334, 68, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10335, 2, 7, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10335, 31, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10335, 32, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10335, 51, 48, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10336, 4, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10337, 23, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10337, 26, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10337, 36, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10337, 37, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10337, 72, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10338, 17, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10338, 30, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10339, 4, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10339, 17, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10339, 62, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10340, 18, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10340, 41, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10340, 43, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10341, 33, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10341, 59, 9, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10342, 2, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10342, 31, 56, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10342, 36, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10342, 55, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10343, 64, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10343, 68, 4, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10343, 76, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10344, 4, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10344, 8, 70, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10345, 8, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10345, 19, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10345, 42, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10346, 17, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10346, 56, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10347, 25, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10347, 39, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10347, 40, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10347, 75, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10348, 1, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10348, 23, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10349, 54, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10350, 50, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10350, 69, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10351, 38, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10351, 41, 13, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10351, 44, 77, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10351, 65, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10352, 24, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10352, 54, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10353, 11, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10353, 38, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10354, 1, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10354, 29, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10355, 24, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10355, 57, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10356, 31, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10356, 55, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10356, 69, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10357, 10, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10357, 26, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10357, 60, 8, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10358, 24, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10358, 34, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10358, 36, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10359, 16, 56, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10359, 31, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10359, 60, 80, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10360, 28, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10360, 29, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10360, 38, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10360, 49, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10360, 54, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10361, 39, 54, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10361, 60, 55, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10362, 25, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10362, 51, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10362, 54, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10363, 31, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10363, 75, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10363, 76, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10364, 69, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10364, 71, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10365, 11, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10366, 65, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10366, 77, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10367, 34, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10367, 54, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10367, 65, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10367, 77, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10368, 21, 5, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10368, 28, 13, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10368, 57, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10368, 64, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10369, 29, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10369, 56, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10370, 1, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10370, 64, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10370, 74, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10371, 36, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10372, 20, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10372, 38, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10372, 60, 70, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10372, 72, 42, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10373, 58, 80, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10373, 71, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10374, 31, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10374, 58, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10375, 14, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10375, 54, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10376, 31, 42, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10377, 28, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10377, 39, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10378, 71, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10379, 41, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10379, 63, 16, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10379, 65, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10380, 30, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10380, 53, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10380, 60, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10380, 70, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10381, 74, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10382, 5, 32, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10382, 18, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10382, 29, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10382, 33, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10382, 74, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10383, 13, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10383, 50, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10383, 56, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10384, 20, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10384, 60, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10385, 7, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10385, 60, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10385, 68, 8, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10386, 24, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10386, 34, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10387, 24, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10387, 28, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10387, 59, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10387, 71, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10388, 45, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10388, 52, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10388, 53, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10389, 10, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10389, 55, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10389, 62, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10389, 70, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10390, 31, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10390, 35, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10390, 46, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10390, 72, 24, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10391, 13, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10392, 69, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10393, 2, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10393, 14, 42, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10393, 25, 7, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10393, 26, 70, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10393, 31, 32, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10394, 13, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10394, 62, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10395, 46, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10395, 53, 70, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10395, 69, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10396, 23, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10396, 71, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10396, 72, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10397, 21, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10397, 51, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10398, 35, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10398, 55, 120, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10399, 68, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10399, 71, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10399, 76, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10399, 77, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10400, 29, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10400, 35, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10400, 49, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10401, 30, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10401, 56, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10401, 65, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10401, 71, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10402, 23, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10402, 63, 65, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10403, 16, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10403, 48, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10404, 26, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10404, 42, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10404, 49, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10405, 3, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10406, 1, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10406, 21, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10406, 28, 42, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10406, 36, 5, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10406, 40, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10407, 11, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10407, 69, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10407, 71, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10408, 37, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10408, 54, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10408, 62, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10409, 14, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10409, 21, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10410, 33, 49, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10410, 59, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10411, 41, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10411, 44, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10411, 59, 9, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10412, 14, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10413, 1, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10413, 62, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10413, 76, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10414, 19, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10414, 33, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10415, 17, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10415, 33, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10416, 19, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10416, 53, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10416, 57, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10417, 38, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10417, 46, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10417, 68, 36, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10417, 77, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10418, 2, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10418, 47, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10418, 61, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10418, 74, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10419, 60, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10419, 69, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10420, 9, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10420, 13, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10420, 70, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10420, 73, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10421, 19, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10421, 26, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10421, 53, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10421, 77, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10422, 26, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10423, 31, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10423, 59, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10424, 35, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10424, 38, 49, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10424, 68, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10425, 55, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10425, 76, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10426, 56, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10426, 64, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10427, 14, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10428, 46, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10429, 50, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10429, 63, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10430, 17, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10430, 21, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10430, 56, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10430, 59, 70, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10431, 17, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10431, 40, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10431, 47, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10432, 26, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10432, 54, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10433, 56, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10434, 11, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10434, 76, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10435, 2, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10435, 22, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10435, 72, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10436, 46, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10436, 56, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10436, 64, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10436, 75, 24, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10437, 53, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10438, 19, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10438, 34, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10438, 57, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10439, 12, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10439, 16, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10439, 64, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10439, 74, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10440, 2, 45, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10440, 16, 49, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10440, 29, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10440, 61, 90, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10441, 27, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10442, 11, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10442, 54, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10442, 66, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10443, 11, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10443, 28, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10444, 17, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10444, 26, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10444, 35, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10444, 41, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10445, 39, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10445, 54, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10446, 19, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10446, 24, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10446, 31, 3, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10446, 52, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10447, 19, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10447, 65, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10447, 71, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10448, 26, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10448, 40, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10449, 10, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10449, 52, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10449, 62, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10450, 10, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10450, 54, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10451, 55, 120, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10451, 64, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10451, 65, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10451, 77, 55, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10452, 28, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10452, 44, 100, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10453, 48, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10453, 70, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10454, 16, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10454, 33, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10454, 46, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10455, 39, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10455, 53, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10455, 61, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10455, 71, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10456, 21, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10456, 49, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10457, 59, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10458, 26, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10458, 28, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10458, 43, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10458, 56, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10458, 71, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10459, 7, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10459, 46, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10459, 72, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10460, 68, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10460, 75, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10461, 21, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10461, 30, 28, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10461, 55, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10462, 13, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10462, 23, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10463, 19, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10463, 42, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10464, 4, 16, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10464, 43, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10464, 56, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10464, 60, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10465, 24, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10465, 29, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10465, 40, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10465, 45, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10465, 50, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10466, 11, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10466, 46, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10467, 24, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10467, 25, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10468, 30, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10468, 43, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10469, 2, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10469, 16, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10469, 44, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10470, 18, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10470, 23, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10470, 64, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10471, 7, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10471, 56, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10472, 24, 80, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10472, 51, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10473, 33, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10473, 71, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10474, 14, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10474, 28, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10474, 40, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10474, 75, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10475, 31, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10475, 66, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10475, 76, 42, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10476, 55, 2, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10476, 70, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10477, 1, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10477, 21, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10477, 39, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10478, 10, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10479, 38, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10479, 53, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10479, 59, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10479, 64, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10480, 47, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10480, 59, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10481, 49, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10481, 60, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10482, 40, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10483, 34, 35, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10483, 77, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10484, 21, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10484, 40, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10484, 51, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10485, 2, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10485, 3, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10485, 55, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10485, 70, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10486, 11, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10486, 51, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10486, 74, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10487, 19, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10487, 26, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10487, 54, 24, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10488, 59, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10488, 73, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10489, 11, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10489, 16, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10490, 59, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10490, 68, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10490, 75, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10491, 44, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10491, 77, 7, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10492, 25, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10492, 42, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10493, 65, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10493, 66, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10493, 69, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10494, 56, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10495, 23, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10495, 41, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10495, 77, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10496, 31, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10497, 56, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10497, 72, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10497, 77, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10498, 24, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10498, 40, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10498, 42, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10499, 28, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10499, 49, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10500, 15, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10500, 28, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10501, 54, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10502, 45, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10502, 53, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10502, 67, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10503, 14, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10503, 65, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10504, 2, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10504, 21, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10504, 53, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10504, 61, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10505, 62, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10506, 25, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10506, 70, 14, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10507, 43, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10507, 48, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10508, 13, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10508, 39, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10509, 28, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10510, 29, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10510, 75, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10511, 4, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10511, 7, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10511, 8, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10512, 24, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10512, 46, 9, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10512, 47, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10512, 60, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10513, 21, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10513, 32, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10513, 61, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10514, 20, 39, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10514, 28, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10514, 56, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10514, 65, 39, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10514, 75, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10515, 9, 16, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10515, 16, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10515, 27, 120, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10515, 33, 16, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10515, 60, 84, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10516, 18, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10516, 41, 80, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10516, 42, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10517, 52, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10517, 59, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10517, 70, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10518, 24, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10518, 38, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10518, 44, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10519, 10, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10519, 56, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10519, 60, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10520, 24, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10520, 53, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10521, 35, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10521, 41, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10521, 68, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10522, 1, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10522, 8, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10522, 30, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10522, 40, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10523, 17, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10523, 20, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10523, 37, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10523, 41, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10524, 10, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10524, 30, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10524, 43, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10524, 54, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10525, 36, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10525, 40, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10526, 1, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10526, 13, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10526, 56, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10527, 4, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10527, 36, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10528, 11, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10528, 33, 8, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10528, 72, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10529, 55, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10529, 68, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10529, 69, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10530, 17, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10530, 43, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10530, 61, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10530, 76, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10531, 59, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10532, 30, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10532, 66, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10533, 4, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10533, 72, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10533, 73, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10534, 30, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10534, 40, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10534, 54, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10535, 11, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10535, 40, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10535, 57, 5, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10535, 59, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10536, 12, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10536, 31, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10536, 33, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10536, 60, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10537, 31, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10537, 51, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10537, 58, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10537, 72, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10537, 73, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10538, 70, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10538, 72, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10539, 13, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10539, 21, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10539, 33, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10539, 49, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10540, 3, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10540, 26, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10540, 38, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10540, 68, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10541, 24, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10541, 38, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10541, 65, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10541, 71, 9, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10542, 11, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10542, 54, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10543, 12, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10543, 23, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10544, 28, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10544, 67, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10545, 11, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10546, 7, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10546, 35, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10546, 62, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10547, 32, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10547, 36, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10548, 34, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10548, 41, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10549, 31, 55, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10549, 45, 100, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10549, 51, 48, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10550, 17, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10550, 19, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10550, 21, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10550, 61, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10551, 16, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10551, 35, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10551, 44, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10552, 69, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10552, 75, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10553, 11, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10553, 16, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10553, 22, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10553, 31, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10553, 35, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10554, 16, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10554, 23, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10554, 62, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10554, 77, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10555, 14, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10555, 19, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10555, 24, 18, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10555, 51, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10555, 56, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10556, 72, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10557, 64, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10557, 75, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10558, 47, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10558, 51, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10558, 52, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10558, 53, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10558, 73, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10559, 41, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10559, 55, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10560, 30, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10560, 62, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10561, 44, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10561, 51, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10562, 33, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10562, 62, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10563, 36, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10563, 52, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10564, 17, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10564, 31, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10564, 55, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10565, 24, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10565, 64, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10566, 11, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10566, 18, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10566, 76, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10567, 31, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10567, 51, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10567, 59, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10568, 10, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10569, 31, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10569, 76, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10570, 11, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10570, 56, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10571, 14, 11, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10571, 42, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10572, 16, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10572, 32, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10572, 40, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10572, 75, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10573, 17, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10573, 34, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10573, 53, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10574, 33, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10574, 40, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10574, 62, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10574, 64, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10575, 59, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10575, 63, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10575, 72, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10575, 76, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10576, 1, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10576, 31, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10576, 44, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10577, 39, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10577, 75, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10577, 77, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10578, 35, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10578, 57, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10579, 15, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10579, 75, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10580, 14, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10580, 41, 9, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10580, 65, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10581, 75, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10582, 57, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10582, 76, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10583, 29, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10583, 60, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10583, 69, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10584, 31, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10585, 47, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10586, 52, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10587, 26, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10587, 35, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10587, 77, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10588, 18, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10588, 42, 100, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10589, 35, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10590, 1, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10590, 77, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10591, 3, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10591, 7, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10591, 54, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10592, 15, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10592, 26, 5, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10593, 20, 21, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10593, 69, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10593, 76, 4, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10594, 52, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10594, 58, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10595, 35, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10595, 61, 120, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10595, 69, 65, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10596, 56, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10596, 63, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10596, 75, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10597, 24, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10597, 57, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10597, 65, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10598, 27, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10598, 71, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10599, 62, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10600, 54, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10600, 73, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10601, 13, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10601, 59, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10602, 77, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10603, 22, 48, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10603, 49, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10604, 48, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10604, 76, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10605, 16, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10605, 59, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10605, 60, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10605, 71, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10606, 4, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10606, 55, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10606, 62, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10607, 7, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10607, 17, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10607, 33, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10607, 40, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10607, 72, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10608, 56, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10609, 1, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10609, 10, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10609, 21, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10610, 36, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10611, 1, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10611, 2, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10611, 60, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10612, 10, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10612, 36, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10612, 49, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10612, 60, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10612, 76, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10613, 13, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10613, 75, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10614, 11, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10614, 21, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10614, 39, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10615, 55, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10616, 38, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10616, 56, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10616, 70, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10616, 71, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10617, 59, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10618, 6, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10618, 56, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10618, 68, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10619, 21, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10619, 22, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10620, 24, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10620, 52, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10621, 19, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10621, 23, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10621, 70, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10621, 71, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10622, 2, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10622, 68, 18, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10623, 14, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10623, 19, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10623, 21, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10623, 24, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10623, 35, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10624, 28, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10624, 29, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10624, 44, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10625, 14, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10625, 42, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10625, 60, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10626, 53, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10626, 60, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10626, 71, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10627, 62, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10627, 73, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10628, 1, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10629, 29, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10629, 64, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10630, 55, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10630, 76, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10631, 75, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10632, 2, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10632, 33, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10633, 12, 36, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10633, 13, 13, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10633, 26, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10633, 62, 80, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10634, 7, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10634, 18, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10634, 51, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10634, 75, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10635, 4, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10635, 5, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10635, 22, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10636, 4, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10636, 58, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10637, 11, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10637, 50, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10637, 56, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10638, 45, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10638, 65, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10638, 72, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10639, 18, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10640, 69, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10640, 70, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10641, 2, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10641, 40, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10642, 21, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10642, 61, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10643, 28, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10643, 39, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10643, 46, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10644, 18, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10644, 43, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10644, 46, 21, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10645, 18, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10645, 36, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10646, 1, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10646, 10, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10646, 71, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10646, 77, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10647, 19, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10647, 39, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10648, 22, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10648, 24, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10649, 28, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10649, 72, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10650, 30, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10650, 53, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10650, 54, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10651, 19, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10651, 22, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10652, 30, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10652, 42, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10653, 16, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10653, 60, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10654, 4, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10654, 39, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10654, 54, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10655, 41, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10656, 14, 3, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10656, 44, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10656, 47, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10657, 15, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10657, 41, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10657, 46, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10657, 47, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10657, 56, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10657, 60, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10658, 21, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10658, 40, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10658, 60, 55, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10658, 77, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10659, 31, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10659, 40, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10659, 70, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10660, 20, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10661, 39, 3, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10661, 58, 49, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10662, 68, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10663, 40, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10663, 42, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10663, 51, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10664, 10, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10664, 56, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10664, 65, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10665, 51, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10665, 59, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10665, 76, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10666, 29, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10666, 65, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10667, 69, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10667, 71, 14, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10668, 31, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10668, 55, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10668, 64, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10669, 36, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10670, 23, 32, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10670, 46, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10670, 67, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10670, 73, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10670, 75, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10671, 16, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10671, 62, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10671, 65, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10672, 38, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10672, 71, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10673, 16, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10673, 42, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10673, 43, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10674, 23, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10675, 14, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10675, 53, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10675, 58, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10676, 10, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10676, 19, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10676, 44, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10677, 26, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10677, 33, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10678, 12, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10678, 33, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10678, 41, 120, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10678, 54, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10679, 59, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10680, 16, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10680, 31, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10680, 42, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10681, 19, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10681, 21, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10681, 64, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10682, 33, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10682, 66, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10682, 75, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10683, 52, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10684, 40, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10684, 47, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10684, 60, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10685, 10, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10685, 41, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10685, 47, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10686, 17, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10686, 26, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10687, 9, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10687, 29, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10687, 36, 6, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10688, 10, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10688, 28, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10688, 34, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10689, 1, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10690, 56, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10690, 77, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10691, 1, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10691, 29, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10691, 43, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10691, 44, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10691, 62, 48, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10692, 63, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10693, 9, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10693, 54, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10693, 69, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10693, 73, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10694, 7, 90, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10694, 59, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10694, 70, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10695, 8, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10695, 12, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10695, 24, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10696, 17, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10696, 46, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10697, 19, 7, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10697, 35, 9, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10697, 58, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10697, 70, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10698, 11, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10698, 17, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10698, 29, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10698, 65, 65, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10698, 70, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10699, 47, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10700, 1, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10700, 34, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10700, 68, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10700, 71, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10701, 59, 42, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10701, 71, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10701, 76, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10702, 3, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10702, 76, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10703, 2, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10703, 59, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10703, 73, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10704, 4, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10704, 24, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10704, 48, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10705, 31, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10705, 32, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10706, 16, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10706, 43, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10706, 59, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10707, 55, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10707, 57, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10707, 70, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10708, 5, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10708, 36, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10709, 8, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10709, 51, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10709, 60, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10710, 19, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10710, 47, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10711, 19, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10711, 41, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10711, 53, 120, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10712, 53, 3, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10712, 56, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10713, 10, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10713, 26, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10713, 45, 110, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10713, 46, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10714, 2, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10714, 17, 27, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10714, 47, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10714, 56, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10714, 58, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10715, 10, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10715, 71, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10716, 21, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10716, 51, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10716, 61, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10717, 21, 32, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10717, 54, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10717, 69, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10718, 12, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10718, 16, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10718, 36, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10718, 62, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10719, 18, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10719, 30, 3, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10719, 54, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10720, 35, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10720, 71, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10721, 44, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10722, 2, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10722, 31, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10722, 68, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10722, 75, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10723, 26, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10724, 10, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10724, 61, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10725, 41, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10725, 52, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10725, 55, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10726, 4, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10726, 11, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10727, 17, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10727, 56, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10727, 59, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10728, 30, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10728, 40, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10728, 55, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10728, 60, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10729, 1, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10729, 21, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10729, 50, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10730, 16, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10730, 31, 3, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10730, 65, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10731, 21, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10731, 51, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10732, 76, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10733, 14, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10733, 28, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10733, 52, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10734, 6, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10734, 30, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10734, 76, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10735, 61, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10735, 77, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10736, 65, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10736, 75, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10737, 13, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10737, 41, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10738, 16, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10739, 36, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10739, 52, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10740, 28, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10740, 35, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10740, 45, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10740, 56, 14, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10741, 2, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10742, 3, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10742, 60, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10742, 72, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10743, 46, 28, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10744, 40, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10745, 18, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10745, 44, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10745, 59, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10745, 72, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10746, 13, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10746, 42, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10746, 62, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10746, 69, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10747, 31, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10747, 41, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10747, 63, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10747, 69, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10748, 23, 44, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10748, 40, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10748, 56, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10749, 56, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10749, 59, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10749, 76, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10750, 14, 5, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10750, 45, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10750, 59, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10751, 26, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10751, 30, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10751, 50, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10751, 73, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10752, 1, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10752, 69, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10753, 45, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10753, 74, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10754, 40, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10755, 47, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10755, 56, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10755, 57, 14, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10755, 69, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10756, 18, 21, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10756, 36, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10756, 68, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10756, 69, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10757, 34, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10757, 59, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10757, 62, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10757, 64, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10758, 26, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10758, 52, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10758, 70, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10759, 32, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10760, 25, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10760, 27, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10760, 43, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10761, 25, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10761, 75, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10762, 39, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10762, 47, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10762, 51, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10762, 56, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10763, 21, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10763, 22, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10763, 24, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10764, 3, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10764, 39, 130, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10765, 65, 80, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10766, 2, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10766, 7, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10766, 68, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10767, 42, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10768, 22, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10768, 31, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10768, 60, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10768, 71, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10769, 41, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10769, 52, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10769, 61, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10769, 62, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10770, 11, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10771, 71, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10772, 29, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10772, 59, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10773, 17, 33, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10773, 31, 70, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10773, 75, 7, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10774, 31, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10774, 66, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10775, 10, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10775, 67, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10776, 31, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10776, 42, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10776, 45, 27, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10776, 51, 120, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10777, 42, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10778, 41, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10779, 16, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10779, 62, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10780, 70, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10780, 77, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10781, 54, 3, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10781, 56, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10781, 74, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10782, 31, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10783, 31, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10783, 38, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10784, 36, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10784, 39, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10784, 72, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10785, 10, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10785, 75, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10786, 8, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10786, 30, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10786, 75, 42, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10787, 2, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10787, 29, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10788, 19, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10788, 75, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10789, 18, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10789, 35, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10789, 63, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10789, 68, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10790, 7, 3, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10790, 56, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10791, 29, 14, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10791, 41, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10792, 2, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10792, 54, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10792, 68, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10793, 41, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10793, 52, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10794, 14, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10794, 54, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10795, 16, 65, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10795, 17, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10796, 26, 21, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10796, 44, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10796, 64, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10796, 69, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10797, 11, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10798, 62, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10798, 72, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10799, 13, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10799, 24, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10799, 59, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10800, 11, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10800, 51, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10800, 54, 7, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10801, 17, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10801, 29, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10802, 30, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10802, 51, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10802, 55, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10802, 62, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10803, 19, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10803, 25, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10803, 59, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10804, 10, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10804, 28, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10804, 49, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10805, 34, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10805, 38, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10806, 2, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10806, 65, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10806, 74, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10807, 40, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10808, 56, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10808, 76, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10809, 52, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10810, 13, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10810, 25, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10810, 70, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10811, 19, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10811, 23, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10811, 40, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10812, 31, 16, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10812, 72, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10812, 77, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10813, 2, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10813, 46, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10814, 41, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10814, 43, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10814, 48, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10814, 61, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10815, 33, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10816, 38, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10816, 62, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10817, 26, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10817, 38, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10817, 40, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10817, 62, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10818, 32, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10818, 41, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10819, 43, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10819, 75, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10820, 56, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10821, 35, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10821, 51, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10822, 62, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10822, 70, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10823, 11, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10823, 57, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10823, 59, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10823, 77, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10824, 41, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10824, 70, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10825, 26, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10825, 53, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10826, 31, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10826, 57, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10827, 10, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10827, 39, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10828, 20, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10828, 38, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10829, 2, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10829, 8, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10829, 13, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10829, 60, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10830, 6, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10830, 39, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10830, 60, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10830, 68, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10831, 19, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10831, 35, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10831, 38, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10831, 43, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10832, 13, 3, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10832, 25, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10832, 44, 16, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10832, 64, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10833, 7, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10833, 31, 9, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10833, 53, 9, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10834, 29, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10834, 30, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10835, 59, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10835, 77, 2, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10836, 22, 52, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10836, 35, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10836, 57, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10836, 60, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10836, 64, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10837, 13, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10837, 40, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10837, 47, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10837, 76, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10838, 1, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10838, 18, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10838, 36, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10839, 58, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10839, 72, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10840, 25, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10840, 39, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10841, 10, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10841, 56, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10841, 59, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10841, 77, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10842, 11, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10842, 43, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10842, 68, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10842, 70, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10843, 51, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10844, 22, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10845, 23, 70, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10845, 35, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10845, 42, 42, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10845, 58, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10845, 64, 48, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10846, 4, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10846, 70, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10846, 74, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10847, 1, 80, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10847, 19, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10847, 37, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10847, 45, 36, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10847, 60, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10847, 71, 55, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10848, 5, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10848, 9, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10849, 3, 49, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10849, 26, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10850, 25, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10850, 33, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10850, 70, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10851, 2, 5, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10851, 25, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10851, 57, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10851, 59, 42, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10852, 2, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10852, 17, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10852, 62, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10853, 18, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10854, 10, 100, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10854, 13, 65, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10855, 16, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10855, 31, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10855, 56, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10855, 65, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10856, 2, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10856, 42, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10857, 3, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10857, 26, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10857, 29, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10858, 7, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10858, 27, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10858, 70, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10859, 24, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10859, 54, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10859, 64, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10860, 51, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10860, 76, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10861, 17, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10861, 18, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10861, 21, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10861, 33, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10861, 62, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10862, 11, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10862, 52, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10863, 1, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10863, 58, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10864, 35, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10864, 67, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10865, 38, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10865, 39, 80, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10866, 2, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10866, 24, 6, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10866, 30, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10867, 53, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10868, 26, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10868, 35, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10868, 49, 42, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10869, 1, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10869, 11, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10869, 23, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10869, 68, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10870, 35, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10870, 51, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10871, 6, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10871, 16, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10871, 17, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10872, 55, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10872, 62, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10872, 64, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10872, 65, 21, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10873, 21, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10873, 28, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10874, 10, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10875, 19, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10875, 47, 21, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10875, 49, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10876, 46, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10876, 64, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10877, 16, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10877, 18, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10878, 20, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10879, 40, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10879, 65, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10879, 76, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10880, 23, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10880, 61, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10880, 70, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10881, 73, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10882, 42, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10882, 49, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10882, 54, 32, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10883, 24, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10884, 21, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10884, 56, 21, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10884, 65, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10885, 2, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10885, 24, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10885, 70, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10885, 77, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10886, 10, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10886, 31, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10886, 77, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10887, 25, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10888, 2, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10888, 68, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10889, 11, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10889, 38, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10890, 17, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10890, 34, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10890, 41, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10891, 30, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10892, 59, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10893, 8, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10893, 24, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10893, 29, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10893, 30, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10893, 36, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10894, 13, 28, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10894, 69, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10894, 75, 120, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10895, 24, 110, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10895, 39, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10895, 40, 91, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10895, 60, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10896, 45, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10896, 56, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10897, 29, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10897, 30, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10898, 13, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10899, 39, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10900, 70, 3, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10901, 41, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10901, 71, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10902, 55, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10902, 62, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10903, 13, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10903, 65, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10903, 68, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10904, 58, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10904, 62, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10905, 1, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10906, 61, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10907, 75, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10908, 7, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10908, 52, 14, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10909, 7, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10909, 16, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10909, 41, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10910, 19, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10910, 49, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10910, 61, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10911, 1, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10911, 17, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10911, 67, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10912, 11, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10912, 29, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10913, 4, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10913, 33, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10913, 58, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10914, 71, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10915, 17, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10915, 33, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10915, 54, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10916, 16, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10916, 32, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10916, 57, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10917, 30, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10917, 60, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10918, 1, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10918, 60, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10919, 16, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10919, 25, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10919, 40, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10920, 50, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10921, 35, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10921, 63, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10922, 17, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10922, 24, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10923, 42, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10923, 43, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10923, 67, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10924, 10, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10924, 28, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10924, 75, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10925, 36, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10925, 52, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10926, 11, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10926, 13, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10926, 19, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10926, 72, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10927, 20, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10927, 52, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10927, 76, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10928, 47, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10928, 76, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10929, 21, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10929, 75, 49, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10929, 77, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10930, 21, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10930, 27, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10930, 55, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10930, 58, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10931, 13, 42, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10931, 57, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10932, 16, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10932, 62, 14, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10932, 72, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10932, 75, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10933, 53, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10933, 61, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10934, 6, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10935, 1, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10935, 18, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10935, 23, 8, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10936, 36, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10937, 28, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10937, 34, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10938, 13, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10938, 43, 24, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10938, 60, 49, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10938, 71, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10939, 2, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10939, 67, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10940, 7, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10940, 13, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10941, 31, 44, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10941, 62, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10941, 68, 80, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10941, 72, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10942, 49, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10943, 13, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10943, 22, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10943, 46, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10944, 11, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10944, 44, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10944, 56, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10945, 13, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10945, 31, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10946, 10, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10946, 24, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10946, 77, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10947, 59, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10948, 50, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10948, 51, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10948, 55, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10949, 6, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10949, 10, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10949, 17, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10949, 62, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10950, 4, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10951, 33, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10951, 41, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10951, 75, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10952, 6, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10952, 28, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10953, 20, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10953, 31, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10954, 16, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10954, 31, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10954, 45, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10954, 60, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10955, 75, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10956, 21, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10956, 47, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10956, 51, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10957, 30, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10957, 35, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10957, 64, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10958, 5, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10958, 7, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10958, 72, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10959, 75, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10960, 24, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10960, 41, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10961, 52, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10961, 76, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10962, 7, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10962, 13, 77, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10962, 53, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10962, 69, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10962, 76, 44, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10963, 60, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10964, 18, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10964, 38, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10964, 69, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10965, 51, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10966, 37, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10966, 56, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10966, 62, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10967, 19, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10967, 49, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10968, 12, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10968, 24, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10968, 64, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10969, 46, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10970, 52, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10971, 29, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10972, 17, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10972, 33, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10973, 26, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10973, 41, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10973, 75, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10974, 63, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10975, 8, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10975, 75, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10976, 28, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10977, 39, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10977, 47, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10977, 51, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10977, 63, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10978, 8, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10978, 21, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10978, 40, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10978, 44, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10979, 7, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10979, 12, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10979, 24, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10979, 27, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10979, 31, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10979, 63, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10980, 75, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10981, 38, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10982, 7, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10982, 43, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10983, 13, 84, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10983, 57, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10984, 16, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10984, 24, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10984, 36, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10985, 16, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10985, 18, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10985, 32, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10986, 11, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10986, 20, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10986, 76, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10986, 77, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10987, 7, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10987, 43, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10987, 72, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10988, 7, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10988, 62, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10989, 6, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10989, 11, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10989, 41, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10990, 21, 65, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10990, 34, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10990, 55, 65, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10990, 61, 66, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10991, 2, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10991, 70, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10991, 76, 90, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10992, 72, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10993, 29, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10993, 41, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10994, 59, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10995, 51, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10995, 60, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10996, 42, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10997, 32, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10997, 46, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10997, 52, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10998, 24, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10998, 61, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10998, 74, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10998, 75, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10999, 41, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10999, 51, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10999, 77, 21, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11000, 4, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11000, 24, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11000, 77, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11001, 7, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11001, 22, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11001, 46, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11001, 55, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11002, 13, 56, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11002, 35, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11002, 42, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11002, 55, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11003, 1, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11003, 40, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11003, 52, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11004, 26, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11004, 76, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11005, 1, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11005, 59, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11006, 1, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11006, 29, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11007, 8, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11007, 29, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11007, 42, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11008, 28, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11008, 34, 90, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11008, 71, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11009, 24, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11009, 36, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11009, 60, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11010, 7, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11010, 24, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11011, 58, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11011, 71, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11012, 19, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11012, 60, 36, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11012, 71, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11013, 23, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11013, 42, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11013, 45, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11013, 68, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11014, 41, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11015, 30, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11015, 77, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11016, 31, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11016, 36, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11017, 3, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11017, 59, 110, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11017, 70, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11018, 12, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11018, 18, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11018, 56, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11019, 46, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11019, 49, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11020, 10, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11021, 2, 11, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11021, 20, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11021, 26, 63, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11021, 51, 44, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11021, 72, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11022, 19, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11022, 69, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11023, 7, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11023, 43, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11024, 26, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11024, 33, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11024, 65, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11024, 71, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11025, 1, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11025, 13, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11026, 18, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11026, 51, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11027, 24, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11027, 62, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11028, 55, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11028, 59, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11029, 56, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11029, 63, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11030, 2, 100, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11030, 5, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11030, 29, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11030, 59, 100, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11031, 1, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11031, 13, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11031, 24, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11031, 64, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11031, 71, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11032, 36, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11032, 38, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11032, 59, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11033, 53, 70, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11033, 69, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11034, 21, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11034, 44, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11034, 61, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11035, 1, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11035, 35, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11035, 42, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11035, 54, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11036, 13, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11036, 59, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11037, 70, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11038, 40, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11038, 52, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11038, 71, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11039, 28, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11039, 35, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11039, 49, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11039, 57, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11040, 21, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11041, 2, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11041, 63, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11042, 44, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11042, 61, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11043, 11, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11044, 62, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11045, 33, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11045, 51, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11046, 12, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11046, 32, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11046, 35, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11047, 1, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11047, 5, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11048, 68, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11049, 2, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11049, 12, 4, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11050, 76, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11051, 24, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11052, 43, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11052, 61, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11053, 18, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11053, 32, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11053, 64, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11054, 33, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11054, 67, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11055, 24, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11055, 25, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11055, 51, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11055, 57, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11056, 7, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11056, 55, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11056, 60, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11057, 70, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11058, 21, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11058, 60, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11058, 61, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11059, 13, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11059, 17, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11059, 60, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11060, 60, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11060, 77, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11061, 60, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11062, 53, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11062, 70, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11063, 34, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11063, 40, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11063, 41, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11064, 17, 77, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11064, 41, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11064, 53, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11064, 55, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11064, 68, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11065, 30, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11065, 54, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11066, 16, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11066, 19, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11066, 34, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11067, 41, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11068, 28, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11068, 43, 36, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11068, 77, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11069, 39, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11070, 1, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11070, 2, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11070, 16, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11070, 31, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11071, 7, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11071, 13, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11072, 2, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11072, 41, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11072, 50, 22, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11072, 64, 130, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11073, 11, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11073, 24, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11074, 16, 14, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11075, 2, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11075, 46, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11075, 76, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11076, 6, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11076, 14, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11076, 19, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 2, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 3, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 4, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 6, 1, 0.02)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 7, 1, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 8, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 10, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 12, 2, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 13, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 14, 1, 0.03)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 16, 2, 0.03)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 20, 1, 0.04)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 23, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 32, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 39, 2, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 41, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 46, 3, 0.02)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 52, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 55, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 60, 2, 0.06)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 64, 2, 0.03)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 66, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 73, 2, 0.01)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 75, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11077, 77, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10248, N'VINET', CAST(N'1996-07-04T00:00:00.000' AS DateTime), CAST(N'1996-08-01T00:00:00.000' AS DateTime), CAST(N'1996-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10249, N'TOMSP', CAST(N'1996-07-05T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime), CAST(N'1996-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10250, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), CAST(N'1996-08-05T00:00:00.000' AS DateTime), CAST(N'1996-07-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10251, N'VICTE', CAST(N'1996-07-08T00:00:00.000' AS DateTime), CAST(N'1996-08-05T00:00:00.000' AS DateTime), CAST(N'1996-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10252, N'SUPRD', CAST(N'1996-07-09T00:00:00.000' AS DateTime), CAST(N'1996-08-06T00:00:00.000' AS DateTime), CAST(N'1996-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10253, N'HANAR', CAST(N'1996-07-10T00:00:00.000' AS DateTime), CAST(N'1996-07-24T00:00:00.000' AS DateTime), CAST(N'1996-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10254, N'CHOPS', CAST(N'1996-07-11T00:00:00.000' AS DateTime), CAST(N'1996-08-08T00:00:00.000' AS DateTime), CAST(N'1996-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10255, N'RICSU', CAST(N'1996-07-12T00:00:00.000' AS DateTime), CAST(N'1996-08-09T00:00:00.000' AS DateTime), CAST(N'1996-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10256, N'WELLI', CAST(N'1996-07-15T00:00:00.000' AS DateTime), CAST(N'1996-08-12T00:00:00.000' AS DateTime), CAST(N'1996-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10257, N'HILAA', CAST(N'1996-07-16T00:00:00.000' AS DateTime), CAST(N'1996-08-13T00:00:00.000' AS DateTime), CAST(N'1996-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10258, N'ERNSH', CAST(N'1996-07-17T00:00:00.000' AS DateTime), CAST(N'1996-08-14T00:00:00.000' AS DateTime), CAST(N'1996-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10259, N'CENTC', CAST(N'1996-07-18T00:00:00.000' AS DateTime), CAST(N'1996-08-15T00:00:00.000' AS DateTime), CAST(N'1996-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10260, N'OTTIK', CAST(N'1996-07-19T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime), CAST(N'1996-07-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10261, N'QUEDE', CAST(N'1996-07-19T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime), CAST(N'1996-07-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10262, N'RATTC', CAST(N'1996-07-22T00:00:00.000' AS DateTime), CAST(N'1996-08-19T00:00:00.000' AS DateTime), CAST(N'1996-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10263, N'ERNSH', CAST(N'1996-07-23T00:00:00.000' AS DateTime), CAST(N'1996-08-20T00:00:00.000' AS DateTime), CAST(N'1996-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10264, N'FOLKO', CAST(N'1996-07-24T00:00:00.000' AS DateTime), CAST(N'1996-08-21T00:00:00.000' AS DateTime), CAST(N'1996-08-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10265, N'BLONP', CAST(N'1996-07-25T00:00:00.000' AS DateTime), CAST(N'1996-08-22T00:00:00.000' AS DateTime), CAST(N'1996-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10266, N'WARTH', CAST(N'1996-07-26T00:00:00.000' AS DateTime), CAST(N'1996-09-06T00:00:00.000' AS DateTime), CAST(N'1996-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10267, N'FRANK', CAST(N'1996-07-29T00:00:00.000' AS DateTime), CAST(N'1996-08-26T00:00:00.000' AS DateTime), CAST(N'1996-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10268, N'GROSR', CAST(N'1996-07-30T00:00:00.000' AS DateTime), CAST(N'1996-08-27T00:00:00.000' AS DateTime), CAST(N'1996-08-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10269, N'WHITC', CAST(N'1996-07-31T00:00:00.000' AS DateTime), CAST(N'1996-08-14T00:00:00.000' AS DateTime), CAST(N'1996-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10270, N'WARTH', CAST(N'1996-08-01T00:00:00.000' AS DateTime), CAST(N'1996-08-29T00:00:00.000' AS DateTime), CAST(N'1996-08-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10271, N'SPLIR', CAST(N'1996-08-01T00:00:00.000' AS DateTime), CAST(N'1996-08-29T00:00:00.000' AS DateTime), CAST(N'1996-08-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10272, N'RATTC', CAST(N'1996-08-02T00:00:00.000' AS DateTime), CAST(N'1996-08-30T00:00:00.000' AS DateTime), CAST(N'1996-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10273, N'QUICK', CAST(N'1996-08-05T00:00:00.000' AS DateTime), CAST(N'1996-09-02T00:00:00.000' AS DateTime), CAST(N'1996-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10274, N'VINET', CAST(N'1996-08-06T00:00:00.000' AS DateTime), CAST(N'1996-09-03T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10275, N'MAGAA', CAST(N'1996-08-07T00:00:00.000' AS DateTime), CAST(N'1996-09-04T00:00:00.000' AS DateTime), CAST(N'1996-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10276, N'TORTU', CAST(N'1996-08-08T00:00:00.000' AS DateTime), CAST(N'1996-08-22T00:00:00.000' AS DateTime), CAST(N'1996-08-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10277, N'MORGK', CAST(N'1996-08-09T00:00:00.000' AS DateTime), CAST(N'1996-09-06T00:00:00.000' AS DateTime), CAST(N'1996-08-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10278, N'BERGS', CAST(N'1996-08-12T00:00:00.000' AS DateTime), CAST(N'1996-09-09T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10279, N'LEHMS', CAST(N'1996-08-13T00:00:00.000' AS DateTime), CAST(N'1996-09-10T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10280, N'BERGS', CAST(N'1996-08-14T00:00:00.000' AS DateTime), CAST(N'1996-09-11T00:00:00.000' AS DateTime), CAST(N'1996-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10281, N'ROMEY', CAST(N'1996-08-14T00:00:00.000' AS DateTime), CAST(N'1996-08-28T00:00:00.000' AS DateTime), CAST(N'1996-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10282, N'ROMEY', CAST(N'1996-08-15T00:00:00.000' AS DateTime), CAST(N'1996-09-12T00:00:00.000' AS DateTime), CAST(N'1996-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10283, N'LILAS', CAST(N'1996-08-16T00:00:00.000' AS DateTime), CAST(N'1996-09-13T00:00:00.000' AS DateTime), CAST(N'1996-08-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10284, N'LEHMS', CAST(N'1996-08-19T00:00:00.000' AS DateTime), CAST(N'1996-09-16T00:00:00.000' AS DateTime), CAST(N'1996-08-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10285, N'QUICK', CAST(N'1996-08-20T00:00:00.000' AS DateTime), CAST(N'1996-09-17T00:00:00.000' AS DateTime), CAST(N'1996-08-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10286, N'QUICK', CAST(N'1996-08-21T00:00:00.000' AS DateTime), CAST(N'1996-09-18T00:00:00.000' AS DateTime), CAST(N'1996-08-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10287, N'RICAR', CAST(N'1996-08-22T00:00:00.000' AS DateTime), CAST(N'1996-09-19T00:00:00.000' AS DateTime), CAST(N'1996-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10288, N'REGGC', CAST(N'1996-08-23T00:00:00.000' AS DateTime), CAST(N'1996-09-20T00:00:00.000' AS DateTime), CAST(N'1996-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10289, N'BSBEV', CAST(N'1996-08-26T00:00:00.000' AS DateTime), CAST(N'1996-09-23T00:00:00.000' AS DateTime), CAST(N'1996-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10290, N'COMMI', CAST(N'1996-08-27T00:00:00.000' AS DateTime), CAST(N'1996-09-24T00:00:00.000' AS DateTime), CAST(N'1996-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10291, N'QUEDE', CAST(N'1996-08-27T00:00:00.000' AS DateTime), CAST(N'1996-09-24T00:00:00.000' AS DateTime), CAST(N'1996-09-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10292, N'TRADH', CAST(N'1996-08-28T00:00:00.000' AS DateTime), CAST(N'1996-09-25T00:00:00.000' AS DateTime), CAST(N'1996-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10293, N'TORTU', CAST(N'1996-08-29T00:00:00.000' AS DateTime), CAST(N'1996-09-26T00:00:00.000' AS DateTime), CAST(N'1996-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10294, N'RATTC', CAST(N'1996-08-30T00:00:00.000' AS DateTime), CAST(N'1996-09-27T00:00:00.000' AS DateTime), CAST(N'1996-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10295, N'VINET', CAST(N'1996-09-02T00:00:00.000' AS DateTime), CAST(N'1996-09-30T00:00:00.000' AS DateTime), CAST(N'1996-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10296, N'LILAS', CAST(N'1996-09-03T00:00:00.000' AS DateTime), CAST(N'1996-10-01T00:00:00.000' AS DateTime), CAST(N'1996-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10297, N'BLONP', CAST(N'1996-09-04T00:00:00.000' AS DateTime), CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10298, N'HUNGO', CAST(N'1996-09-05T00:00:00.000' AS DateTime), CAST(N'1996-10-03T00:00:00.000' AS DateTime), CAST(N'1996-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10299, N'RICAR', CAST(N'1996-09-06T00:00:00.000' AS DateTime), CAST(N'1996-10-04T00:00:00.000' AS DateTime), CAST(N'1996-09-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10300, N'MAGAA', CAST(N'1996-09-09T00:00:00.000' AS DateTime), CAST(N'1996-10-07T00:00:00.000' AS DateTime), CAST(N'1996-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10301, N'WANDK', CAST(N'1996-09-09T00:00:00.000' AS DateTime), CAST(N'1996-10-07T00:00:00.000' AS DateTime), CAST(N'1996-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10302, N'SUPRD', CAST(N'1996-09-10T00:00:00.000' AS DateTime), CAST(N'1996-10-08T00:00:00.000' AS DateTime), CAST(N'1996-10-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10303, N'GODOS', CAST(N'1996-09-11T00:00:00.000' AS DateTime), CAST(N'1996-10-09T00:00:00.000' AS DateTime), CAST(N'1996-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10304, N'TORTU', CAST(N'1996-09-12T00:00:00.000' AS DateTime), CAST(N'1996-10-10T00:00:00.000' AS DateTime), CAST(N'1996-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10305, N'OLDWO', CAST(N'1996-09-13T00:00:00.000' AS DateTime), CAST(N'1996-10-11T00:00:00.000' AS DateTime), CAST(N'1996-10-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10306, N'ROMEY', CAST(N'1996-09-16T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime), CAST(N'1996-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10307, N'LONEP', CAST(N'1996-09-17T00:00:00.000' AS DateTime), CAST(N'1996-10-15T00:00:00.000' AS DateTime), CAST(N'1996-09-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10308, N'ANATR', CAST(N'1996-09-18T00:00:00.000' AS DateTime), CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10309, N'HUNGO', CAST(N'1996-09-19T00:00:00.000' AS DateTime), CAST(N'1996-10-17T00:00:00.000' AS DateTime), CAST(N'1996-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10310, N'THEBI', CAST(N'1996-09-20T00:00:00.000' AS DateTime), CAST(N'1996-10-18T00:00:00.000' AS DateTime), CAST(N'1996-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10311, N'DUMON', CAST(N'1996-09-20T00:00:00.000' AS DateTime), CAST(N'1996-10-04T00:00:00.000' AS DateTime), CAST(N'1996-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10312, N'WANDK', CAST(N'1996-09-23T00:00:00.000' AS DateTime), CAST(N'1996-10-21T00:00:00.000' AS DateTime), CAST(N'1996-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10313, N'QUICK', CAST(N'1996-09-24T00:00:00.000' AS DateTime), CAST(N'1996-10-22T00:00:00.000' AS DateTime), CAST(N'1996-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10314, N'RATTC', CAST(N'1996-09-25T00:00:00.000' AS DateTime), CAST(N'1996-10-23T00:00:00.000' AS DateTime), CAST(N'1996-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10315, N'ISLAT', CAST(N'1996-09-26T00:00:00.000' AS DateTime), CAST(N'1996-10-24T00:00:00.000' AS DateTime), CAST(N'1996-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10316, N'RATTC', CAST(N'1996-09-27T00:00:00.000' AS DateTime), CAST(N'1996-10-25T00:00:00.000' AS DateTime), CAST(N'1996-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10317, N'LONEP', CAST(N'1996-09-30T00:00:00.000' AS DateTime), CAST(N'1996-10-28T00:00:00.000' AS DateTime), CAST(N'1996-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10318, N'ISLAT', CAST(N'1996-10-01T00:00:00.000' AS DateTime), CAST(N'1996-10-29T00:00:00.000' AS DateTime), CAST(N'1996-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10319, N'TORTU', CAST(N'1996-10-02T00:00:00.000' AS DateTime), CAST(N'1996-10-30T00:00:00.000' AS DateTime), CAST(N'1996-10-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10320, N'WARTH', CAST(N'1996-10-03T00:00:00.000' AS DateTime), CAST(N'1996-10-17T00:00:00.000' AS DateTime), CAST(N'1996-10-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10321, N'ISLAT', CAST(N'1996-10-03T00:00:00.000' AS DateTime), CAST(N'1996-10-31T00:00:00.000' AS DateTime), CAST(N'1996-10-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10322, N'PERIC', CAST(N'1996-10-04T00:00:00.000' AS DateTime), CAST(N'1996-11-01T00:00:00.000' AS DateTime), CAST(N'1996-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10323, N'KOENE', CAST(N'1996-10-07T00:00:00.000' AS DateTime), CAST(N'1996-11-04T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10324, N'SAVEA', CAST(N'1996-10-08T00:00:00.000' AS DateTime), CAST(N'1996-11-05T00:00:00.000' AS DateTime), CAST(N'1996-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10325, N'KOENE', CAST(N'1996-10-09T00:00:00.000' AS DateTime), CAST(N'1996-10-23T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10326, N'BOLID', CAST(N'1996-10-10T00:00:00.000' AS DateTime), CAST(N'1996-11-07T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10327, N'FOLKO', CAST(N'1996-10-11T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10328, N'FURIB', CAST(N'1996-10-14T00:00:00.000' AS DateTime), CAST(N'1996-11-11T00:00:00.000' AS DateTime), CAST(N'1996-10-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10329, N'SPLIR', CAST(N'1996-10-15T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10330, N'LILAS', CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-11-13T00:00:00.000' AS DateTime), CAST(N'1996-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10331, N'BONAP', CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime), CAST(N'1996-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10332, N'MEREP', CAST(N'1996-10-17T00:00:00.000' AS DateTime), CAST(N'1996-11-28T00:00:00.000' AS DateTime), CAST(N'1996-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10333, N'WARTH', CAST(N'1996-10-18T00:00:00.000' AS DateTime), CAST(N'1996-11-15T00:00:00.000' AS DateTime), CAST(N'1996-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10334, N'VICTE', CAST(N'1996-10-21T00:00:00.000' AS DateTime), CAST(N'1996-11-18T00:00:00.000' AS DateTime), CAST(N'1996-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10335, N'HUNGO', CAST(N'1996-10-22T00:00:00.000' AS DateTime), CAST(N'1996-11-19T00:00:00.000' AS DateTime), CAST(N'1996-10-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10336, N'PRINI', CAST(N'1996-10-23T00:00:00.000' AS DateTime), CAST(N'1996-11-20T00:00:00.000' AS DateTime), CAST(N'1996-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10337, N'FRANK', CAST(N'1996-10-24T00:00:00.000' AS DateTime), CAST(N'1996-11-21T00:00:00.000' AS DateTime), CAST(N'1996-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10338, N'OLDWO', CAST(N'1996-10-25T00:00:00.000' AS DateTime), CAST(N'1996-11-22T00:00:00.000' AS DateTime), CAST(N'1996-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10339, N'MEREP', CAST(N'1996-10-28T00:00:00.000' AS DateTime), CAST(N'1996-11-25T00:00:00.000' AS DateTime), CAST(N'1996-11-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10340, N'BONAP', CAST(N'1996-10-29T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10341, N'SIMOB', CAST(N'1996-10-29T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10342, N'FRANK', CAST(N'1996-10-30T00:00:00.000' AS DateTime), CAST(N'1996-11-13T00:00:00.000' AS DateTime), CAST(N'1996-11-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10343, N'LEHMS', CAST(N'1996-10-31T00:00:00.000' AS DateTime), CAST(N'1996-11-28T00:00:00.000' AS DateTime), CAST(N'1996-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10344, N'WHITC', CAST(N'1996-11-01T00:00:00.000' AS DateTime), CAST(N'1996-11-29T00:00:00.000' AS DateTime), CAST(N'1996-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10345, N'QUICK', CAST(N'1996-11-04T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime), CAST(N'1996-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10346, N'RATTC', CAST(N'1996-11-05T00:00:00.000' AS DateTime), CAST(N'1996-12-17T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10347, N'FAMIA', CAST(N'1996-11-06T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10348, N'WANDK', CAST(N'1996-11-07T00:00:00.000' AS DateTime), CAST(N'1996-12-05T00:00:00.000' AS DateTime), CAST(N'1996-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10349, N'SPLIR', CAST(N'1996-11-08T00:00:00.000' AS DateTime), CAST(N'1996-12-06T00:00:00.000' AS DateTime), CAST(N'1996-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10350, N'LAMAI', CAST(N'1996-11-11T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime), CAST(N'1996-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10351, N'ERNSH', CAST(N'1996-11-11T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime), CAST(N'1996-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10352, N'FURIB', CAST(N'1996-11-12T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10353, N'PICCO', CAST(N'1996-11-13T00:00:00.000' AS DateTime), CAST(N'1996-12-11T00:00:00.000' AS DateTime), CAST(N'1996-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10354, N'PERIC', CAST(N'1996-11-14T00:00:00.000' AS DateTime), CAST(N'1996-12-12T00:00:00.000' AS DateTime), CAST(N'1996-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10355, N'AROUT', CAST(N'1996-11-15T00:00:00.000' AS DateTime), CAST(N'1996-12-13T00:00:00.000' AS DateTime), CAST(N'1996-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10356, N'WANDK', CAST(N'1996-11-18T00:00:00.000' AS DateTime), CAST(N'1996-12-16T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10357, N'LILAS', CAST(N'1996-11-19T00:00:00.000' AS DateTime), CAST(N'1996-12-17T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10358, N'LAMAI', CAST(N'1996-11-20T00:00:00.000' AS DateTime), CAST(N'1996-12-18T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10359, N'SEVES', CAST(N'1996-11-21T00:00:00.000' AS DateTime), CAST(N'1996-12-19T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10360, N'BLONP', CAST(N'1996-11-22T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10361, N'QUICK', CAST(N'1996-11-22T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime), CAST(N'1996-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10362, N'BONAP', CAST(N'1996-11-25T00:00:00.000' AS DateTime), CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1996-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10363, N'DRACD', CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-12-24T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10364, N'EASTC', CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10365, N'ANTON', CAST(N'1996-11-27T00:00:00.000' AS DateTime), CAST(N'1996-12-25T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10366, N'GALED', CAST(N'1996-11-28T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime), CAST(N'1996-12-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10367, N'VAFFE', CAST(N'1996-11-28T00:00:00.000' AS DateTime), CAST(N'1996-12-26T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10368, N'ERNSH', CAST(N'1996-11-29T00:00:00.000' AS DateTime), CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10369, N'SPLIR', CAST(N'1996-12-02T00:00:00.000' AS DateTime), CAST(N'1996-12-30T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10370, N'CHOPS', CAST(N'1996-12-03T00:00:00.000' AS DateTime), CAST(N'1996-12-31T00:00:00.000' AS DateTime), CAST(N'1996-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10371, N'LAMAI', CAST(N'1996-12-03T00:00:00.000' AS DateTime), CAST(N'1996-12-31T00:00:00.000' AS DateTime), CAST(N'1996-12-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10372, N'QUEEN', CAST(N'1996-12-04T00:00:00.000' AS DateTime), CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10373, N'HUNGO', CAST(N'1996-12-05T00:00:00.000' AS DateTime), CAST(N'1997-01-02T00:00:00.000' AS DateTime), CAST(N'1996-12-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10374, N'WOLZA', CAST(N'1996-12-05T00:00:00.000' AS DateTime), CAST(N'1997-01-02T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10375, N'HUNGC', CAST(N'1996-12-06T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10376, N'MEREP', CAST(N'1996-12-09T00:00:00.000' AS DateTime), CAST(N'1997-01-06T00:00:00.000' AS DateTime), CAST(N'1996-12-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10377, N'SEVES', CAST(N'1996-12-09T00:00:00.000' AS DateTime), CAST(N'1997-01-06T00:00:00.000' AS DateTime), CAST(N'1996-12-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10378, N'FOLKO', CAST(N'1996-12-10T00:00:00.000' AS DateTime), CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1996-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10379, N'QUEDE', CAST(N'1996-12-11T00:00:00.000' AS DateTime), CAST(N'1997-01-08T00:00:00.000' AS DateTime), CAST(N'1996-12-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10380, N'HUNGO', CAST(N'1996-12-12T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime), CAST(N'1997-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10381, N'LILAS', CAST(N'1996-12-12T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime), CAST(N'1996-12-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10382, N'ERNSH', CAST(N'1996-12-13T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1996-12-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10383, N'AROUT', CAST(N'1996-12-16T00:00:00.000' AS DateTime), CAST(N'1997-01-13T00:00:00.000' AS DateTime), CAST(N'1996-12-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10384, N'BERGS', CAST(N'1996-12-16T00:00:00.000' AS DateTime), CAST(N'1997-01-13T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10385, N'SPLIR', CAST(N'1996-12-17T00:00:00.000' AS DateTime), CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1996-12-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10386, N'FAMIA', CAST(N'1996-12-18T00:00:00.000' AS DateTime), CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1996-12-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10387, N'SANTG', CAST(N'1996-12-18T00:00:00.000' AS DateTime), CAST(N'1997-01-15T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10388, N'SEVES', CAST(N'1996-12-19T00:00:00.000' AS DateTime), CAST(N'1997-01-16T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10389, N'BOTTM', CAST(N'1996-12-20T00:00:00.000' AS DateTime), CAST(N'1997-01-17T00:00:00.000' AS DateTime), CAST(N'1996-12-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10390, N'ERNSH', CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1997-01-20T00:00:00.000' AS DateTime), CAST(N'1996-12-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10391, N'DRACD', CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1997-01-20T00:00:00.000' AS DateTime), CAST(N'1996-12-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10392, N'PICCO', CAST(N'1996-12-24T00:00:00.000' AS DateTime), CAST(N'1997-01-21T00:00:00.000' AS DateTime), CAST(N'1997-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10393, N'SAVEA', CAST(N'1996-12-25T00:00:00.000' AS DateTime), CAST(N'1997-01-22T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10394, N'HUNGC', CAST(N'1996-12-25T00:00:00.000' AS DateTime), CAST(N'1997-01-22T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10395, N'HILAA', CAST(N'1996-12-26T00:00:00.000' AS DateTime), CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10396, N'FRANK', CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-01-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10397, N'PRINI', CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1997-01-24T00:00:00.000' AS DateTime), CAST(N'1997-01-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10398, N'SAVEA', CAST(N'1996-12-30T00:00:00.000' AS DateTime), CAST(N'1997-01-27T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10399, N'VAFFE', CAST(N'1996-12-31T00:00:00.000' AS DateTime), CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1997-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10400, N'EASTC', CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1997-01-29T00:00:00.000' AS DateTime), CAST(N'1997-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10401, N'RATTC', CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1997-01-29T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10402, N'ERNSH', CAST(N'1997-01-02T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10403, N'ERNSH', CAST(N'1997-01-03T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10404, N'MAGAA', CAST(N'1997-01-03T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime), CAST(N'1997-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10405, N'LINOD', CAST(N'1997-01-06T00:00:00.000' AS DateTime), CAST(N'1997-02-03T00:00:00.000' AS DateTime), CAST(N'1997-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10406, N'QUEEN', CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1997-02-18T00:00:00.000' AS DateTime), CAST(N'1997-01-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10407, N'OTTIK', CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1997-02-04T00:00:00.000' AS DateTime), CAST(N'1997-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10408, N'FOLIG', CAST(N'1997-01-08T00:00:00.000' AS DateTime), CAST(N'1997-02-05T00:00:00.000' AS DateTime), CAST(N'1997-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10409, N'OCEAN', CAST(N'1997-01-09T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime), CAST(N'1997-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10410, N'BOTTM', CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime), CAST(N'1997-01-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10411, N'BOTTM', CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime), CAST(N'1997-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10412, N'WARTH', CAST(N'1997-01-13T00:00:00.000' AS DateTime), CAST(N'1997-02-10T00:00:00.000' AS DateTime), CAST(N'1997-01-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10413, N'LAMAI', CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10414, N'FAMIA', CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-01-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10415, N'HUNGC', CAST(N'1997-01-15T00:00:00.000' AS DateTime), CAST(N'1997-02-12T00:00:00.000' AS DateTime), CAST(N'1997-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10416, N'WARTH', CAST(N'1997-01-16T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10417, N'SIMOB', CAST(N'1997-01-16T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10418, N'QUICK', CAST(N'1997-01-17T00:00:00.000' AS DateTime), CAST(N'1997-02-14T00:00:00.000' AS DateTime), CAST(N'1997-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10419, N'RICSU', CAST(N'1997-01-20T00:00:00.000' AS DateTime), CAST(N'1997-02-17T00:00:00.000' AS DateTime), CAST(N'1997-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10420, N'WELLI', CAST(N'1997-01-21T00:00:00.000' AS DateTime), CAST(N'1997-02-18T00:00:00.000' AS DateTime), CAST(N'1997-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10421, N'QUEDE', CAST(N'1997-01-21T00:00:00.000' AS DateTime), CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10422, N'FRANS', CAST(N'1997-01-22T00:00:00.000' AS DateTime), CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10423, N'GOURL', CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10424, N'MEREP', CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-02-20T00:00:00.000' AS DateTime), CAST(N'1997-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10425, N'LAMAI', CAST(N'1997-01-24T00:00:00.000' AS DateTime), CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10426, N'GALED', CAST(N'1997-01-27T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10427, N'PICCO', CAST(N'1997-01-27T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10428, N'REGGC', CAST(N'1997-01-28T00:00:00.000' AS DateTime), CAST(N'1997-02-25T00:00:00.000' AS DateTime), CAST(N'1997-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10429, N'HUNGO', CAST(N'1997-01-29T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10430, N'ERNSH', CAST(N'1997-01-30T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10431, N'BOTTM', CAST(N'1997-01-30T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10432, N'SPLIR', CAST(N'1997-01-31T00:00:00.000' AS DateTime), CAST(N'1997-02-14T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10433, N'PRINI', CAST(N'1997-02-03T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10434, N'FOLKO', CAST(N'1997-02-03T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10435, N'CONSH', CAST(N'1997-02-04T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10436, N'BLONP', CAST(N'1997-02-05T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10437, N'WARTH', CAST(N'1997-02-05T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10438, N'TOMSP', CAST(N'1997-02-06T00:00:00.000' AS DateTime), CAST(N'1997-03-06T00:00:00.000' AS DateTime), CAST(N'1997-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10439, N'MEREP', CAST(N'1997-02-07T00:00:00.000' AS DateTime), CAST(N'1997-03-07T00:00:00.000' AS DateTime), CAST(N'1997-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10440, N'SAVEA', CAST(N'1997-02-10T00:00:00.000' AS DateTime), CAST(N'1997-03-10T00:00:00.000' AS DateTime), CAST(N'1997-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10441, N'OLDWO', CAST(N'1997-02-10T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10442, N'ERNSH', CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10443, N'REGGC', CAST(N'1997-02-12T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime), CAST(N'1997-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10444, N'BERGS', CAST(N'1997-02-12T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime), CAST(N'1997-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10445, N'BERGS', CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-03-13T00:00:00.000' AS DateTime), CAST(N'1997-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10446, N'TOMSP', CAST(N'1997-02-14T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), CAST(N'1997-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10447, N'RICAR', CAST(N'1997-02-14T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), CAST(N'1997-03-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10448, N'RANCH', CAST(N'1997-02-17T00:00:00.000' AS DateTime), CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10449, N'BLONP', CAST(N'1997-02-18T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10450, N'VICTE', CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-03-19T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10451, N'QUICK', CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10452, N'SAVEA', CAST(N'1997-02-20T00:00:00.000' AS DateTime), CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10453, N'AROUT', CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10454, N'LAMAI', CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10455, N'WARTH', CAST(N'1997-02-24T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10456, N'KOENE', CAST(N'1997-02-25T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10457, N'KOENE', CAST(N'1997-02-25T00:00:00.000' AS DateTime), CAST(N'1997-03-25T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10458, N'SUPRD', CAST(N'1997-02-26T00:00:00.000' AS DateTime), CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10459, N'VICTE', CAST(N'1997-02-27T00:00:00.000' AS DateTime), CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10460, N'FOLKO', CAST(N'1997-02-28T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10461, N'LILAS', CAST(N'1997-02-28T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10462, N'CONSH', CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10463, N'SUPRD', CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10464, N'FURIB', CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10465, N'VAFFE', CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10466, N'COMMI', CAST(N'1997-03-06T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10467, N'MAGAA', CAST(N'1997-03-06T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10468, N'KOENE', CAST(N'1997-03-07T00:00:00.000' AS DateTime), CAST(N'1997-04-04T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10469, N'WHITC', CAST(N'1997-03-10T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10470, N'BONAP', CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10471, N'BSBEV', CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10472, N'SEVES', CAST(N'1997-03-12T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10473, N'ISLAT', CAST(N'1997-03-13T00:00:00.000' AS DateTime), CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10474, N'PERIC', CAST(N'1997-03-13T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10475, N'SUPRD', CAST(N'1997-03-14T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), CAST(N'1997-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10476, N'HILAA', CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10477, N'PRINI', CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10478, N'VICTE', CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10479, N'RATTC', CAST(N'1997-03-19T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10480, N'FOLIG', CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10481, N'RICAR', CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10482, N'LAZYK', CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10483, N'WHITC', CAST(N'1997-03-24T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10484, N'BSBEV', CAST(N'1997-03-24T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10485, N'LINOD', CAST(N'1997-03-25T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10486, N'HILAA', CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10487, N'QUEEN', CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10488, N'FRANK', CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10489, N'PICCO', CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-04-25T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10490, N'HILAA', CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10491, N'FURIB', CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10492, N'BOTTM', CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10493, N'LAMAI', CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10494, N'COMMI', CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10495, N'LAUGB', CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10496, N'TRADH', CAST(N'1997-04-04T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10497, N'LEHMS', CAST(N'1997-04-04T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10498, N'HILAA', CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10499, N'LILAS', CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-05-06T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10500, N'LAMAI', CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10501, N'BLAUS', CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10502, N'PERIC', CAST(N'1997-04-10T00:00:00.000' AS DateTime), CAST(N'1997-05-08T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10503, N'HUNGO', CAST(N'1997-04-11T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10504, N'WHITC', CAST(N'1997-04-11T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-04-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10505, N'MEREP', CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10506, N'KOENE', CAST(N'1997-04-15T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10507, N'ANTON', CAST(N'1997-04-15T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10508, N'OTTIK', CAST(N'1997-04-16T00:00:00.000' AS DateTime), CAST(N'1997-05-14T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10509, N'BLAUS', CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-05-15T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10510, N'SAVEA', CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10511, N'BONAP', CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10512, N'FAMIA', CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10513, N'WANDK', CAST(N'1997-04-22T00:00:00.000' AS DateTime), CAST(N'1997-06-03T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10514, N'ERNSH', CAST(N'1997-04-22T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10515, N'QUICK', CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10516, N'HUNGO', CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10517, N'NORTS', CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10518, N'TORTU', CAST(N'1997-04-25T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10519, N'CHOPS', CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-05-26T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10520, N'SANTG', CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10521, N'CACTU', CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10522, N'LEHMS', CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10523, N'SEVES', CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10524, N'BERGS', CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10525, N'BONAP', CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10526, N'WARTH', CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime), CAST(N'1997-05-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10527, N'QUICK', CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10528, N'GREAL', CAST(N'1997-05-06T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10529, N'MAISD', CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-06-04T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10530, N'PICCO', CAST(N'1997-05-08T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10531, N'OCEAN', CAST(N'1997-05-08T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10532, N'EASTC', CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10533, N'FOLKO', CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10534, N'LEHMS', CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-05-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10535, N'ANTON', CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10536, N'LEHMS', CAST(N'1997-05-14T00:00:00.000' AS DateTime), CAST(N'1997-06-11T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10537, N'RICSU', CAST(N'1997-05-14T00:00:00.000' AS DateTime), CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10538, N'BSBEV', CAST(N'1997-05-15T00:00:00.000' AS DateTime), CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10539, N'BSBEV', CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10540, N'QUICK', CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10541, N'HANAR', CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10542, N'KOENE', CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10543, N'LILAS', CAST(N'1997-05-21T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10544, N'LONEP', CAST(N'1997-05-21T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10545, N'LAZYK', CAST(N'1997-05-22T00:00:00.000' AS DateTime), CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10546, N'VICTE', CAST(N'1997-05-23T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10547, N'SEVES', CAST(N'1997-05-23T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10548, N'TOMSP', CAST(N'1997-05-26T00:00:00.000' AS DateTime), CAST(N'1997-06-23T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10549, N'QUICK', CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10550, N'GODOS', CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10551, N'FURIB', CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10552, N'HILAA', CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10553, N'WARTH', CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-06-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10554, N'OTTIK', CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10555, N'SAVEA', CAST(N'1997-06-02T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-06-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10556, N'SIMOB', CAST(N'1997-06-03T00:00:00.000' AS DateTime), CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10557, N'LEHMS', CAST(N'1997-06-03T00:00:00.000' AS DateTime), CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10558, N'AROUT', CAST(N'1997-06-04T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10559, N'BLONP', CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-07-03T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10560, N'FRANK', CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10561, N'FOLKO', CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10562, N'REGGC', CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10563, N'RICAR', CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10564, N'RATTC', CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-07-08T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10565, N'MEREP', CAST(N'1997-06-11T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10566, N'BLONP', CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10567, N'HUNGO', CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10568, N'GALED', CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10569, N'RATTC', CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), CAST(N'1997-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10570, N'MEREP', CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-06-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10571, N'ERNSH', CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10572, N'BERGS', CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10573, N'ANTON', CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10574, N'TRAIH', CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10575, N'MORGK', CAST(N'1997-06-20T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10576, N'TORTU', CAST(N'1997-06-23T00:00:00.000' AS DateTime), CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10577, N'TRAIH', CAST(N'1997-06-23T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10578, N'BSBEV', CAST(N'1997-06-24T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10579, N'LETSS', CAST(N'1997-06-25T00:00:00.000' AS DateTime), CAST(N'1997-07-23T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10580, N'OTTIK', CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10581, N'FAMIA', CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10582, N'BLAUS', CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10583, N'WARTH', CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10584, N'BLONP', CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10585, N'WELLI', CAST(N'1997-07-01T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10586, N'REGGC', CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10587, N'QUEDE', CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10588, N'QUICK', CAST(N'1997-07-03T00:00:00.000' AS DateTime), CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10589, N'GREAL', CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10590, N'MEREP', CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10591, N'VAFFE', CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10592, N'LEHMS', CAST(N'1997-07-08T00:00:00.000' AS DateTime), CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10593, N'LEHMS', CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), CAST(N'1997-08-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10594, N'OLDWO', CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10595, N'ERNSH', CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10596, N'WHITC', CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10597, N'PICCO', CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-07-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10598, N'RATTC', CAST(N'1997-07-14T00:00:00.000' AS DateTime), CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-07-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10599, N'BSBEV', CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10600, N'HUNGC', CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-13T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10601, N'HILAA', CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10602, N'VAFFE', CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10603, N'SAVEA', CAST(N'1997-07-18T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10604, N'FURIB', CAST(N'1997-07-18T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10605, N'MEREP', CAST(N'1997-07-21T00:00:00.000' AS DateTime), CAST(N'1997-08-18T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10606, N'TRADH', CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10607, N'SAVEA', CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10608, N'TOMSP', CAST(N'1997-07-23T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10609, N'DUMON', CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10610, N'LAMAI', CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10611, N'WOLZA', CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10612, N'SAVEA', CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10613, N'HILAA', CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10614, N'BLAUS', CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10615, N'WILMK', CAST(N'1997-07-30T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10616, N'GREAL', CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10617, N'GREAL', CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10618, N'MEREP', CAST(N'1997-08-01T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10619, N'MEREP', CAST(N'1997-08-04T00:00:00.000' AS DateTime), CAST(N'1997-09-01T00:00:00.000' AS DateTime), CAST(N'1997-08-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10620, N'LAUGB', CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10621, N'ISLAT', CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10622, N'RICAR', CAST(N'1997-08-06T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime), CAST(N'1997-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10623, N'FRANK', CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10624, N'THECR', CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10625, N'ANATR', CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-09-05T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10626, N'BERGS', CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10627, N'SAVEA', CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10628, N'BLONP', CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10629, N'GODOS', CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10630, N'KOENE', CAST(N'1997-08-13T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10631, N'LAMAI', CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10632, N'WANDK', CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10633, N'ERNSH', CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10634, N'FOLIG', CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10635, N'MAGAA', CAST(N'1997-08-18T00:00:00.000' AS DateTime), CAST(N'1997-09-15T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10636, N'WARTH', CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10637, N'QUEEN', CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10638, N'LINOD', CAST(N'1997-08-20T00:00:00.000' AS DateTime), CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10639, N'SANTG', CAST(N'1997-08-20T00:00:00.000' AS DateTime), CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10640, N'WANDK', CAST(N'1997-08-21T00:00:00.000' AS DateTime), CAST(N'1997-09-18T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10641, N'HILAA', CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10642, N'SIMOB', CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10643, N'ALFKI', CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10644, N'WELLI', CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10645, N'HANAR', CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10646, N'HUNGO', CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10647, N'QUEDE', CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10648, N'RICAR', CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-10-09T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10649, N'MAISD', CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-09-25T00:00:00.000' AS DateTime), CAST(N'1997-08-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10650, N'FAMIA', CAST(N'1997-08-29T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10651, N'WANDK', CAST(N'1997-09-01T00:00:00.000' AS DateTime), CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10652, N'GOURL', CAST(N'1997-09-01T00:00:00.000' AS DateTime), CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10653, N'FRANK', CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10654, N'BERGS', CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10655, N'REGGC', CAST(N'1997-09-03T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10656, N'GREAL', CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10657, N'SAVEA', CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10658, N'QUICK', CAST(N'1997-09-05T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10659, N'QUEEN', CAST(N'1997-09-05T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10660, N'HUNGC', CAST(N'1997-09-08T00:00:00.000' AS DateTime), CAST(N'1997-10-06T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10661, N'HUNGO', CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-10-07T00:00:00.000' AS DateTime), CAST(N'1997-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10662, N'LONEP', CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-10-07T00:00:00.000' AS DateTime), CAST(N'1997-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10663, N'BONAP', CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-09-24T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10664, N'FURIB', CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10665, N'LONEP', CAST(N'1997-09-11T00:00:00.000' AS DateTime), CAST(N'1997-10-09T00:00:00.000' AS DateTime), CAST(N'1997-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10666, N'RICSU', CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-10-10T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10667, N'ERNSH', CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-10-10T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10668, N'WANDK', CAST(N'1997-09-15T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10669, N'SIMOB', CAST(N'1997-09-15T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10670, N'FRANK', CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10671, N'FRANR', CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10672, N'BERGS', CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10673, N'WILMK', CAST(N'1997-09-18T00:00:00.000' AS DateTime), CAST(N'1997-10-16T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10674, N'ISLAT', CAST(N'1997-09-18T00:00:00.000' AS DateTime), CAST(N'1997-10-16T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10675, N'FRANK', CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10676, N'TORTU', CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-09-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10677, N'ANTON', CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10678, N'SAVEA', CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-10-21T00:00:00.000' AS DateTime), CAST(N'1997-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10679, N'BLONP', CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-10-21T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10680, N'OLDWO', CAST(N'1997-09-24T00:00:00.000' AS DateTime), CAST(N'1997-10-22T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10681, N'GREAL', CAST(N'1997-09-25T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10682, N'ANTON', CAST(N'1997-09-25T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10683, N'DUMON', CAST(N'1997-09-26T00:00:00.000' AS DateTime), CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10684, N'OTTIK', CAST(N'1997-09-26T00:00:00.000' AS DateTime), CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10685, N'GOURL', CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10686, N'PICCO', CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-10-28T00:00:00.000' AS DateTime), CAST(N'1997-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10687, N'HUNGO', CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-10-28T00:00:00.000' AS DateTime), CAST(N'1997-10-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10688, N'VAFFE', CAST(N'1997-10-01T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10689, N'BERGS', CAST(N'1997-10-01T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime), CAST(N'1997-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10690, N'HANAR', CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10691, N'QUICK', CAST(N'1997-10-03T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-10-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10692, N'ALFKI', CAST(N'1997-10-03T00:00:00.000' AS DateTime), CAST(N'1997-10-31T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10693, N'WHITC', CAST(N'1997-10-06T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10694, N'QUICK', CAST(N'1997-10-06T00:00:00.000' AS DateTime), CAST(N'1997-11-03T00:00:00.000' AS DateTime), CAST(N'1997-10-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10695, N'WILMK', CAST(N'1997-10-07T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), CAST(N'1997-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10696, N'WHITC', CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10697, N'LINOD', CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime), CAST(N'1997-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10698, N'ERNSH', CAST(N'1997-10-09T00:00:00.000' AS DateTime), CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-10-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10699, N'MORGK', CAST(N'1997-10-09T00:00:00.000' AS DateTime), CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10700, N'SAVEA', CAST(N'1997-10-10T00:00:00.000' AS DateTime), CAST(N'1997-11-07T00:00:00.000' AS DateTime), CAST(N'1997-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10701, N'HUNGO', CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-10-27T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10702, N'ALFKI', CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime), CAST(N'1997-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10703, N'FOLKO', CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10704, N'QUEEN', CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-11-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10705, N'HILAA', CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10706, N'OLDWO', CAST(N'1997-10-16T00:00:00.000' AS DateTime), CAST(N'1997-11-13T00:00:00.000' AS DateTime), CAST(N'1997-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10707, N'AROUT', CAST(N'1997-10-16T00:00:00.000' AS DateTime), CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10708, N'THEBI', CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10709, N'GOURL', CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10710, N'FRANS', CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10711, N'SAVEA', CAST(N'1997-10-21T00:00:00.000' AS DateTime), CAST(N'1997-12-02T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10712, N'HUNGO', CAST(N'1997-10-21T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), CAST(N'1997-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10713, N'SAVEA', CAST(N'1997-10-22T00:00:00.000' AS DateTime), CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-10-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10714, N'SAVEA', CAST(N'1997-10-22T00:00:00.000' AS DateTime), CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-10-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10715, N'BONAP', CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10716, N'RANCH', CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), CAST(N'1997-10-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10717, N'FRANK', CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10718, N'KOENE', CAST(N'1997-10-27T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10719, N'LETSS', CAST(N'1997-10-27T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10720, N'QUEDE', CAST(N'1997-10-28T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10721, N'QUICK', CAST(N'1997-10-29T00:00:00.000' AS DateTime), CAST(N'1997-11-26T00:00:00.000' AS DateTime), CAST(N'1997-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10722, N'SAVEA', CAST(N'1997-10-29T00:00:00.000' AS DateTime), CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1997-11-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10723, N'WHITC', CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime), CAST(N'1997-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10724, N'MEREP', CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10725, N'FAMIA', CAST(N'1997-10-31T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10726, N'EASTC', CAST(N'1997-11-03T00:00:00.000' AS DateTime), CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10727, N'REGGC', CAST(N'1997-11-03T00:00:00.000' AS DateTime), CAST(N'1997-12-01T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10728, N'QUEEN', CAST(N'1997-11-04T00:00:00.000' AS DateTime), CAST(N'1997-12-02T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10729, N'LINOD', CAST(N'1997-11-04T00:00:00.000' AS DateTime), CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10730, N'BONAP', CAST(N'1997-11-05T00:00:00.000' AS DateTime), CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10731, N'CHOPS', CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-12-04T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10732, N'BONAP', CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-12-04T00:00:00.000' AS DateTime), CAST(N'1997-11-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10733, N'BERGS', CAST(N'1997-11-07T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1997-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10734, N'GOURL', CAST(N'1997-11-07T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10735, N'LETSS', CAST(N'1997-11-10T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10736, N'HUNGO', CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10737, N'VINET', CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10738, N'SPECD', CAST(N'1997-11-12T00:00:00.000' AS DateTime), CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10739, N'VINET', CAST(N'1997-11-12T00:00:00.000' AS DateTime), CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1997-11-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10740, N'WHITC', CAST(N'1997-11-13T00:00:00.000' AS DateTime), CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1997-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10741, N'AROUT', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10742, N'BOTTM', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10743, N'AROUT', CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10744, N'VAFFE', CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10745, N'QUICK', CAST(N'1997-11-18T00:00:00.000' AS DateTime), CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10746, N'CHOPS', CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10747, N'PICCO', CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1997-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10748, N'SAVEA', CAST(N'1997-11-20T00:00:00.000' AS DateTime), CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10749, N'ISLAT', CAST(N'1997-11-20T00:00:00.000' AS DateTime), CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10750, N'WARTH', CAST(N'1997-11-21T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10751, N'RICSU', CAST(N'1997-11-24T00:00:00.000' AS DateTime), CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1997-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10752, N'NORTS', CAST(N'1997-11-24T00:00:00.000' AS DateTime), CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10753, N'FRANS', CAST(N'1997-11-25T00:00:00.000' AS DateTime), CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10754, N'MAGAA', CAST(N'1997-11-25T00:00:00.000' AS DateTime), CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10755, N'BONAP', CAST(N'1997-11-26T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10756, N'SPLIR', CAST(N'1997-11-27T00:00:00.000' AS DateTime), CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1997-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10757, N'SAVEA', CAST(N'1997-11-27T00:00:00.000' AS DateTime), CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10758, N'RICSU', CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime), CAST(N'1997-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10759, N'ANATR', CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10760, N'MAISD', CAST(N'1997-12-01T00:00:00.000' AS DateTime), CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1997-12-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10761, N'RATTC', CAST(N'1997-12-02T00:00:00.000' AS DateTime), CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10762, N'FOLKO', CAST(N'1997-12-02T00:00:00.000' AS DateTime), CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10763, N'FOLIG', CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10764, N'ERNSH', CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10765, N'QUICK', CAST(N'1997-12-04T00:00:00.000' AS DateTime), CAST(N'1998-01-01T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10766, N'OTTIK', CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10767, N'SUPRD', CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10768, N'AROUT', CAST(N'1997-12-08T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10769, N'VAFFE', CAST(N'1997-12-08T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10770, N'HANAR', CAST(N'1997-12-09T00:00:00.000' AS DateTime), CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10771, N'ERNSH', CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10772, N'LEHMS', CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10773, N'ERNSH', CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1998-01-08T00:00:00.000' AS DateTime), CAST(N'1997-12-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10774, N'FOLKO', CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10775, N'THECR', CAST(N'1997-12-12T00:00:00.000' AS DateTime), CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10776, N'ERNSH', CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1997-12-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10777, N'GOURL', CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10778, N'BERGS', CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1998-01-13T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10779, N'MORGK', CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1998-01-13T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10780, N'LILAS', CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1997-12-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10781, N'WARTH', CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10782, N'CACTU', CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime), CAST(N'1997-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10783, N'HANAR', CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10784, N'MAGAA', CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10785, N'GROSR', CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10786, N'QUEEN', CAST(N'1997-12-19T00:00:00.000' AS DateTime), CAST(N'1998-01-16T00:00:00.000' AS DateTime), CAST(N'1997-12-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10787, N'LAMAI', CAST(N'1997-12-19T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10788, N'QUICK', CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10789, N'FOLIG', CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10790, N'GOURL', CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10791, N'FRANK', CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1998-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10792, N'WOLZA', CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10793, N'AROUT', CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10794, N'QUEDE', CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10795, N'ERNSH', CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10796, N'HILAA', CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10797, N'DRACD', CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10798, N'ISLAT', CAST(N'1997-12-26T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10799, N'KOENE', CAST(N'1997-12-26T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10800, N'SEVES', CAST(N'1997-12-26T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10801, N'BOLID', CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10802, N'SIMOB', CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10803, N'WELLI', CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-01-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10804, N'SEVES', CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10805, N'THEBI', CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10806, N'VICTE', CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10807, N'FRANS', CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10808, N'OLDWO', CAST(N'1998-01-01T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10809, N'WELLI', CAST(N'1998-01-01T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10810, N'LAUGB', CAST(N'1998-01-01T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10811, N'LINOD', CAST(N'1998-01-02T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime), CAST(N'1998-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10812, N'REGGC', CAST(N'1998-01-02T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime), CAST(N'1998-01-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10813, N'RICAR', CAST(N'1998-01-05T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10814, N'VICTE', CAST(N'1998-01-05T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10815, N'SAVEA', CAST(N'1998-01-05T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10816, N'GREAL', CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1998-02-03T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10817, N'KOENE', CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1998-01-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10818, N'MAGAA', CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-01-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10819, N'CACTU', CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10820, N'RATTC', CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-01-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10821, N'SPLIR', CAST(N'1998-01-08T00:00:00.000' AS DateTime), CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10822, N'TRAIH', CAST(N'1998-01-08T00:00:00.000' AS DateTime), CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10823, N'LILAS', CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10824, N'FOLKO', CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10825, N'DRACD', CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10826, N'BLONP', CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10827, N'BONAP', CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10828, N'RANCH', CAST(N'1998-01-13T00:00:00.000' AS DateTime), CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10829, N'ISLAT', CAST(N'1998-01-13T00:00:00.000' AS DateTime), CAST(N'1998-02-10T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10830, N'TRADH', CAST(N'1998-01-13T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10831, N'SANTG', CAST(N'1998-01-14T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10832, N'LAMAI', CAST(N'1998-01-14T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10833, N'OTTIK', CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10834, N'TRADH', CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10835, N'ALFKI', CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10836, N'ERNSH', CAST(N'1998-01-16T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10837, N'BERGS', CAST(N'1998-01-16T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10838, N'LINOD', CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10839, N'TRADH', CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10840, N'LINOD', CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10841, N'SUPRD', CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1998-02-17T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10842, N'TORTU', CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1998-02-17T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10843, N'VICTE', CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10844, N'PICCO', CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10845, N'QUICK', CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10846, N'SUPRD', CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10847, N'SAVEA', CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10848, N'CONSH', CAST(N'1998-01-23T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10849, N'KOENE', CAST(N'1998-01-23T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10850, N'VICTE', CAST(N'1998-01-23T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10851, N'RICAR', CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10852, N'RATTC', CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10853, N'BLAUS', CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10854, N'ERNSH', CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-02-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10855, N'OLDWO', CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10856, N'ANTON', CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-02-25T00:00:00.000' AS DateTime), CAST(N'1998-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10857, N'BERGS', CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-02-25T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10858, N'LACOR', CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10859, N'FRANK', CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10860, N'FRANR', CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10861, N'WHITC', CAST(N'1998-01-30T00:00:00.000' AS DateTime), CAST(N'1998-02-27T00:00:00.000' AS DateTime), CAST(N'1998-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10862, N'LEHMS', CAST(N'1998-01-30T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10863, N'HILAA', CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10864, N'AROUT', CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10865, N'QUICK', CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10866, N'BERGS', CAST(N'1998-02-03T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10867, N'LONEP', CAST(N'1998-02-03T00:00:00.000' AS DateTime), CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10868, N'QUEEN', CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10869, N'SEVES', CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10870, N'WOLZA', CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10871, N'BONAP', CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10872, N'GODOS', CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10873, N'WILMK', CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10874, N'GODOS', CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10875, N'BERGS', CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10876, N'BONAP', CAST(N'1998-02-09T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10877, N'RICAR', CAST(N'1998-02-09T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10878, N'QUICK', CAST(N'1998-02-10T00:00:00.000' AS DateTime), CAST(N'1998-03-10T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10879, N'WILMK', CAST(N'1998-02-10T00:00:00.000' AS DateTime), CAST(N'1998-03-10T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10880, N'FOLKO', CAST(N'1998-02-10T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10881, N'CACTU', CAST(N'1998-02-11T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10882, N'SAVEA', CAST(N'1998-02-11T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10883, N'LONEP', CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10884, N'LETSS', CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10885, N'SUPRD', CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10886, N'HANAR', CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10887, N'GALED', CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10888, N'GODOS', CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10889, N'RATTC', CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10890, N'DUMON', CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10891, N'LEHMS', CAST(N'1998-02-17T00:00:00.000' AS DateTime), CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10892, N'MAISD', CAST(N'1998-02-17T00:00:00.000' AS DateTime), CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10893, N'KOENE', CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10894, N'SAVEA', CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10895, N'ERNSH', CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10896, N'MAISD', CAST(N'1998-02-19T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10897, N'HUNGO', CAST(N'1998-02-19T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10898, N'OCEAN', CAST(N'1998-02-20T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10899, N'LILAS', CAST(N'1998-02-20T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10900, N'WELLI', CAST(N'1998-02-20T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10901, N'HILAA', CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10902, N'FOLKO', CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10903, N'HANAR', CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10904, N'WHITC', CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10905, N'WELLI', CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10906, N'WOLZA', CAST(N'1998-02-25T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10907, N'SPECD', CAST(N'1998-02-25T00:00:00.000' AS DateTime), CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10908, N'REGGC', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10909, N'SANTG', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10910, N'WILMK', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10911, N'GODOS', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10912, N'HUNGO', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10913, N'QUEEN', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10914, N'QUEEN', CAST(N'1998-02-27T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10915, N'TORTU', CAST(N'1998-02-27T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10916, N'RANCH', CAST(N'1998-02-27T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10917, N'ROMEY', CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10918, N'BOTTM', CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10919, N'LINOD', CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10920, N'AROUT', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10921, N'VAFFE', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10922, N'HANAR', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10923, N'LAMAI', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10924, N'BERGS', CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10925, N'HANAR', CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10926, N'ANATR', CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10927, N'LACOR', CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10928, N'GALED', CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10929, N'FRANK', CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10930, N'SUPRD', CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10931, N'RICSU', CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10932, N'BONAP', CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10933, N'ISLAT', CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10934, N'LEHMS', CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10935, N'WELLI', CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10936, N'GREAL', CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10937, N'CACTU', CAST(N'1998-03-10T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10938, N'QUICK', CAST(N'1998-03-10T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10939, N'MAGAA', CAST(N'1998-03-10T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10940, N'BONAP', CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10941, N'SAVEA', CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10942, N'REGGC', CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10943, N'BSBEV', CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10944, N'BOTTM', CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10945, N'MORGK', CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10946, N'VAFFE', CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10947, N'BSBEV', CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10948, N'GODOS', CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10949, N'BOTTM', CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10950, N'MAGAA', CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10951, N'RICSU', CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10952, N'ALFKI', CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10953, N'AROUT', CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10954, N'LINOD', CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10955, N'FOLKO', CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10956, N'BLAUS', CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10957, N'HILAA', CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10958, N'OCEAN', CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10959, N'GOURL', CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10960, N'HILAA', CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10961, N'QUEEN', CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10962, N'QUICK', CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10963, N'FURIB', CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10964, N'SPECD', CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10965, N'OLDWO', CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10966, N'CHOPS', CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10967, N'TOMSP', CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10968, N'ERNSH', CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10969, N'COMMI', CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10970, N'BOLID', CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10971, N'FRANR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10972, N'LACOR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10973, N'LACOR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10974, N'SPLIR', CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10975, N'BOTTM', CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10976, N'HILAA', CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10977, N'FOLKO', CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10978, N'MAISD', CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10979, N'ERNSH', CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10980, N'FOLKO', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-05-08T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10981, N'HANAR', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10982, N'BOTTM', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10983, N'SAVEA', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10984, N'SAVEA', CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10985, N'HUNGO', CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10986, N'OCEAN', CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10987, N'EASTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10988, N'RATTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10989, N'QUEDE', CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10990, N'ERNSH', CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10991, N'QUICK', CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10992, N'THEBI', CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10993, N'FOLKO', CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10994, N'VAFFE', CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10995, N'PERIC', CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10996, N'QUICK', CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10997, N'LILAS', CAST(N'1998-04-03T00:00:00.000' AS DateTime), CAST(N'1998-05-15T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10998, N'WOLZA', CAST(N'1998-04-03T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (10999, N'OTTIK', CAST(N'1998-04-03T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11000, N'RATTC', CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11001, N'FOLKO', CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11002, N'SAVEA', CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11003, N'THECR', CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11004, N'MAISD', CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11005, N'WILMK', CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11006, N'GREAL', CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11007, N'PRINI', CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11008, N'ERNSH', CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11009, N'GODOS', CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11010, N'REGGC', CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-05-07T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11011, N'ALFKI', CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-05-07T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11012, N'FRANK', CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11013, N'ROMEY', CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-05-07T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11014, N'LINOD', CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-05-08T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11015, N'SANTG', CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11016, N'AROUT', CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-05-08T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11017, N'ERNSH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), CAST(N'1998-05-11T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11018, N'LONEP', CAST(N'1998-04-13T00:00:00.000' AS DateTime), CAST(N'1998-05-11T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11019, N'RANCH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), CAST(N'1998-05-11T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11020, N'OTTIK', CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11021, N'QUICK', CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11022, N'HANAR', CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11023, N'BSBEV', CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11024, N'EASTC', CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11025, N'WARTH', CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11026, N'FRANS', CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11027, N'BOTTM', CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-05-14T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11028, N'KOENE', CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-05-14T00:00:00.000' AS DateTime), CAST(N'1998-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11029, N'CHOPS', CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-05-14T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11030, N'SAVEA', CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-05-15T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11031, N'SAVEA', CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-05-15T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11032, N'WHITC', CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-05-15T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11033, N'RICSU', CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-05-15T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11034, N'OLDWO', CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-06-01T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11035, N'SUPRD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-05-18T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11036, N'DRACD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-05-18T00:00:00.000' AS DateTime), CAST(N'1998-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11037, N'GODOS', CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-05-19T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11038, N'SUPRD', CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-05-19T00:00:00.000' AS DateTime), CAST(N'1998-04-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11039, N'LINOD', CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-05-19T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11040, N'GREAL', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11041, N'CHOPS', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-20T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11042, N'COMMI', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11043, N'SPECD', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-20T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11044, N'WOLZA', CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-05-21T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11045, N'BOTTM', CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-05-21T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11046, N'WANDK', CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-05-21T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11047, N'EASTC', CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11048, N'BOTTM', CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-04-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11049, N'GOURL', CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11050, N'FOLKO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11051, N'LAMAI', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11052, N'HANAR', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11053, N'PICCO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11054, N'CACTU', CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-26T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11055, N'HILAA', CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-26T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11056, N'EASTC', CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11057, N'NORTS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-05-27T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11058, N'BLAUS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-05-27T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11059, N'RICAR', CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11060, N'FRANS', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11061, N'GREAL', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-06-11T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11062, N'REGGC', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11063, N'HUNGO', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11064, N'SAVEA', CAST(N'1998-05-01T00:00:00.000' AS DateTime), CAST(N'1998-05-29T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11065, N'LILAS', CAST(N'1998-05-01T00:00:00.000' AS DateTime), CAST(N'1998-05-29T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11066, N'WHITC', CAST(N'1998-05-01T00:00:00.000' AS DateTime), CAST(N'1998-05-29T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11067, N'DRACD', CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-05-18T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11068, N'QUEEN', CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-06-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11069, N'TORTU', CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-06-01T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11070, N'LEHMS', CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-06-02T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11071, N'LILAS', CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-06-02T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11072, N'ERNSH', CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-06-02T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11073, N'PERIC', CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-06-02T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11074, N'SIMOB', CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-06-03T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11075, N'RICSU', CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-06-03T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11076, N'BONAP', CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-06-03T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate]) VALUES (11077, N'RATTC', CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-06-03T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (1, N'Chai', 1, 18.0000, 39, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (2, N'Chang', 1, 19.0000, 17, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (3, N'Aniseed Syrup', 2, 10.0000, 13, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, 22.0000, 53, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, 21.3500, 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (6, N'Grandma''s Boysenberry Spread', 2, 25.0000, 120, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 7, 30.0000, 15, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (8, N'Northwoods Cranberry Sauce', 2, 40.0000, 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (9, N'Mishi Kobe Niku', 6, 97.0000, 29, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (10, N'Ikura', 8, 31.0000, 31, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (11, N'Queso Cabrales', 4, 21.0000, 22, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (12, N'Queso Manchego La Pastora', 4, 38.0000, 86, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (13, N'Konbu', 8, 6.0000, 24, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (14, N'Tofu', 7, 23.2500, 35, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (15, N'Genen Shouyu', 2, 15.5000, 39, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (16, N'Pavlova', 3, 17.4500, 29, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (17, N'Alice Mutton', 6, 39.0000, 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (18, N'Carnarvon Tigers', 8, 62.5000, 42, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (19, N'Teatime Chocolate Biscuits', 3, 9.2000, 25, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (20, N'Sir Rodney''s Marmalade', 3, 81.0000, 40, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (21, N'Sir Rodney''s Scones', 3, 10.0000, 3, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (22, N'Gustaf''s Knäckebröd', 5, 21.0000, 104, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (23, N'Tunnbröd', 5, 9.0000, 61, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (24, N'Guaraná Fantástica', 1, 4.5000, 20, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme', 3, 14.0000, 76, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (26, N'Gumbär Gummibärchen', 3, 31.2300, 15, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (27, N'Schoggi Schokolade', 3, 43.9000, 49, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (28, N'Rössle Sauerkraut', 7, 45.6000, 26, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (29, N'Thüringer Rostbratwurst', 6, 123.7900, 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (30, N'Nord-Ost Matjeshering', 8, 25.8900, 10, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (31, N'Gorgonzola Telino', 4, 12.5000, 0, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (32, N'Mascarpone Fabioli', 4, 32.0000, 9, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (33, N'Geitost', 4, 2.5000, 112, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (34, N'Sasquatch Ale', 1, 14.0000, 111, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (35, N'Steeleye Stout', 1, 18.0000, 20, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (36, N'Inlagd Sill', 8, 19.0000, 112, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (37, N'Gravad lax', 8, 26.0000, 11, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (38, N'Côte de Blaye', 1, 263.5000, 17, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (39, N'Chartreuse verte', 1, 18.0000, 69, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (40, N'Boston Crab Meat', 8, 18.4000, 123, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (41, N'Jack''s New England Clam Chowder', 8, 9.6500, 85, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (42, N'Singaporean Hokkien Fried Mee', 5, 14.0000, 26, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (43, N'Ipoh Coffee', 1, 46.0000, 17, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (44, N'Gula Malacca', 2, 19.4500, 27, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (45, N'Rogede sild', 8, 9.5000, 5, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (46, N'Spegesild', 8, 12.0000, 95, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (47, N'Zaanse koeken', 3, 9.5000, 36, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (48, N'Chocolade', 3, 12.7500, 15, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (49, N'Maxilaku', 3, 20.0000, 10, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (50, N'Valkoinen suklaa', 3, 16.2500, 65, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (51, N'Manjimup Dried Apples', 7, 53.0000, 20, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (52, N'Filo Mix', 5, 7.0000, 38, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (53, N'Perth Pasties', 6, 32.8000, 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (54, N'Tourtière', 6, 7.4500, 21, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (55, N'Pâté chinois', 6, 24.0000, 115, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (56, N'Gnocchi di nonna Alice', 5, 38.0000, 21, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (57, N'Ravioli Angelo', 5, 19.5000, 36, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (58, N'Escargots de Bourgogne', 8, 13.2500, 62, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (59, N'Raclette Courdavault', 4, 55.0000, 79, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (60, N'Camembert Pierrot', 4, 34.0000, 19, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (61, N'Sirop d''érable', 2, 28.5000, 113, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (62, N'Tarte au sucre', 3, 49.3000, 17, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (63, N'Vegie-spread', 2, 43.9000, 24, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (64, N'Wimmers gute Semmelknödel', 5, 33.2500, 22, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', 2, 21.0500, 76, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (66, N'Louisiana Hot Spiced Okra', 2, 17.0000, 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (67, N'Laughing Lumberjack Lager', 1, 14.0000, 52, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (68, N'Scottish Longbreads', 3, 12.5000, 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (69, N'Gudbrandsdalsost', 4, 36.0000, 26, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (70, N'Outback Lager', 1, 15.0000, 15, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (71, N'Flotemysost', 4, 21.5000, 26, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (72, N'Mozzarella di Giovanni', 4, 34.8000, 14, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (73, N'Röd Kaviar', 8, 15.0000, 101, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (74, N'Longlife Tofu', 7, 10.0000, 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (75, N'Rhönbräu Klosterbier', 1, 7.7500, 125, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (76, N'Lakkalikööri', 1, 18.0000, 57, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [Discontinued]) VALUES (77, N'Original Frankfurter grüne Soße', 2, 13.0000, 32, 0)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Discount]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsInStock]
GO

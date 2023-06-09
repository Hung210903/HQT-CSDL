USE [QLBanHang]
GO
/****** Object:  Table [dbo].[Hangsx]    Script Date: 29/03/2023 10:06:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hangsx](
	[mahangsx] [nchar](10) NOT NULL,
	[tenhang] [nvarchar](20) NULL,
	[diachi] [nvarchar](30) NULL,
	[sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[mahangsx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 29/03/2023 10:06:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[manv] [nchar](10) NOT NULL,
	[tennv] [nvarchar](20) NULL,
	[gioitinh] [nchar](10) NULL,
	[diachi] [nvarchar](30) NULL,
	[sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[phong] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhap]    Script Date: 29/03/2023 10:06:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhap](
	[sohdn] [nchar](10) NULL,
	[masp] [nchar](10) NULL,
	[manv] [nchar](10) NULL,
	[ngaynhap] [date] NULL,
	[soluongN] [int] NULL,
	[dongiaN] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 29/03/2023 10:06:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[masp] [nchar](10) NOT NULL,
	[mahangsx] [nchar](10) NULL,
	[tensp] [nvarchar](20) NULL,
	[soluong] [int] NULL,
	[mausac] [nvarchar](20) NULL,
	[giaban] [money] NULL,
	[donvitinh] [nchar](10) NULL,
	[mota] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xuat]    Script Date: 29/03/2023 10:06:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xuat](
	[sohdx] [nchar](10) NOT NULL,
	[masp] [nchar](10) NULL,
	[manv] [nchar](10) NULL,
	[ngayxuat] [date] NULL,
	[soluongX] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sohdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD  CONSTRAINT [FK_Nhap_Nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[Nhanvien] ([manv])
GO
ALTER TABLE [dbo].[Nhap] CHECK CONSTRAINT [FK_Nhap_Nhanvien]
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD  CONSTRAINT [FK_Nhap_Sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[Sanpham] ([masp])
GO
ALTER TABLE [dbo].[Nhap] CHECK CONSTRAINT [FK_Nhap_Sanpham]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Hangsx] FOREIGN KEY([mahangsx])
REFERENCES [dbo].[Hangsx] ([mahangsx])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Hangsx]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD FOREIGN KEY([manv])
REFERENCES [dbo].[Nhanvien] ([manv])
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD FOREIGN KEY([masp])
REFERENCES [dbo].[Sanpham] ([masp])
GO

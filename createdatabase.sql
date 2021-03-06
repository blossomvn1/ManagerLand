USE [master]
GO
/****** Object:  Database [QLNHADAT]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE DATABASE [QLNHADAT]
 CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'QLNHADAT', FILENAME = N'C:\Program Files\Microsoft SQL Server\Developer\MSSQL15.MSSQLSERVER01\MSSQL\DATA\QLNHADAT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'QLNHADAT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\Developer\MSSQL15.MSSQLSERVER01\MSSQL\DATA\QLNHADAT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
--GO
ALTER DATABASE [QLNHADAT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNHADAT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNHADAT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNHADAT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNHADAT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNHADAT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNHADAT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNHADAT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNHADAT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNHADAT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHADAT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNHADAT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNHADAT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNHADAT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNHADAT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNHADAT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNHADAT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNHADAT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNHADAT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNHADAT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNHADAT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNHADAT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNHADAT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNHADAT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNHADAT] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNHADAT] SET  MULTI_USER 
GO
ALTER DATABASE [QLNHADAT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNHADAT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNHADAT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNHADAT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNHADAT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNHADAT', N'ON'
GO
ALTER DATABASE [QLNHADAT] SET QUERY_STORE = OFF
GO
USE [QLNHADAT]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[typeAcc] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHINHANH]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHINHANH](
	[IDCNHANH] [varchar](10) NOT NULL,
	[DTCNHANH] [varchar](10) NULL,
	[FAXCNHANH] [varchar](10) NULL,
	[DUONGCNHANH] [varchar](50) NULL,
	[QUANCNHANH] [varchar](50) NULL,
	[TPCNHANH] [varchar](50) NULL,
	[KHUVUCCNHANH] [varchar](50) NULL,
 CONSTRAINT [PK_CHINHANH] PRIMARY KEY NONCLUSTERED 
(
	[IDCNHANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUNHA]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUNHA](
	[IDCNHA] [varchar](10) NOT NULL,
	[TENCNHA] [varchar](50) NULL,
	[DIACHICNHA] [varchar](100) NULL,
	[_DTCNHA_] [varchar](10) NULL,
 CONSTRAINT [PK_CHUNHA] PRIMARY KEY NONCLUSTERED 
(
	[IDCNHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[IDKH] [varchar](10) NOT NULL,
	[IDCNHANH] [varchar](10) NOT NULL,
	[TENKH] [varchar](50) NULL,
	[DIACHIKH] [varchar](100) NULL,
	[DIENTHOAIKH] [varchar](10) NULL,
	[LOAINHA] [varchar](100) NULL,
	[TIEUCHINHA] [varchar](100) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY NONCLUSTERED 
(
	[IDKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAINHA]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINHA](
	[IDLOAINHA] [varchar](10) NOT NULL,
	[TENLOAINHA] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LOAINHA] PRIMARY KEY NONCLUSTERED 
(
	[IDLOAINHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHA]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHA](
	[IDNHA] [varchar](10) NOT NULL,
	[IDCNHA] [varchar](10) NOT NULL,
	[IDCNHANH] [varchar](10) NOT NULL,
	[IDNV] [varchar](10) NOT NULL,
	[IDLOAINHA] [varchar](10) NOT NULL,
	[SOLUONGNHA] [int] NULL,
	[NGAYDANG] [date] NULL,
	[NGAYHETHANG] [date] NULL,
	[TINHTRANG] [bit] NULL,
	[LUOTXEM] [int] NULL,
	[DUONGNHA] [varchar](50) NULL,
	[QUANNHA] [varchar](50) NULL,
	[TPNHA] [varchar](50) NULL,
	[KHUVUCNHA] [varchar](50) NULL,
 CONSTRAINT [PK_NHA] PRIMARY KEY NONCLUSTERED 
(
	[IDNHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHABAN]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHABAN](
	[IDNHA] [varchar](10) NOT NULL,
	[GIABAN] [money] NULL,
	[DIEUKIENCNHA] [varchar](1000) NULL,
 CONSTRAINT [PK_NHABAN] PRIMARY KEY NONCLUSTERED 
(
	[IDNHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[IDNV] [varchar](10) NOT NULL,
	[IDCNHANH] [varchar](10) NOT NULL,
	[TENNV] [varchar](50) NOT NULL,
	[DIENTHOAINV] [char](10) NOT NULL,
	[GIOITINHNV] [varchar](3) NOT NULL,
	[NGAYSINHNV] [date] NOT NULL,
	[LUONGNV] [money] NULL,
	[DIACHINV] [varchar](100) NOT NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY NONCLUSTERED 
(
	[IDNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHATHUE]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHATHUE](
	[IDNHA] [varchar](10) NOT NULL,
	[TIENTHUE] [money] NULL,
 CONSTRAINT [PK_NHATHUE] PRIMARY KEY NONCLUSTERED 
(
	[IDNHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TTDANHGIANHA]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTDANHGIANHA](
	[STT] [bigint] NOT NULL,
	[IDNHANX] [varchar](10) NOT NULL,
	[NGAYNX] [date] NOT NULL,
	[NHANXET] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_TTDANHGIANHA] PRIMARY KEY NONCLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [QUAN_LY_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [QUAN_LY_FK] ON [dbo].[KHACHHANG]
(
	[IDCNHANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CNHANH_QL_NHA_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [CNHANH_QL_NHA_FK] ON [dbo].[NHA]
(
	[IDCNHANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GOM_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [GOM_FK] ON [dbo].[NHA]
(
	[IDLOAINHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PHU_TRACH_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [PHU_TRACH_FK] ON [dbo].[NHA]
(
	[IDNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SO_HUU_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [SO_HUU_FK] ON [dbo].[NHA]
(
	[IDCNHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [LAM_VIEC_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [LAM_VIEC_FK] ON [dbo].[NHANVIEN]
(
	[IDCNHANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [DANHGIANHA_FK]    Script Date: 12/18/2020 3:28:43 PM ******/
CREATE NONCLUSTERED INDEX [DANHGIANHA_FK] ON [dbo].[TTDANHGIANHA]
(
	[IDNHANX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHAN_QUAN_LY_CHINHANH] FOREIGN KEY([IDCNHANH])
REFERENCES [dbo].[CHINHANH] ([IDCNHANH])
GO
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK_KHACHHAN_QUAN_LY_CHINHANH]
GO
ALTER TABLE [dbo].[NHA]  WITH CHECK ADD  CONSTRAINT [FK_NHA_CNHANH_QL_CHINHANH] FOREIGN KEY([IDCNHANH])
REFERENCES [dbo].[CHINHANH] ([IDCNHANH])
GO
ALTER TABLE [dbo].[NHA] CHECK CONSTRAINT [FK_NHA_CNHANH_QL_CHINHANH]
GO
ALTER TABLE [dbo].[NHA]  WITH CHECK ADD  CONSTRAINT [FK_NHA_GOM_LOAINHA] FOREIGN KEY([IDLOAINHA])
REFERENCES [dbo].[LOAINHA] ([IDLOAINHA])
GO
ALTER TABLE [dbo].[NHA] CHECK CONSTRAINT [FK_NHA_GOM_LOAINHA]
GO
ALTER TABLE [dbo].[NHA]  WITH CHECK ADD  CONSTRAINT [FK_NHA_PHU_TRACH_NHANVIEN] FOREIGN KEY([IDNV])
REFERENCES [dbo].[NHANVIEN] ([IDNV])
GO
ALTER TABLE [dbo].[NHA] CHECK CONSTRAINT [FK_NHA_PHU_TRACH_NHANVIEN]
GO
ALTER TABLE [dbo].[NHA]  WITH CHECK ADD  CONSTRAINT [FK_NHA_SO_HUU_CHUNHA] FOREIGN KEY([IDCNHA])
REFERENCES [dbo].[CHUNHA] ([IDCNHA])
GO
ALTER TABLE [dbo].[NHA] CHECK CONSTRAINT [FK_NHA_SO_HUU_CHUNHA]
GO
ALTER TABLE [dbo].[NHABAN]  WITH CHECK ADD  CONSTRAINT [FK_NHABAN_CONBAN_NHA] FOREIGN KEY([IDNHA])
REFERENCES [dbo].[NHA] ([IDNHA])
GO
ALTER TABLE [dbo].[NHABAN] CHECK CONSTRAINT [FK_NHABAN_CONBAN_NHA]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_LAM_VIEC_CHINHANH] FOREIGN KEY([IDCNHANH])
REFERENCES [dbo].[CHINHANH] ([IDCNHANH])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_LAM_VIEC_CHINHANH]
GO
ALTER TABLE [dbo].[NHATHUE]  WITH CHECK ADD  CONSTRAINT [FK_NHATHUE_CONTHUE_NHA] FOREIGN KEY([IDNHA])
REFERENCES [dbo].[NHA] ([IDNHA])
GO
ALTER TABLE [dbo].[NHATHUE] CHECK CONSTRAINT [FK_NHATHUE_CONTHUE_NHA]
GO
ALTER TABLE [dbo].[TTDANHGIANHA]  WITH CHECK ADD  CONSTRAINT [FK_TTDANHGI_DANHGIANH_NHA] FOREIGN KEY([IDNHANX])
REFERENCES [dbo].[NHA] ([IDNHA])
GO
ALTER TABLE [dbo].[TTDANHGIANHA] CHECK CONSTRAINT [FK_TTDANHGI_DANHGIANH_NHA]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddHouseReview]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AddHouseReview] @houseID varchar(10) = NULL, @review varchar(100)= NULL
as
begin
	insert TTDANHGIANHA
	values((select max(tt.STT) from TTDANHGIANHA tt), @houseID, getdate(), @review)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getView]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getView] @houseID  varchar(10) = NULL
as
begin
	SET TRAN ISOLATION LEVEL READ UNCOMMITTED
	select * from NHA where IDNHA = @houseID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ModifyHouseReview]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ModifyHouseReview] @houseID varchar(10) = NULL, @review varchar(100)= NULL
as
begin
	update TTDANHGIANHA
	set NHANXET = @review, NGAYNX = getdate()
	where IDNHANX = @houseID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimNhaChoKhachHang]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_TimNhaChoKhachHang]
	@loaiNha varchar(50) = NULL,
	@gia money = NULL,
	@loaiGia int = NULL, --1 la nho hon hoac bang, 2 la lon hon hoac bang
	@soLuongPhong  int = NULL,
	@duongNha varchar(50) = NULL,
	@quanNha varchar(50) = NULL,
	@tpNha varchar(50) = NULL,
	@khuVucNha varchar(50) = NULL,
	@idChiNhanh varchar(10) = NULL
	
as
begin
	declare @strQuery nvarchar(3900)
	declare @paraList nvarchar(500)
	set @paraList = '
			@gia money,
			@loaiGia int,
			@soLuongPhong int,
			@duongNha varchar(50),
			@quanNha varchar(50),
			@tpNha varchar(50),
			@khuVucNha varchar(50),
			@idChiNhanh varchar(10)'
	--Ket cac bang lai truoc va loc sau
	if(@loaiNha = 'Nha Ban')
	begin
		set @strQuery = N'select n.*, nb.GIABAN, nb.DIEUKIENCNHA
		from NHA n join NHABAN nb on n.IDNHA = nb.IDNHA
		where n.TINHTRANG != 1 and n.NGAYDANG < getdate() and (n.NGAYHETHANG is NULL or n.NGAYHETHANG > getdate())'
		if(@gia != N'')
			if(@loaiGia = 1)
				set @strQuery = @strQuery + ' and nb.GIABAN <= @gia'
			else
				set @strQuery = @strQuery + ' and nb.GIABAN >= @gia'
		if(@soLuongPhong != N'')
			set @strQuery = @strQuery + ' and n.SOLUONGNHA = @soLuongPhong'
		if(@duongNha != N'')
			set @strQuery = @strQuery + ' and n.DUONGNHA = @duongNha'
		if(@quanNha != N'')
			set @strQuery = @strQuery + ' and n.QUANNHA = @quanNha'
		if(@tpNha != N'')
			set @strQuery = @strQuery + ' and n.TPNHA = @tpNha'
		if(@khuVucNha != N'')
			set @strQuery = @strQuery + ' and n.KHUVUCNHA = @khuVucNha'
		if(@idChiNhanh != N'')
			set @strQuery = @strQuery + ' and n.IDCNHANH = @idChinhNhanh'
	end
	else if(@loaiNha = 'Nha Thue')
	begin
		set @strQuery = N'select n.*, nt.TIENTHUE
						from NHA n join NHATHUE nt on n.IDNHA = nt.IDNHA
						where n.TINHTRANG != 1 and n.NGAYDANG < getdate() and (n.NGAYHETHANG is NULL or n.NGAYHETHANG > getdate())'
		if(@gia != N'')
			if(@loaiGia = 1)
				set @strQuery = @strQuery + ' and nb.TIENTHUE <= @gia'
			else
				set @strQuery = @strQuery + ' and nb.TIENTHUE >= @gia'
		if(@soLuongPhong != N'')
			set @strQuery = @strQuery + ' and n.SOLUONGNHA = @soLuongPhong'
		if(@duongNha != N'')
			set @strQuery = @strQuery + ' and n.DUONGNHA = @duongNha'
		if(@quanNha != N'')
			set @strQuery = @strQuery + ' and n.QUANNHA = @quanNha'
		if(@tpNha != N'')
			set @strQuery = @strQuery + ' and n.TPNHA = @tpNha'
		if(@khuVucNha != N'')
			set @strQuery = @strQuery + ' and n.KHUVUCNHA = @khuVucNha'
		if(@idChiNhanh != N'')
			set @strQuery = @strQuery + ' and n.IDCNHANH = @idChinhNhanh'
	end
	else
	begin
		select * from NHA n
		where n.TINHTRANG != 1 and n.NGAYDANG < getdate() 
		and (n.NGAYHETHANG is NULL or n.NGAYHETHANG > getdate())
	end

	exec sp_executesql @strQuery,
		@paraList,
		@gia, --Doi so dua vao phai tuong ung voi paraList
		@loaiGia,
		@soLuongPhong,
		@duongNha,
		@quanNha,
		@tpNha,
		@khuVucNha,
		@idChiNhanh
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateView_2_T1]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_updateView_2_T1] @houseID varchar(10) = NULL, @views int = NULL
as
begin tran
	begin try
		declare @currentViews int
		set @currentViews = (select LUOTXEM from NHA where IDNHA = @houseID)
		update NHA
		set LUOTXEM = @currentViews + @views
		where IDCNHA = @houseID
	
		waitfor delay '00:00:10'
		if(@currentViews > @currentViews + @views)
		begin
			print N'Cập nhật lượt xem bị lỗi!'
			rollback tran
		end
	end try
	
	begin catch
		print N'Lỗi hệ thống!'
		rollback tran
	end catch
commit transaction
GO
/****** Object:  StoredProcedure [dbo].[sp_updateView_ERROR]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_updateView_ERROR] @houseID varchar(10) = NULL, @views int = NULL
as
begin
	declare @currentViews int
	set @currentViews = (select LUOTXEM from NHA where IDNHA = @houseID)

	update NHA
	set LUOTXEM = @currentViews + @views
	where IDCNHA = @houseID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateView_ERROR2]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateView_ERROR2] @houseID varchar(10) = NULL, @views int = NULL
as
begin transaction
	declare @currentViews int
	set @currentViews = (select LUOTXEM from NHA where IDNHA = @houseID)
	
	update NHA
	set LUOTXEM = @currentViews + @views
	where IDCNHA = @houseID

	if @@error != 0
	begin
		print 'Cập nhật lượt xem bị lỗi!'
		rollback tran
	end
commit transaction
GO
/****** Object:  StoredProcedure [dbo].[sp_updateView_T1]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateView_T1] @houseID varchar(10) = NULL, @views int = NULL
as
begin
	declare @currentViews int
	set @currentViews = (select LUOTXEM from NHA where IDNHA = @houseID)
	waitfor delay '00:00:05'
	update NHA
	set LUOTXEM = @currentViews + @views
	where IDCNHA = @houseID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateView_T2]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_updateView_T2] @houseID varchar(10) = NULL, @views int = NULL
as
begin
	declare @currentViews int
	set @currentViews = (select LUOTXEM from NHA where IDNHA = @houseID)

	update NHA
	set LUOTXEM = @currentViews + @views
	where IDCNHA = @houseID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XemYeuCauKhachHang]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_XemYeuCauKhachHang] 
	@idKhachHang varchar(10) = NULL,
	@tenKhachHang varchar(50) = NULL,
	@idChiNhanh varchar(10) = NULL	
as
begin
	declare @strQuery nvarchar(3000) --Đây là chuỗi chứa câu lệnh sql thực thi xem thông tin khách hàng, nó được gọi ở cuối exec sp_executesql
	declare @paraList nvarchar(500)  --Là các argument đưa vào trong cái chuỗi @strQuery để lọc record, nó được thể hiện ở if.

	--Các đối số này tương ứng với các đối số của procedure
	set @paraList = '
		@idKhachHang varchar(10),
		@tenKhachHang varchar(50),    
		@idChiNhanh varchar(10)'
	--Cau lệnh thực thi
	set @strQuery = N'select kh.*
					from KHACHHANG kh
					where (1=1)'
	--Thêm điều kiện nếu tham số đưa vào từ Winform thỏa điều kiện khac rỗng, nếu không nhập gì thì bỏ qua điều kiện
	if(@idKhachHang != N'')
		set @strQuery = @strQuery + ' and kh.IDKH = @idKhachHang'  --Được thêm vào strQuery để thực thi lọc record
	if(@tenKhachHang != N'')
		set @strQuery = @strQuery + ' and kh.TENKH = @tenKhachHang'
	if(@idChiNhanh != N'')
	set @strQuery = @strQuery + ' and kh.IDCNHANH = @idChiNhanh'
	--Thuc thi procedure
	waitfor delay '00:00:30'
	exec sp_executesql
		@strQuery,
		@paraList,
		@idKhachHang,
		@tenKhachHang,
		@idChiNhanh		
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 12/18/2020 3:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN 
	SELECT * FROM dbo.account WHERE username=@userName AND password=@passWord
END 
GO
USE [master]
GO
ALTER DATABASE [QLNHADAT] SET  READ_WRITE 
GO
 

 use QLNHADAT
 select * from NHANVIEN



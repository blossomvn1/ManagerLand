﻿use QLNHADAT
go


--Xem thông tin Khách Hàng yêu cầu. -> một procedure select KHACH HANG.
create procedure sp_TimNhaChoKhachHang
	@loaiNha varchar(50) = NULL,
	@gia money = NULL,
	@loaiGia int = NULL, --1 la nho hon hoac bang, 2 la lon hon hoac bang
	@soLuongPhong  int = NULL,
	@loaiSoLuongPhong int = NULL,
	@ngayDang date = NULL,
	@ngayHetHang date = NULL,
	@duongNha varchar(50) = NULL,
	@quanNha varchar(50) = NULL,
	@tpNha varchar(50) = NULL,
	@khuVucNha varchar(50) = NULL
	
as
begin
	declare @strQuery nvarchar(3900)
	declare @paraList nvarchar(500)
	set @paraList = '
			@gia money,
			@loaiGia int,
			@soLuongPhong int,
			@loaiSoLuongPhong int,
			@ngayDang date,
			@ngayHetHang date,
			@duongNha varchar(50),
			@quanNha varchar(50),
			@tpNha varchar(50),
			@khuVucNha varchar(50)'
	--Ket cac bang lai truoc va loc sau
	if(@loaiNha = 'Nha Ban')
	begin
		set @strQuery = N'select n.*, nb.GIABAN, nb.DIEUKIENCNHA
		from NHA n join NHABAN nb on n.IDNHA = nb.IDNHA
		where 1 = 1 and n.TINHTRANG != 1'
		if(@gia != N'')
			if(@loaiGia = 1)
				set @strQuery = @strQuery + ' and nb.GIABAN <= @gia'
			else
				set @strQuery = @strQuery + ' and nb.GIABAN >= @gia'
		if(@soLuongPhong != N'')
		begin
			if(@loaiSoLuongPhong = 1)
				set @strQuery = @strQuery + ' and n.SOLUONGNHA <= @soLuongPhong'
			else
				set @strQuery = @strQuery + ' and n.SOLUONGNHA >= @soLuongPhong'
		end
		if(@ngayDang != N'')
			set @strQuery = @strQuery + ' and n.NGAYDANG = @ngayDang'
		if(@ngayHetHang != N'')
			set @strQuery = @strQuery + ' and n.NGAYHETHANG = @ngayHetHang'
		if(@duongNha != N'')
			set @strQuery = @strQuery + ' and n.DUONGNHA = @duongNha'
		if(@quanNha != N'')
			set @strQuery = @strQuery + ' and n.QUANNHA = @quanNha'
		if(@tpNha != N'')
			set @strQuery = @strQuery + ' and n.TPNHA = @tpNha'
		if(@khuVucNha != N'')
			set @strQuery = @strQuery + ' and n.KHUVUCNHA = @khuVucNha'
	end
	else if(@loaiNha = 'Nha Thue')
	begin
		set @strQuery = N'select n.*, nt.TIENTHUE
						from NHA n join NHATHUE nt on n.IDNHA = nt.IDNHA
						where 1 = 1 and n.TINHTRANG != 1'
		if(@gia != N'')
			if(@loaiGia = 1)
				set @strQuery = @strQuery + ' and nb.TIENTHUE <= @gia'
			else
				set @strQuery = @strQuery + ' and nb.TIENTHUE >= @gia'
		if(@soLuongPhong != N'')
		begin
			if(@loaiSoLuongPhong = 1)
				set @strQuery = @strQuery + ' and n.SOLUONGNHA <= @soLuongPhong'
			else
				set @strQuery = @strQuery + ' and n.SOLUONGNHA >= @soLuongPhong'
		end
		if(@ngayDang != N'')
			set @strQuery = @strQuery + ' and n.NGAYDANG = @ngayDang'
		if(@ngayHetHang != N'')
			set @strQuery = @strQuery + ' and n.NGAYHETHANG = @ngayHetHang'
		if(@duongNha != N'')
			set @strQuery = @strQuery + ' and n.DUONGNHA = @duongNha'
		if(@quanNha != N'')
			set @strQuery = @strQuery + ' and n.QUANNHA = @quanNha'
		if(@tpNha != N'')
			set @strQuery = @strQuery + ' and n.TPNHA = @tpNha'
		if(@khuVucNha != N'')
			set @strQuery = @strQuery + ' and n.KHUVUCNHA = @khuVucNha'
	end

	exec sp_executesql @strQuery,
		@paraList,
		@gia, --Doi so dua vao phai tuong ung voi paraList
		@loaiGia,
		@soLuongPhong,
		@loaiSoLuongPhong,
		@ngayDang,
		@ngayHetHang,
		@duongNha,
		@quanNha,
		@tpNha,
		@khuVucNha
end
go

exec sp_TimNhaChoKhachHang 'Nha Ban', 100000, 2, 5, 2
go

--procedure xem yeu cau cau khach hang
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
	exec sp_executesql
		@strQuery,
		@paraList,
		@idKhachHang,
		@tenKhachHang,
		@idChiNhanh		
end
GO

--Nhap liệu
--Chi nhánh -> CHủ nhà, loại nhà, -> Nhân viên -> Nhà -> Nhà thuê, Nhà bán, khách hàng, Thông tin đánh giá
--[CHINHANH](
--	[IDCNHANH] [varchar](10) NOT NULL,
--	[DTCNHANH] [varchar](10) NULL,
--	[FAXCNHANH] [varchar](10) NULL,
--	[DUONGCNHANH] [varchar](50) NULL,
--	[QUANCNHANH] [varchar](50) NULL,
--	[TPCNHANH] [varchar](50) NULL,
--	[KHUVUCCNHANH] [varchar](50) NULL)

insert CHINHANH
values('1', '0123456789', '0123456789', '56 Nguyen Dinh Chieu', 'Quan 7', 'Ho Chi Minh', 'Dong Nam Bo'),
('2', '0123456788', '0123456788', '56 Xa Lo Ha Noi', 'Quan Nam Tu Liem', 'Ha Noi', 'Dong Bac Bo')
go



--[CHUNHA](
--	[IDCNHA] [varchar](10) NOT NULL,
--	[TENCNHA] [varchar](50) NULL,
--	[DIACHICNHA] [varchar](100) NULL,
--	[_DTCNHA_] [varchar](10) NULL,

insert CHUNHA
values('1', 'Nguyen Van A', '12 Ngo Quyen, Quan 6, Tp HCM', '0987654321'),
('2', 'Nguyen Van B', '22 Vo Thi Sau, Quan 12, Tp HCM', '0987654322'),
('3', 'Nguyen Van C', '19 Hung vuong, Quan Cau Giay, Tp Ha Noi', '0987654323'),
('4', 'Nguyen Van D', '45 An Duong Vuong, Quan Dong Da, Tp Ha Noi', '0987654324')

--[LOAINHA](
--	[IDLOAINHA] [varchar](10) NOT NULL,
--	[TENLOAINHA] [varchar](50) NOT NULL,
insert LOAINHA
values('0', 'Nha Ban'),
('1', 'Nha Thue')
go
--[NHANVIEN](
--	[IDNV] [varchar](10) NOT NULL,
--	[IDCNHANH] [varchar](10) NOT NULL,
--	[TENNV] [varchar](50) NOT NULL,
--	[DIENTHOAINV] [char](10) NOT NULL,
--	[GIOITINHNV] [varchar](3) NOT NULL,
--	[NGAYSINHNV] [datetime] NOT NULL,
--	[LUONGNV] [money] NULL,
--	[DIACHINV] [varchar](100) NOT NULL,

insert NHANVIEN
values('1', '1', 'Pham Thi A', '1234567890', 'Nu', '1999-02-23', 500, 'thon Xuan An, xa Tinh Hoa, Tp Quang Ngai, tinh Quang Ngai'),
('2', '1', 'Luong Cong Tu', '1234567891', 'Nam', '1996-06-15', 400, '90 Ton That Thuyet, Quan 4, Tp Ho Chi Minh'),
('3', '2', 'Pham Thi C', '1234567892', 'Nu', '1994-10-23', 550, '78 Tan Ki, Nam Tu Liem, Tp Ha Noi')
go
--[NHA](
--	[IDNHA] [varchar](10) NOT NULL,
--	[IDCNHA] [varchar](10) NOT NULL,
--	[IDCNHANH] [varchar](10) NOT NULL,
--	[IDNV] [varchar](10) NOT NULL,
--	[IDLOAINHA] [varchar](10) NOT NULL, 0 la ban, 1 la cho thue
--	[SOLUONGNHA] [int] NULL,
--	[NGAYDANG] [date] NULL,
--	[NGAYHETHANG] [date] NULL,
--	[TINHTRANG] [varchar](10) NULL, 0 la chua thue ban, 1 la da thue ban
--	[LUOTXEM] [int] NULL,
--	[DUONGNHA] [varchar](50) NULL,
--	[QUANNHA] [varchar](50) NULL,
--	[TPNHA] [varchar](50) NULL,
--	[KHUVUCNHA] [varchar](50) NULL,
insert NHA
--Nha o Tp HCM 1
values('1', '1', '1', '1', '0', '4', '2019-01-01', NULL, '1', '10', '34 Nguyen Hue', 'Quan 4', 'Tp Ho Chi Minh', 'Dong Nam Bo'),
	  ('2', '1', '1', '1', '0', '3', '2019-01-01', NULL, '1', '2', '200 Nguyen Luong Bang', 'Quan 7', 'Tp Ho Chi Minh', 'Dong Nam Bo'),
	  ('3', '1', '1', '1', '1', '2', '2019-02-28', '2021-02-01', '0', '10', '58 Nguyen Van Linh', 'Quan 7', 'Tp Ho Chi Minh', 'Dong Nam Bo'),
	  ('4', '2', '1', '2', '1', '1', '2019-03-01', NULL, '0', '100', '34 Pham Van Dong', 'Quan Thu Duc', 'Tp Ho Chi Minh', 'Dong Nam Bo'),
--Nha o Ha Noi 2
	  ('5', '3', '2', '3', '0', '5', '2019-02-05', NULL, '0', '30', '34 Hung Vuong', 'Quan Nam Tu Liem', 'Tp Ha Noi', 'Dong Bac Bo'),
	  ('6', '3', '2', '3', '1', '2', '2019-04-01', NULL, '1', '5', '35 Nguyen Hue', 'Quan Nam Tu Liem', 'Tp Ha Noi', 'Dong Bac Bo'),
	  ('7', '4', '2', '3', '0', '4', '2019-01-17', NULL, '0', '50', ' 299 Nguyen Trung Truc', 'Quan Bac Tu Liem', 'Tp Ha Noi', 'Dong Bac Bo')
go
--[NHATHUE](
--	[IDNHA] [varchar](10) NOT NULL,
--	[TIENTHUE] [money] NULL,

insert NHATHUE
values('3', 100),
('4', 50),
('6', 90)
go
--[NHABAN](
--	[IDNHA] [varchar](10) NOT NULL,
--	[GIABAN] [money] NULL,
--	[DIEUKIENCNHA] [varchar](1000) NULL,

insert NHABAN
values('1', 100000, ''),
('2', 500000, ''),
('5', 120000, 'Nguoi mua uu tien phu nu'),
('7', 700000, '')
go
--[KHACHHANG](
--	[IDKH] [varchar](10) NOT NULL,
--	[IDCNHANH] [varchar](10) NOT NULL,
--	[TENKH] [varchar](50) NULL,
--	[DIACHIKH] [varchar](100) NULL,
--	[DIENTHOAIKH] [varchar](10) NULL,
--	[LOAINHA] [varchar](10) NULL,
--	[TIEUCHINHA] [varchar](100) NULL,
go
insert KHACHHANG
values('1', '1', 'Vo Duc An', 'Tp Ho Chi Minh', '0012345678', 'Can mot nha ban', 'Nha tren 3 phong'),
('2', '1', 'Ho Hoai Nam', 'Tp Ho Chi Minh', '0012345679', 'Can mot can de thue', 'Nha tren 2 phong'),
('3', '1', 'Ly Khang', 'Tp Ha Noi', '0012345670', 'Can mot nha ban', '')
go
--[TTDANHGIANHA](
--	[STT] [bigint] NOT NULL,
--	[IDNHANX] [varchar](10) NULL,
--	[NGAYNX] [datetime] NULL,
--	[NHANXET] [varchar](1000) NULL,
insert TTDANHGIANHA
values(1, '5', '2019-05-20', 'Nha qua dat'),
(2, '4', '2019-09-28', 'Nha nho, chat, chi co 1 phong')
go
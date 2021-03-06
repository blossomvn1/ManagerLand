use QLNHADAT
go

--T1
--Thêm 1 nhà vào bảng NHA
alter proc sp_ThemNha 
	@idNha varchar(10),@idChuNha varchar(10),@idChiNhanh varchar(10),@idNhanVien varchar(10),@idLoaiNha varchar(10),@SoLuongNha int,@NgayDang datetime,@NgayHetHan datetime,@TinhTrang varchar(10),@LuotXem bigint,@DuongNha varchar(10),@QuanNha varchar(10),@TPNha varchar(10),@KhuVucNha varchar(10)
as
begin
	begin tran
		insert into NHA values (@idNha,@idChuNha,@idChiNhanh,@idNhanVien,@idLoaiNha,@SoLuongNha,@NgayDang,@NgayHetHan,@TinhTrang,@LuotXem,@DuongNha,@QuanNha,@TPNha,@KhuVucNha)
		waitfor delay '00:00:10'
		if(DATEDIFF(day,@NgayHetHan,@NgayDang) > 0)
		begin
			print N'Ngày hết hạn không được nhỏ hơn ngày đăng'
			rollback tran
		end
	if @@TRANCOUNT > 0
		commit tran
end
go

exec sp_ThemNha "8","1","1","1","1",1,"2019-01-17 00:00:00.000","2019-01-12 00:00:00.000","8",8,"8","8","8","8"
select *
from NHA
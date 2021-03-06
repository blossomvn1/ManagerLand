﻿USE [QLNHADAT]
GO

--T1
alter proc [dbo].[sp_updateView_2_T1] @houseID varchar(10) = NULL, @views int = NULL
as
begin tran
	begin try
		declare @currentViews int
		set @currentViews = (select LUOTXEM from NHA where IDNHA = @houseID)
		update NHA
		set LUOTXEM = @currentViews + @views
		where IDNHA = @houseID
	
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

--cai nay chay truoc
select * from NHA
go
exec sp_updateView_2_T1 '1', -1
go
select * from NHA
go
waitfor delay '00:00:10'
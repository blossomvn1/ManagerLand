
/*SESSION 1*/

SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
--REPEATABLE READ;
BEGIN TRANSACTION;
SELECT *
FROM dbo.NHANVIEN

WAITFOR DELAY '00:00:05.000';
SELECT *
FROM dbo.NHANVIEN
COMMIT TRANSACTION;
/*Session 2*/
BEGIN TRANSACTION;
UPDATE dbo.NHANVIEN
SET GIOITINHNV = 'Nam'
WHERE IDNV=2
COMMIT TRANSACTION;

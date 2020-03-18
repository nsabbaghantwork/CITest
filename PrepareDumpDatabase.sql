DROP DATABASE IF EXISTS CI_DB_Test_Dump;

USE [CI_DB_Test]

DECLARE @SQLStatement VARCHAR(2000) 
SET @SQLStatement = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Backup\CI_DB_Test_' + CONVERT(VARCHAR(8), GETDATE(),112) + convert (varchar(4),DATEPART(HOUR, GETDATE())) + convert ( varchar(4) ,DATEPART(MINUTE, GETDATE())) + convert ( varchar(4) ,DATEPART(SECOND, GETDATE())) +'.bak' 

BACKUP DATABASE [CI_DB_Test] TO  DISK = @SQLStatement


RESTORE DATABASE CI_DB_Test_Dump 
FROM DISK = @SQLStatement
WITH
MOVE 'CI_DB_Test' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CI_DB_Test_Dump.mdf',
MOVE 'CI_DB_Test_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CI_DB_Test_Dump_log.ldf'
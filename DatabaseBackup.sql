USE [CI_DB_Test]

DECLARE @SQLStatement VARCHAR(2000) 
SET @SQLStatement = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Backup\CI_DB_Test_Immediate_' + CONVERT(VARCHAR(8), GETDATE(),112) + convert (varchar(4),DATEPART(HOUR, GETDATE())) + convert ( varchar(4) ,DATEPART(MINUTE, GETDATE())) + convert ( varchar(4) ,DATEPART(SECOND, GETDATE())) +'.bak' 
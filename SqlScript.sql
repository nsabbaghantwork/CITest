USE [Test_Table]
BACKUP DATABASE [Test_Table] TO  DISK = N'C:\BACKUP\backup.bak'

INSERT INTO [dbo].[Test_Table]
           ([Name])
     VALUES
           ('test1')
GO

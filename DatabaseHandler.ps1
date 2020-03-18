 sqlcmd -S 3.231.141.207\SQLEXPRESS -P P017btkmu1gY57m -U dbuser -i  C:\PrepareTestDatabase.sql -o C:\Deployment_Logs\PrepareDumpDatabase_Out.txt
	
	$file = Get-Content "C:\Deployment_Logs\PrepareTestDatabase_Out.txt"
	$containsBackup = $file | %{$_ -match "BACKUP DATABASE successfully"}
	$containsRestore = $file | %{$_ -match "RESTORE DATABASE successfully"}
	if (($containsBackup -contains $true) -and ($containsRestore -contains $true)) {
		Write-Host "BACKUP & RESTORE SQL Script Success"
		
	} else {
		Write-Host "SQL Script failure"
		throw 'BACKUP or RESTORE failure'
	}
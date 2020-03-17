$SqlScriptPath = "C:\temp\WebApp\CI_Test\SqlScript.sql" 
$TempDeplyomentFolder = "C:\temp\WebApp\CI_Test\StageArtifact.ps1" 

function StopDeployment()
{
   Remove-Item $TempDeplyomentFolder -Recurse
		iisreset /start
		exit
}

if(-Not (Test-Path 'C:\Deployment_Logs'))
{
	md -Path 'C:\Deployment_Logs'
}

if(Test-Path $SqlScriptPath)
{
    sqlcmd -S 3.231.141.207\SQLEXPRESS -P P017btkmu1gY57m -U dbuser -i  C:\temp\WebApp\CI_Test\DatabaseBackup.sql -o C:\Deployment_Logs\DatabaseBackup_Out.txt
	
	$file = Get-Content "C:\Deployment_Logs\DatabaseBackup_Out.txt"
	$containsWord = $file | %{$_ -match "BACKUP DATABASE successfully"}
	if ($containsWord -contains $true) {
		Write-Host "Backup Success"
	} else {
		Write-Host "Backup failure"
		StopDeployment
	}
	
	#Msg 547, Level 16, State 0, Line 7
	sqlcmd -S 3.231.141.207\SQLEXPRESS -P P017btkmu1gY57m -U dbuser -i C:\temp\WebApp\CI_Test\SqlScript.sql -o C:\Deployment_Logs\SqlScript_Out.txt 
	
	$file = Get-Content "C:\Deployment_Logs\SqlScript_Out.txt"
	$containsMsg = $file | %{$_ -match "Msg"}
	$containsLevel = $file | %{$_ -match "Level"}
	$containsState = $file | %{$_ -match "State"}
	if (($containsMsg -contains $true) -and ($containsLevel -contains $true) -and ($containsState -contains $true)) {
		Write-Host "SQL Script failure"
		StopDeployment
	} else {
		Write-Host "SQL Script Success"
	}
}
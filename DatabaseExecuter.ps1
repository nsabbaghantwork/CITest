$target = "C:\temp\WebApp\CI_Test\SqlScript.sql" 
if(Test-Path $target)
{
    sqlcmd -S 3.231.141.207\SQLEXPRESS –U dbuser -P P017btkmu1gY57m -i C:\temp\WebApp\CI_Test\SqlScript.sql -o SqlScriptOut.txt 
}

#01. Stopping Teams service, if necessary.

$Process = Get-Process | Where name -EQ "Teams"

ForEach ($App in $Process) {

    Stop-Process $App -Force

}


#02. Editing the variable "disableGpu"

[String]$FilePath = ($env:USERPROFILE + "\AppData\Roaming\Microsoft\Teams\desktop-config.json")
[String]$FileContent = (Get-Content $FilePath)


$Modification = $FileContent -replace ("`"disableGpu`":false", "`"disableGpu`":true")  

$Modification > $FilePath


#03. Remove Cache files from MS Teams.


[String]$CachePath = "\AppData\Roaming\Microsoft\Teams\Cache"

[String]$CompletePath = ($env:USERPROFILE + $CachePath)

Set-Location ($CompletePath)

Get-ChildItem | ForEach-Object {

   Remove-Item $PSItem -Force

}

ipconfig /flushdns


# 04. Removing Variables.

<#
Remove-Variable $CompletePath
Remove-Variable $CachePath
Remove-Variable $Modification
Remove-Variable $FileContent
Remove-Variable $FilePath
Remove-Variable $Process
#>
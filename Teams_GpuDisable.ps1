
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

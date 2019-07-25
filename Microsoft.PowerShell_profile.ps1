# To create a Junction Point for the Powershell Profile dir:
# mklink /J "C:\Users\Jonathan\src" "C:\Users\Jonathan\Documents\WindowsPowerShell"

<#
Function Prompt
{
    "" + (Get-Location) + "`n>"
}
#>
Function admin
{
    if ($args.Count -gt 0)
    {   
       $argList = "& '" + $args + "'"
       Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
    }
    else
    {
       Start-Process "$psHome\powershell.exe" -Verb runAs
    }
}

Function quit {
	Invoke-Expression "exit"
}

Function Update-Apps {
    puppet apply C:\users\Jonat\src\bootstrap-windows\installs.pp
}

Function src {Set-Location -Path ~\src}
Function eio {Set-Location -Path ~\Exercism}

Function path {($env:Path).Replace(';',"`n")}

Function Purge-File ($sourceFile, $string) {
    Get-Content $sourceFile | Where-Object {$_ -notmatch "$string"} | Set-Content out.txt
    Copy-Item out.txt $sourceFile
    Remove-Item -Path out.txt
}

Function pupdate {
    Set-Location ~\src\bootstrap-windows
    puppet apply .\installs.pp
    Pause
}

# $Shell = $Host.UI.RawUI
New-Item alias:np -value "C:\Program Files\Notepad++\notepad++.exe" | Out-Null
New-Item alias:google -value "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" | Out-Null
Set-Alias q quit


# Clear-Host


Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

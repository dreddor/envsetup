# Make powershell terminal behave like default bash
Set-PSReadLineOption -EditMode Emacs

# Use WSL vi to edit items in powershell.
function vi ($File){
    $File = $File -replace "\\", "/"
    $File = $File -replace "^C:", "/mnt/c"
    bash -c "vi $File"
}

Function makefast {
    Set-MpPreference -DisableRealtimeMonitoring $true
}

Function makeslow {
    Set-MpPreference -DisableRealtimeMonitoring $false
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

New-Alias which Get-Command

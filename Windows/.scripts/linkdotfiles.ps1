param([switch]$Elevated)

function checkAdmin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((checkAdmin) -eq $false) {
    if (! $Elevated) {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

if ((Get-Item $PSScriptRoot).Target) {
    $ScriptDir = (Get-Item $PSScriptRoot).Target
}
else {
    $ScriptDir = $PSScriptRoot
}

Push-Location "$ScriptDir"
if ($?) {
    $DotfilesDir = (git.exe rev-parse --show-toplevel) -creplace '/', '\'
    Pop-Location
}

if (! $DotfilesDir) {
    exit
}

# .scripts
foreach ($file in Get-ChildItem "$DotfilesDir\Windows\.scripts") {
    New-Item -ItemType SymbolicLink -Path "$HOME\.scripts\$file" -Target "$DotfilesDir\Windows\.scripts\$file" -Force
}

# bash
New-Item -ItemType SymbolicLink -Path "$HOME\.aliases" -Target "$DotfilesDir\.aliases" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.bash_profile" -Target "$DotfilesDir\.bash_profile" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.bashrc" -Target "$DotfilesDir\.bashrc" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.envvars" -Target "$DotfilesDir\.envvars" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.profile" -Target "$DotfilesDir\.profile" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.osrc" -Target "$DotfilesDir\Windows\bash\.osrc" -Force

# git
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$DotfilesDir\.config\git\config" -Force

# nano
New-Item -ItemType SymbolicLink -Path "$HOME\.nanorc" -Target "$DotfilesDir\.config\nano\nanorc" -Force

# neofetch
New-Item -ItemType SymbolicLink -Path "$HOME\.config\neofetch\config.conf" -Target "$DotfilesDir\.config\neofetch\config.conf" -Force

# neovide
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Roaming\neovide\config.toml" -Target "$DotfilesDir\.config\neovide\config.toml" -Force

# neovim
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Local\nvim\init.lua" -Target "$DotfilesDir\.config\nvim\init.lua" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Local\nvim\lua\config" -Target "$DotfilesDir\.config\nvim\lua\config" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Local\nvim\lua\plugins" -Target "$DotfilesDir\.config\nvim\lua\plugins" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.config\nvim\init.lua" -Target "$DotfilesDir\.config\nvim\init.lua" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.config\nvim\lua\config" -Target "$DotfilesDir\.config\nvim\lua\config" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.config\nvim\lua\plugins" -Target "$DotfilesDir\.config\nvim\lua\plugins" -Force

# powershell
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Target "$DotfilesDir\Windows\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$DotfilesDir\Windows\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell\Microsoft.VSCode_profile.ps1" -Target "$DotfilesDir\Windows\PowerShell\Microsoft.PowerShell_profile.ps1" -Force

# readline
New-Item -ItemType SymbolicLink -Path "$HOME\.config\readline\inputrc" -Target "$DotfilesDir\.config\readline\inputrc" -Force

# oh-my-posh
New-Item -ItemType SymbolicLink -Path "$HOME\.config\oh-my-posh.json" -Target "$DotfilesDir\.config\oh-my-posh.json" -Force

# topgrade
New-Item -ItemType SymbolicLink -Path "$HOME\Appdata\Roaming\topgrade.toml" -Target "$DotfilesDir\.config\topgrade.toml" -Force

# vscode
New-Item -ItemType SymbolicLink -Path "$HOME\Appdata\Roaming\Code\User\keybindings.json" -Target "$DotfilesDir\.config\Code\User\keybindings.json" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\Appdata\Roaming\Code\User\settings.json" -Target "$DotfilesDir\.config\Code\User\settings.json" -Force

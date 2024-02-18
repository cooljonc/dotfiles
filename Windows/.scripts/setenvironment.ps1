## Edit 'User' Path:
$UserPath = "$([System.Environment]::GetEnvironmentVariable('Path', 'User'))"

# Add ~\.localscripts to 'User' Path
if (($UserPath -like "*$HOME\.localscripts;*") -eq $false) {
    $UserPath += "$HOME\.localscripts;"
}

# Add ~\.scripts to 'User' Path
if (($UserPath -like "*$HOME\.scripts;*") -eq $false) {
    $UserPath += "$HOME\.scripts;"
}

[System.Environment]::SetEnvironmentVariable('Path', "$UserPath", 'User')
##

## Set and/or modify other 'User' environment variables:

# Set common user-preference env-vars
[System.Environment]::SetEnvironmentVariable('EDITOR', 'nvim', 'User')

# Set util-specific data/config/cache/... location env-vars
# - (less)
[System.Environment]::SetEnvironmentVariable('LESSHISTFILE', '-', 'User')
# - (powershell)
[System.Environment]::SetEnvironmentVariable('POWERSHELL_UPDATECHECK', 'Off', 'User')
# - (readline)
[System.Environment]::SetEnvironmentVariable('INPUTRC', "$HOME/.config/readline/inputrc", 'User')

# Set util-specific application-configuration env-vars
# - (less)
[System.Environment]::SetEnvironmentVariable('LESS', '-R --tabs=4', 'User')

##

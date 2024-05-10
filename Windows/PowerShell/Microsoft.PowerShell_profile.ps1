# PowerShell profile (Microsoft.PowerShell_profile.ps1)

# Set aliases
function la { Invoke-Expression "Get-ChildItem -Attributes !H,H $args" }
function ll { Invoke-Expression "Get-ChildItem -Attributes !H,H $args" }
function l. { Invoke-Expression "Get-ChildItem -Attributes H $args" }
New-Alias vim neovide
New-Alias nvim neovide

# Set Tab completion behaviour
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# Disable predictive intellisense
try {
    Set-PSReadLineOption -PredictionSource None
}
catch {}

# Set prompt (oh-my-posh)
Invoke-Expression (& oh-my-posh init pwsh --config "$HOME\.config\oh-my-posh.json")

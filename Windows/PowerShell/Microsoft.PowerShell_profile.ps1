# PowerShell profile (Microsoft.PowerShell_profile.ps1)

# Set aliases
New-Alias ll Get-ChildItem
New-Alias vim nvim
New-Alias nvim neovide

# Set aliases with parameters (functions)
Function gitcd {Set-Location "$(git rev-parse --show-toplevel)"}
Function dotfilescd {Set-Location "$(dotfiles.ps1 rev-parse --show-toplevel)"}

# Disable predictive intellisense
try {
    Set-PSReadLineOption -PredictionSource None
}
catch {}

# Set prompt (oh-my-posh)
Invoke-Expression (& oh-my-posh init pwsh --config "$HOME\.config\oh-my-posh.json")

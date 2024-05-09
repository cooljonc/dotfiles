if ((Get-Item $PSCommandPath).Target) {
    $ScriptDir = (Get-Item (Get-Item $PSCommandPath).Target).Directory
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

git.exe --git-dir="$DotfilesDir\.git" --work-tree="$DotfilesDir" $args

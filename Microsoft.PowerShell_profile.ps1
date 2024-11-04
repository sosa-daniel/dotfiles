## Changes last set 2024-11-04
## Edit with `vi $profile`

# Aliases
Set-Alias -Name vi -Value $HOME\nvim-win64\bin\nvim.exe
Set-Alias -Name vim -Value $HOME\nvim-win64\bin\nvim.exe

# Use powershell vi mode
Set-PSReadLineOption -EditMode Vi

# Change auto-completion to emulate a bash-like behaviour where it only does partial completion instead of rotating around all options.
Set-PSReadLineKeyHandler -Chord Tab -Function Complete

# Enable incremental search in Powershell, so you can quickly locate the previous command with Ctrl-r
Set-PSReadLineKeyHandler -Chord Ctrl-r -Function ReverseSearchHistory -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl-r -Function ReverseSearchHistory -ViMode Command

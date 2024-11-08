## Changes last set 2024-11-07
## Edit with `vi $profile`

# Aliases
Remove-Item Alias:ls
function ls { Get-ChildItem -Name}
function lsh { Get-ChildItem }
Set-Alias -Name vi -Value $HOME\nvim-win64\bin\nvim.exe
function view { vi -R $args }
Set-Alias -Name vim -Value vi
Set-Alias -Name grep -Value findstr
filter head {
    param($Count=10)
    if ($script:headcount -lt $Count) {
        $script:headcount++
        $_
    } else {
        rm variable:headcount
        break
    }
}
# Use powershell vi mode
Set-PSReadLineOption -EditMode Vi

# Change auto-completion to emulate a bash-like behaviour where it only does partial completion instead of rotating around all options.
Set-PSReadLineKeyHandler -Chord Tab -Function Complete

# Enable incremental search in Powershell, so you can quickly locate the previous command with Ctrl-r
Set-PSReadLineKeyHandler -Chord Ctrl-r -Function ReverseSearchHistory -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl-r -Function ReverseSearchHistory -ViMode Command

# Delete back one word with <C-W>. This config is necessary after mapping <C-BS> to <C-W> in the
# Windows Terminal settings.json file as follows:
# {
#   "keys": "ctrl+backspace",
#   "command": 
#   {
#     "action": "sendInput",
#     "input": "\u0017"
#   }
# }
Set-PSReadLineKeyHandler -Chord Ctrl-w -Function BackwardDeleteWord

# Replace the input with the previous item in the history (same as UpArrow)
Set-PSReadLineKeyHandler -Chord Ctrl-p -Function PreviousHistory

# Map 'jk' to <Esc>
$j_timer = New-Object System.Diagnostics.Stopwatch

Set-PSReadLineKeyHandler -Key j -ViMode Insert -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("j")
    $j_timer.Restart()
}

Set-PSReadLineKeyHandler -Key k -ViMode Insert -ScriptBlock {
    if (!$j_timer.IsRunning -or $j_timer.ElapsedMilliseconds -gt 1000) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("k")
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor, 1)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor-1)
    }
}

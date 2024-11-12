## Changes last set 2024-11-07
## Edit with `vi $profile`

##############################################################################
# ALIASES AND FUNCTIONS
##############################################################################
# Coreutils from uutils.github.io
Remove-Item Alias:ls
function ls { coreutils ls $args}
Remove-Item Alias:cat
function cat { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils cat $args
    }
    else {
        coreutils cat $args
    }
}
function head { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils head $args
    }
    else {
        coreutils head $args
    }
}
function more { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils more $args
    }
    else {
        coreutils more $args
    }
}
function paste { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils paste $args
    }
    else {
        coreutils paste $args
    }
}
function sleep { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils sleep $args
    }
    else {
        coreutils sleep $args
    }
}
function sort { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils sort $args
    }
    else {
        coreutils sort $args
    }
}
function split { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils split $args
    }
    else {
        coreutils split $args
    }
}
function tail { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils tail $args
    }
    else {
        coreutils tail $args
    }
}
function tr { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils tr $args
    }
    else {
        coreutils tr $args
    }
}
function uniq { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils uniq $args
    }
    else {
        coreutils uniq $args
    }
}
function wc { 
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | coreutils wc $args
    }
    else {
        coreutils wc $args
    }
}
# ripgrep from https://github.com/BurntSushi/ripgrep
function grep {
    $count = @($input).Count
    $input.Reset()
    if ($count) {
        $input | rg.exe --hidden $args
    }
    else {
        rg.exe --hidden $args
    }
}
Set-Alias -Name vi -Value nvim
function view { vi -R $args }
Set-Alias -Name vim -Value vi
Set-Alias -Name grep -Value findstr

##############################################################################
# SHELL SETTINGS
##############################################################################
# Disable the audible Bell
Set-PSReadLineOption -BellStyle None
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

## Changes last set 2024-11-04

#enable vi mode
set -o vi

# Set the Terminal Prompt PS1 variable, resulting in 
# ┌──[Oct/21/2024 6:36 PM]─[username@hostname]─[~]
# └──╼ $ 
# Those are 4 elements (timestamp, username, hostname, and working directory)
# separated with some text strings, adding a bit of color.
# I like breaking out the variable using concatenation to better understand 
# what is going on:

# Begin with a blank PS1 variable
PS1=""

# Start Light green
PS1+="\[\e[1;32m\]"
# First text string
PS1+="┌──["
# End color
PS1+="\[\e[m\]"

# Start Light Blue
PS1+="\[\e[1;34m\]"
# Date and Time
PS1+='\D{%b/%d/%Y %-I:%M %p}'
# End color
PS1+="\[\e[m\]"

# Start Light green
PS1+="\[\e[1;32m\]"
# Another separating text string
PS1+="]─["
# End color
PS1+="\[\e[m\]"

# Username (no color)
PS1+="\u"

# Start Light green
PS1+="\[\e[1;32m\]"
# @ sign between user and host
PS1+="@"
# End color
PS1+="\[\e[m\]"

# Start Light Blue
PS1+="\[\e[1;34m\]"
# Hostname
PS1+="\h"
# End color
PS1+="\[\e[m\]"

# Start Light green
PS1+="\[\e[1;32m\]"
# Another separating text string
PS1+="]─["
# End color
PS1+="\[\e[m\]"

# PWD (no color)
PS1+="\w"

# Start Light green
PS1+="\[\e[1;32m\]"
# Final text
PS1+="]\n└──╼ $"
# End color
PS1+="\[\e[m\]"

PS1+='\[\e[1;32m\] '


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH=/usr/local/bin:/usr/local/Cellar:$PATH

# Set architecture flags to explicitly set 64-bit for compiling.
export ARCHFLAGS="-arch x86_64"

# Python package locale bug fix
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# stolen from http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
export HISTSIZE=1000000
export HISTFILESIZE=100000000

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


##  homebrew

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_AUTO_UPDATE=1

##  docker

export DOCKER_BUILDKIT=1 # or configure in daemon.json
export COMPOSE_DOCKER_CLI_BUILD=1


##  python

# Python disable .pyc
export PYTHONDONTWRITEBYTECODE=1

# pip virtualenv
export PIP_RESPECT_VIRTUALENV=true

# python 3.4+, asyncio dev debug mode
export PYTHONASYNCIODEBUG=1

# python 3.4+, https://docs.python.org/3/using/cmdline.html#envvar-PYTHONTRACEMALLOC
export PYTHONTRACEMALLOC=1

##  formatting

## ! default formatting is stored as $PS1='\h:\W \u\$ ' in /etc/bashrc
## old: blue prompt, light grey text >> \[\e[0m\] for white, \[\e[37m\] for light grey
# PS1="\[\e[34m\]> \D{%H:%M:%S} \h:\W \$\[\e[0m\] "

## Formatting info:
# (incomplete) https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# related: https://askubuntu.com/questions/831971/what-type-of-sequences-are-escape-sequences-starting-with-033

# You must include the entire color code information between the \[  and \] characters. Inside the tag, you must begin with either \033[ or \e[ to indicate to Bash that this is color information. Both \033[ and \e[ do the same thing. \e[ is shorter so might be more convenient to use, but we’ll use \033[ here as it matches what’s used by default. At the end of the tag, you must end with m\ to indicate the end of a color tag.
# Breaking that down, here’s what every color tag will look like. The only difference is the information you add in place of COLOR to define the actual color:
# \[\033[COLORm\]

# Bash allows you to change the color of foreground text, add attributes like “bold” or “underline” to the text, and set a background color.

# values for foreground text:
#     Black:                30
#     Blue:                 34
#     Cyan:                 36
#     Green:                32
#     Purple:               35
#     Red:                  31
#     White:                37
#     Yellow:               33

# or

# Color    Code (0 for normal ANSI color, 1 for light version)
# Black       0;30
# Blue        0;34
# Green       0;32
# Cyan        0;36
# Red         0;31
# Purple      0;35
# Brown       0;33
# Blue        0;34
# Green       0;32
# Cyan        0;36
# Red         0;31
# Purple      0;35
# Brown       0;33

# values for background colors:
#     Black background:     40
#     Blue background:      44
#     Cyan background:      46
#     Green background:     42
#     Purple background:    45
#     Red background:       41
#     White background:     47
#     Yellow background:    43


# You can also specify an attribute for the text. This attribute must be added before the color number,  separated by a semicolon (;). Text with these attributes will look different in different terminal emulators.

# values for text attributes:
#     Normal Text:          0
#     Bold or Light Text:   1 (It depends on the terminal emulator.)
#     Dim Text:             2
#     Underlined Text:      4
#     Blinking Text:        5 (This does not work in most terminal emulators.)
#     Reversed Text:        7 (This inverts the foreground and background colors, so you’ll see black text on a white background if the current text is white text on a black background.)
#     Hidden Text:          8

# TODO: create script to toggle between different formats that's useful for scenarios like SSH
export PS1="> \t \h:\[\033[01;32m\]\W \[\033[1;37m\]\$\[\033[00m\] "

#  The default order & value for CLICOLOR
export CLICOLOR=1
export CLICOLOR_FORCE=1

# ls attribute                  Foreground  Background
# ----------------------------------------------------
# 1-directory                   e           x
# 2-sym_link                    f           x
# 3-socket                      c           x
# 4-pipe                        d           x
# 5-executable                  b           x
# 6-block_special               e           g
# 7-char_special                e           d
# 8-exe_setuid                  a           b
# 9-exe_setgid                  a           g
# a-dir_writeothers_sticky      a           c
# b-dir_writeothers_NOsticky    a           d

# code  color
# ----------------------------------------------------
# a     Black
# b     Red
# c     Green
# d     Brown
# e     Blue
# f     Magenta
# g     Cyan
# h     Light grey
# A     Bold black, usually shows up as dark grey
# B     Bold red
# C     Bold green
# D     Bold brown, usually shows up as yellow
# E     Bold blue
# F     Bold magenta
# G     Bold cyan
# H     Bold light grey; looks like bright white
# x     Default foreground or background
# ----------------------------------------------------

# For BSD variants  1  2  3  4  5  6  7  8  9  10 11
#                   ex fx cx dx bx eg ed ab ag ac ad
# export LSCOLORS=  Gx Fx Cx Dx Bx eg ed ab ag ac ed

# For Linux di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43

export LSCOLORS=Gxhxcxdxgxegfhbxfxacad
export GREP_OPTIONS='--color=auto'


# source .bashrc is exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc;
fi


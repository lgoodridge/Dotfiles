# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Handle forced color prompt
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Force colors for grep
alias grep='egrep --color=always'

# Alert alias for long running commands.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias sudo so it respects other aliases
alias sudo='sudo '

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Get virtualenv prompt info
function virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}
export VIRTUAL_ENV_DISABLE_PROMPT=1
VENV="\$(virtualenv_info)";

# Alias feh backround setter
alias sbg='feh --bg-scale'

# Alias cltmp to clean temp files
cltmp() {
    find -name '*~' -delete
    find -name '\#*\#' -delete
    find -name '.*.sw*' -delete
}

# Alias fix functions
fix_gitignore() {
    git rm -r --cached .
    git add .
}
fix_venv() {
    if [ $# -eq 1 ] && [ "$1" != "-h" ]; then
        gfind $1 -type l -xtype l -delete
        virtualenv $1
    elif [ $# -eq 2 ]; then
        gfind $1 -type l -xtype l -delete
        virtualenv -p $2 $1
    else
        echo "USAGE: fix_venv ~/.virtualenvs/TARGET_VENV [python2]"
    fi
}

# Alias PyPI functions
upload_pypi() {
    python setup.py sdist bdist_wheel
    twine upload dist/* --skip-existing
}
upload_testpypi() {
    python setup.py sdist bdist_wheel
    twine upload --repository-url https://test.pypi.org/legacy/ dist/* --skip-existing
}

# Pretty print JSON
alias prettyjson='python -m json.tool'

# Other helpful aliases
alias please='sudo "$BASH" -c "$(history -p !!)"'
alias spellcheck='aspell -t -c'

# Modify bash prompt
if [ $(id -u) -eq 0 ];
then
  export PS1="\[\e[0;31m\][\@ \u | \W]\[\e[m\] ${VENV}$ "
else
  export PS1="\[\e[0;32m\][\@ \u | \W]\[\e[m\] ${VENV}$ "
fi

# Modify ls prompt
if [ "$(uname)" == "Darwin" ]; then
    export CLICOLOR=1
    export LSCOLORS=gxfxcxdxbxegedabagacad
else
    export LS_COLORS=$LS_COLORS:'di=0;31:ln=0;35:ex=0;31'
fi


# External alias definitions.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Source system specific bash config
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

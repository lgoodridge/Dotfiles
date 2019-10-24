# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# Alias vim with GUI vim in terminal mode
# alias vim='gvim -v'

# Alias cltmp to clean temp files
cltmp() {
    find -name '*~' -delete
    find -name '\#*\#' -delete
    find -name '.*.sw*' -delete
}

# Alias vim notes commands
alias nnew="gvim -c :Note"
# alias nls="ls -c ~/git/Personal-Projects/notes/$*"
ndel() {
    find ~/git/Personal-Projects/notes/ -name "$*.vn" -delete
}
nopen() {
    gvim -c ":Note $*"
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

# Location variables
AWSSERVER='ubuntu@54.218.216.39'
AWSKEY='-i /Users/Lance/.aws/amazon-aws-key.pem'

# SSH aliases
alias sshaws='ssh -X $AWSKEY $AWSSERVER'
alias ssh518='ssh vagrant@10.8.183.105 -p 6666'
alias ssh333='ssh -i ~/.ssh/pgrad_cs_rsa cos333@portal.cs.princeton.edu'
alias ssh318='ssh -X lanceg@labpc-proxy.cs.princeton.edu'
alias ssh126='ssh -i ~/.ssh/pcs_rsa cos126@portal.cs.princeton.edu'
alias sshcycles='ssh -X lanceg@cycles.cs.princeton.edu'
alias sshcslab='ssh -X lanceg@courselab.cs.princeton.edu'
alias sshportal='ssh -X lanceg@portal.cs.princeton.edu'
alias sshdave='ssh -i ~/.ssh/pcs_rsa dave@23.239.12.110'
alias sshmta='ssh mta@mta2.csed.io'
alias sshapi='ssh -i ~/.aws/hireed-api-key.pem ec2-user@ec2-34-224-134-122.compute-1.amazonaws.com'

# SSH alias functions
sshapiworker() {
    ssh -i ~/.aws/hireed-api-key.pem ec2-user@$1
}

# Pretty print JSON
alias prettyjson='python -m json.tool'

# Other helpful aliases
alias please='sudo "$BASH" -c "$(history -p !!)"'
alias spellcheck='aspell -t -c'

# Temporary aliases
alias sshacurate='ssh -i ~/.aws/acurate_key.pem ubuntu@ec2-3-15-98-66.us-east-2.compute.amazonaws.com'
alias sshacuratetest='ssh -i ~/.aws/acurate_key.pem ubuntu@ec2-18-223-129-23.us-east-2.compute.amazonaws.com'

# SCP functions
scpaws() {
    scp $AWSKEY -r $1 ${AWSSERVER}:$2
}
scp318() {
    scp -r $1 lanceg@portal.cs.princeton.edu:/n/fs/csweb/courses/archive/fall18/cos318/lectures/
}
scpfrom333() {
    scp -i ~/.ssh/pgrad_cs_rsa -r cos333@portal.cs.princeton.edu:$1 $2
}
scpto333() {
    scp -i ~/.ssh/pgrad_cs_rsa -r $1 cos333@portal.cs.princeton.edu:$2
}

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


### MAC ONLY SECTION ###

# Setup virtualenv
# source "/usr/local/bin/virtualenvwrapper.sh"
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

# Setup Postgres
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/
# export DATABASE_URL=postgres:///$(whoami)

# Setup Python
# export PYTHONSTARTUP=~/.pythonrc

# Setup Go
# export GOPATH=$HOME/Documents/Go_workpsace

# Setup OCaml
# eval `opam config env`

# Setup ARM Toolchain
# export PATH=$PATH:/usr/local/gcc_arm/gcc-arm-none-eabi-5_4-2016q3/bin/

### FEDORA ONLY SECTION ###

# Helpful aliases
# alias pdfview='evince'

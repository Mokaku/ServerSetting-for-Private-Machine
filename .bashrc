# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples




# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_colored_prompt=yes

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
##    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
else
##    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\[\033[1;37m\][${debian_chroot:+($debian_chroot)}\u@\h:\w]\$\[\033[0m\]  '
##	PS1="\[\033[1;37m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "

fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias ll='ls -al --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'

    alias 2ch_board='~/Tools/w3m-2ch/get_boardList.sh'
    alias 2ch_bookmark='~/Tools/w3m-2ch/get_bookmarks.sh'
    alias 2ch_url='~/Tools/w3m-2ch/get_url.sh'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ "$TERM" = "screen" ]; then
        PROMPT_COMMAND=~/bin/.screen_minidir
        stty start ''
fi

## ssh keepAlive setting
alias ssh='ssh -o ServerAliveInterval=60'


## alias ssh_dti='ssh tobe@182.163.94.14'
alias ssh_dti='ssh tobe@182.163.72.68'


## so-net Ninjaspilits Login

# [ninspi_201.web]
alias ssh_nin201='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.128.22.114'
# [ninspi_202.web]
alias ssh_nin202='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.128.14.50'
# [ninspi_203.web]
alias ssh_nin203='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.128.15.49'
# [ninspi_204.web]
alias ssh_nin204='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.128.26.144'
# [ninspi_205.web]
alias ssh_nin205='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.128.30.49'
# [ninspi_206.web]
alias ssh_nin206='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.46.193'
# [ninspi_207.web]
alias ssh_nin207='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.47.64'
# [ninspi_208.web]
alias ssh_nin208='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.38.4'
# [ninspi_209.web]
alias ssh_nin209='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.49.157'
# [ninspi_210.web]
alias ssh_nin210='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.51.176'
# [ninspi_301.db]
alias ssh_nin301='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.39.63'
# [ninspi_302.db]
alias ssh_nin302='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.45.187'
# [ninspi_303.db]
alias ssh_nin301='ssh -i /home/tobe/.ssh/ninspi_apse-keypair root@10.130.50.175'

### Noah IDCF Login
alias ssh_Noah_test='ssh tobe@210.189.70.107'



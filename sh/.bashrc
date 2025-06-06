# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ...'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTTIMEFORMAT="%Y-%m-%d %T "

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"



#[root@localhost ~]# history
#    1  2022-11-09 09:21:24 history
#[root@localhost ~]#

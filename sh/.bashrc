# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
alias ...='cd ...'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export HISTTIMEFORMAT="%d/%m/%y %T "

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

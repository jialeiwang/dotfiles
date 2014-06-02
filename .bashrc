# ~/.bashrc
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}
function proml {
    local        BLUE="\[\033[0;34m\]"
    # OPTIONAL - if you want to use any of these other colors:
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    local      YELLOW="\[\033[0;33m\]"
    local      PURPLE="\[\033[1;34m\]"
    local     MAGENTA="\[\033[0;35m\]"
    local        TEAL="\[\033[0;36m\]"
    local   DARK_GRAY="\[\033[1;30m\]"
    # END OPTIONAL
    local     DEFAULT="\[\033[0m\]"
    #PS1="$RED[\$(date +%H:%M:%S)] $GREEN\u$DEFAULT@$PURPLE\h$DEFAULT:$TEAL\w$LIGHT_RED\$(parse_git_branch)$DEFAULT \$ "
    PS1="$GREEN\u$DEFAULT$DEFAULT:$TEAL\w$LIGHT_GRAY\$(parse_git_branch)$DEFAULT \$ "
}
proml

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs

# ubuntu
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi

# osx
if [ -f /Users/$USER/Library/Python/2.7/site-packages ]; then
	export PYTHONPATH=$PYTHONPATH:/Users/$USER/Library/Python/2.7/site-packages
fi
if [ -f /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh ]; then
	source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
fi
if [ -f /Users/$USER/bin/virtualenvwrapper.sh ]; then
	source /Users/$USER/bin/virtualenvwrapper.sh
fi

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

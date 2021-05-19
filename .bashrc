if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt Customize
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="[\[\e[0;32m\]\u@\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\]] \[\e[0;33m\]\$(parse_git_branch)\[\e[m\] \n\\$ "

# history にコマンド実行時刻を記録する
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

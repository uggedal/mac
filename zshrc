# vi mode with Ctrl-R:
bindkey -v
bindkey "^R" history-incremental-search-backward

PROMPT='%~ '

# Sane long history (except for cmds beginning with space or dupes):
setopt HIST_IGNORE_SPACE
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Sane man page width:
export MANWIDTH=80

# Sane less with: smart case search, quit if less than one screen, skip
# clearing screen, and display colors:
export LESS=-iFXR
export PAGER=less

# Default editor:
export EDITOR=vim

# Git shorthand aliases:
if command -v git >/dev/null; then
	alias g=git
	alias ga='git add -p'
	alias gc='git ci'
	alias gs='git st'
	alias gd='git diff'
	alias gb='git branch'
	alias gp='git push'
	alias gl='git pull'
fi

# List files in one column, classify file types, print human sizes,
# and use ISO date:
alias ls='ls -1FhD %Y-%m-%d\ %H:%M'

# Brew environment:
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

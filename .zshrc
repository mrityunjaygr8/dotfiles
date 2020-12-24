# Defining key-bindings
# Use the Vim-like keybindings
bindkey -v

# Keybindings for substring search plugin. Maps up and down arrows.
bindkey -M main '^[OA' history-substring-search-up
bindkey -M main '^[OB' history-substring-search-down
bindkey -M main '^[[A' history-substring-search-up
bindkey -M main '^[[B' history-substring-search-up


# Few Exports
# Gray color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# fzf settings. Uses sharkdp/fd for a faster alternative to `find`.
FZF_DEFAULT_COMMAND='fd -L --hidden --exclude .git --exclude .cache . $HOME'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_ALT_C_COMMAND='fd --type d --exclude .git -L . $HOME'

TERM=xterm-256color

# Virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source $HOME/.local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

# GO-Path
export GOPATH=$HOME/go
PATH=$HOME/.gem/ruby/3.7.0/bin:$HOME/bin:$HOME/.poetry/bin:$HOME/.cargo/bin:$PATH

# git-style diff
function gdiff() { diff -u $@ | colordiff | less -R; }

# Creating Aliases
alias ls='ls --color=auto'
alias ll='ls -alt --color=auto'
alias vim='nvim'
alias netstat='ss'
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias wdil='history | grep'
alias scp='rsync --progress -- verbose --partial'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias df='df -h'

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail -f'
alias -g G='| grep'

source ~/.zplug/init.zsh

zplug "woefe/wbase.zsh"
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
zplug "sharkdp/fd", from:gh-r, as:command, rename-to:fd, use:"*x86_64-unknown-linux-gnu.tar.gz"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug load

(cat $HOME/.cache/wal/sequences &)
eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# path
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/Users/jaan/go/bin:$PATH"

# vim mode in commands
bindkey -v
export KEYTIMEOUT=1

# aliases
alias raspi="ssh jaan@192.168.1.56"
alias hetzner="ssh jaan@188.245.214.242"
alias school="cd $HOME/school/2024-2025"
alias remove_downloads="$HOME/scripts/remove_downloads"
alias c="clear"
alias l="ls"
alias vim="nvim"
alias fzf="fzf --preview="bat {}" | xargs -r nvim"
alias code="open $1 -a \"Visual Studio Code\""
alias config="vim $HOME/dotfiles/config/"
alias t="./dotfiles/config/tmux/start.sh"

# yazi shell wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# syntax highlighting in zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


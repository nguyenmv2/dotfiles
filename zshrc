export TERM='xterm-256color'
export KEYTIMEOUT=1
# Do not use autostart, explicitly start/attach session
# https://github.com/syl20bnr/spacemacs/issues/988
ZSH_TMUX_AUTOSTART=false
[[ $TMUX == "" ]] && tmux new-session -A -s sesh

export ZSH=/Users/mynguyen/.oh-my-zsh
ZSH_THEME="dracula"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  bundler
  tmux
  vi-mode
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias evalSSH="eval '$(ssh-agent -s)'; ssh-add ~/.ssh/id_rsa"
alias ag='ag --path-to-ignore ~/.ignore'
alias apptegy='cd ~/workspace/Apptegy'
alias personal='cd ~/workspace/Personal'
alias thrillshare='cd ~/workspace/Apptegy/thrillshare'
alias storinator='cd ~/workspace/Apptegy/storinator-nu'
alias gitsh='gitsh --git $(which hub)'

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/go/bin:$PATH"

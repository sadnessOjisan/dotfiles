# load nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# alias
alias ls="ls -la"

alias gia="git add"
alias gc="git commit"
alias gco="git checkout"

alias vim="nvim"
alias ide="sh ~/.zsh/scripts/tmux.sh"

bindkey -e

# select cursor when comp like fish
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

# load local configure
[ -f ${HOME}/.zsh/.zshrc.local ] && source ${HOME}/.zsh/.zshrc.local

# load plugin
source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# starship
eval "$(starship init zsh)"

# tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    echo start terminal normally
    :  # Start terminal normally
  fi
fi

# peco search
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

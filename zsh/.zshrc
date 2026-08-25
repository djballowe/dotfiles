fastfetch
echo "\033[0;36mWelcome back David"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:go/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# System
alias vim="nvim"
alias sleep="systemctl suspend"
alias shutdown='pkill -SIGTERM brave; shutdown now'
alias reboot='pkill -SIGTERM brave; reboot'
alias tfetch_source='~/Github/tesla-fetch/tfetch'
alias gp_update="git config --global push.autoSetupRemote true"
alias dunst_restart="killall dunst && dunst &"
alias waybar_restart="pkill -SIGUSR2 waybar"
 
# Docker
alias codex="docker compose --env-file ~/code/github/codex-jail/.env run --rm codex"
alias docker_up="sudo docker compose --env-file "$DOCKER_SECRETS_PATH" up -d"
alias docker_down="sudo docker compose --env-file "$DOCKER_SECRETS_PATH" down"
alias docker_pull="sudo docker compose --env-file "$DOCKER_SECRETS_PATH" pull"
alias docker_restart="docker_down && docker_up"
alias docker_update="docker_down && docker_pull && docker_up"

# theme 
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

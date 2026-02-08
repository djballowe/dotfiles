fastfetch
echo "\033[0;36mWelcome back David"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/go/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias tfetch_source='~/Github/tesla-fetch/tfetch'
alias sshmedia="mullvad-exclude ssh -i "$SSH_PATH" -p "$SERVER_SSH_PORT" "$SERVER_USER"@"$SERVER_IP""
alias sftpmedia="mullvad-exclude sftp -i "$SSH_PATH" -P "$SERVER_SSH_PORT" "$SERVER_USER"@"$SERVER_IP""
alias vim="nvim"
alias sleep="systemctl suspend"
alias claude_docker="docker exec -it claude_code /bin/zsh"
alias claude_docker_root="docker exec -u root -it claude_code /bin/zsh"
alias docker_up="sudo docker compose --env-file "$DOCKER_SECRETS_PATH" up -d"
alias docker_down="sudo docker compose --env-file "$DOCKER_SECRETS_PATH" down"
alias docker_restart="sudo docker compose --env-file "$DOCKER_SECRETS_PATH" down && sudo docker compose --env-file "$DOCKER_SECRETS_PATH" up -d"
alias solaar="~/build/Solaar/bin/solaar"
alias gp_update="git config --global push.autoSetupRemote true"

# theme 
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

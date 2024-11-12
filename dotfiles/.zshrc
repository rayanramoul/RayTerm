# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"



plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting z fzf-zsh-plugin poetry )

source $ZSH/oh-my-zsh.sh



# zsh-completions :
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias oldvim="\vim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vi="nvim"
alias v="nvim"
alias oldvi="\vi"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias yz="yazi"
# Git stuff
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gp='git push'
alias gu='git unstage'
alias gco='git checkout'
alias gb='git branch'
alias open='xdg-open 2>/dev/null'
alias please='sudo !!'

# add bpytop as an alias for both top and htop
alias top="bpytop"
alias htop="bpytop"
# ls after every cd command
# Custom cd function to automatically list directory contents
cd() {
    builtin cd "$@" && ls
}

# add bat as an alias for cat
# if bat command is detected alias it to cat, otherwise alias batcat
if command -v bat &> /dev/null
then
    alias cat="bat"
else
    alias batcat="batcat"
fi

# add lsd as an alias for ls
alias ls="lsd"

bindkey -s ^e 'selected_entry=$(find $HOME/Downloads $HOME/Documents -maxdepth 8 -type f -o -type d | fzf --preview "bat --style=numbers --color=always --line-range=:500 {}" --preview-window=right:60%); [ -n "$selected_entry" ] && { [ -d "$selected_entry" ] && cd "$selected_entry" || vim "$selected_entry"; }\n'
# now Ctrl + e will execute ~/scripts/tmux_sessionizer.sh
bindkey -s ^f 'tmux-sessionizer\n'


# FZF THEME
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# >>> conda initialize >>>
eval "$(uv generate-shell-completion zsh)"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Export miniconda3 path
export PATH="$HOME/miniconda3/bin:$PATH"  
source ~/miniconda3/bin/activate base

# Export google-cloud-sdk
export PATH="$HOME/google-cloud-sdk/bin:$PATH"  



# bun completions
[ -s "/home/rayanramoul/.bun/_bun" ] && source "/home/rayanramoul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(starship init zsh)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


eval "$(uv generate-shell-completion zsh)"

_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv

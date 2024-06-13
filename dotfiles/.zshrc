if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"



# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"



plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting z fzf-zsh-plugin poetry )

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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
# replace rm with trash-cli
alias rm="trash-put"

bindkey -s ^e 'selected_entry=$(find $HOME/Downloads $HOME/Documents -maxdepth 8 -type f -o -type d | fzf --preview "bat --style=numbers --color=always --line-range=:500 {}" --preview-window=right:60%); [ -n "$selected_entry" ] && { [ -d "$selected_entry" ] && cd "$selected_entry" || vim "$selected_entry"; }\n'
# now Ctrl + e will execute ~/scripts/tmux_sessionizer.sh
bindkey -s ^f 'tmux-sessionizer\n'





# FZF THEME
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Check if miniforge3 or miniconda3 exists in the $HOME directory and set up the environment accordingly
if [ -d "$HOME/miniforge3" ]; then
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
elif [ -d "$HOME/miniconda3" ]; then
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
else
    echo "Neither miniforge3 nor miniconda3 found in the home directory."
fi




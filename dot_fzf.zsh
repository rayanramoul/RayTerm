# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/r.ramoul/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

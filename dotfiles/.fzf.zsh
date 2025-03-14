# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/r.ramoul/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/r.ramoul/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/Users/r.ramoul/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/Users/r.ramoul/.fzf/shell/key-bindings.zsh"

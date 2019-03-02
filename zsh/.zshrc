# set defaults
export EDITOR=nano

# add .zfunctions
fpath=( "$HOME/.zsh/functions" $fpath )

# add .bin to path
PATH=$PATH:$HOME/.bin

# key bindings
bindkey  "^[[H"    beginning-of-line       # home
bindkey  "^[[F"    end-of-line             # end
bindkey  "^[^[[D"  vi-backward-word        # alt-left
bindkey  "^[^[[C"  vi-forward-word         # alt-right
bindkey  "^[[1;2D" backward-word           # shift-left
bindkey  "^[[1;2C" forward-word            # shift-right
bindkey  "^[[3~"   delete-char             # del
bindkey  "^[^?"    backward-delete-word    # alt-backspace
bindkey  "^[^[[3~" delete-word             # alt-del

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt appendhistory

# completion
fpath=("$HOME/.zsh/zsh-completions" $fpath)
autoload -U compinit; compinit
_comp_options+=(globdots) # include dotfiles in completion
zstyle ':completion:*' menu select


# initialize prompt
export PURE_PROMPT_SYMBOL='$'
autoload -U promptinit; promptinit
prompt pure

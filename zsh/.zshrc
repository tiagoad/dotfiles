# set defaults
export EDITOR=nano

# add .zfunctions
fpath=( "$HOME/.zsh/functions" $fpath )

# add .bin to path
PATH=$PATH:$HOME/.bin

# key bindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# completion


# initialize prompt
export PURE_PROMPT_SYMBOL='$'
autoload -U promptinit; promptinit
prompt pure

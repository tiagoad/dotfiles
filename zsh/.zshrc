# add .zfunctions
fpath=( "$HOME/.zfunctions" $fpath )

# add .bin to path
PATH=$PATH:$HOME/.bin

# initialize prompt
export PURE_PROMPT_SYMBOL='$'

autoload -U promptinit; promptinit
prompt pure

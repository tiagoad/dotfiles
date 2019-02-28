# add .zfunctions
fpath=( "$HOME/.zfunctions" $fpath )

# initialize prompt
export PURE_PROMPT_SYMBOL='$'

autoload -U promptinit; promptinit
prompt pure

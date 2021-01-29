# set defaults
export EDITOR=nano

# set aliases
#alias ls='gls -A --color=auto --group-directories-first'

# add .zfunctions
fpath=( "$HOME/.zsh/functions" $fpath )

# load .zlocal
source ~/.zlocal 2>/dev/null
PATH="$PATH:$HOME/.local/bin/"


# add homebrew completions
fpath=( "/usr/local/share/zsh/site-functions/" $fpath )

# add iterm2 integrations
#source ~/.zsh/iterm2.zsh

# add .bin to path
PATH=$PATH:$HOME/bin

# add yarn bin to path
PATH=$PATH:$HOME/.yarn/bin

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
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.


# completion
fpath=("$HOME/.zsh/zsh-completions" $fpath)
_comp_options+=(globdots) # include dotfiles in completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' completer _complete
autoload -U compinit; compinit

# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# initialize prompt
export PURE_PROMPT_SYMBOL='$'
autoload -U promptinit; promptinit
prompt pure

# colors
export LS_COLORS="$(<~/.zsh/ls_colors)"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"


#!/bin/zsh
#
# Neovim bin
#
export PATH="$PATH:/opt/nvim-linux64/bin"

#
# Browser
#
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

#
# Editors
#
alias vim="nvim"

export EDITOR="${EDITOR:-vim}"
export VISUAL="${EDITOR:-vim}"
export PAGER="${PAGER:-less}"

#
# Paths
#


# No duplicates
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

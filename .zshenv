# This .zshenv is different from zsh/.zshenv.
# This is just entrypoint for zsh.
# This role is only configure to setup .zsh.
# Real env is loaded in zsh/.zshenv.

echo "@load env@"

export ZDOTDIR="$HOME/.zsh"

source $ZDOTDIR/.zshenv
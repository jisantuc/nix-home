source $HOME/.config/fish/secrets.fish
bass source $HOME/.config/fish/use-nix.sh

export PATH="/usr/local/bin:$PATH"
export EDITOR=vi

starship init fish | source

direnv hook fish | source


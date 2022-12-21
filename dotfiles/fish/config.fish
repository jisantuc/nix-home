# someday, but not yet
# source $HOME/.config/fish/secrets.fish

alias show-ip "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"

alias xmllint "xmllint --format"

export PATH="/usr/local/bin:$PATH"

bass source $HOME/.config/fish/use-nix.sh

starship init fish | source

direnv hook fish | source


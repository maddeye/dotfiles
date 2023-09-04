# Fig pre block. Keep at the top of this file.
if [ $(command -v fig) ]; then
  [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM="$HOME/.zsh"

plugins=(
    extract
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ $(command -v keychain) && -e ~/.ssh/id_rsa ]]; then
  eval `keychain --eval --quiet id_rsa`
fi

# Colormap
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="󰀵";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"

# ----------------------------------------------------

alias v="nvim"

if [ $(command -v nvim) ]; then
  export EDITOR=$(which nvim)
  alias vim=$EDITOR
  alias v=$EDITOR
fi


# stow (th stands for target=home)
stowth() {
  stow -vSt ~ $1
}

unstowth() {
  stow -vDt ~ $1
}

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

# source global settings
if [ -f "$HOME/.bash_aliases" ] ; then
  source "$HOME/.bash_aliases"
fi

# source local settings
if [ -f "$HOME/.local/.zshrc" ] ; then
  source "$HOME/.local/.zshrc"
fi

if [ -f "$HOME/.local/.bash_aliases" ] ; then
  source "$HOME/.local/.bash_aliases"
fi




# Docker on mac 
docker-start() {
  # Check if homebrew is installed
  if [ ! command -v brew &> /dev/null ] ; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi 

  # check if minikube is installed 
  if [ ! command -v minikube &> /dev/null ] ; then
    echo "Installing minikube..."
    brew install minikube
  fi 

  if [ ! command -v hyperkit &> /dev/null ] ; then
    echo "Installing hyperkit..."
    brew install hyperkit 
  fi 

  if [ ! command -v docker &> /dev/null ] ; then
    echo "Installing docker..."
    brew install docker docker-compose
  fi

  #Start minikube
  minikube start 

  # Tell Docker CLI to talk to minikube's VM 
  eval $(minikube docker-env)

  # Save IP to a hostname
  echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null
}

docker-stop() {
  minikube stop
}

# Starship
if [ $(command -v starship) ]; then
  eval "$(starship init zsh)"
fi

# Fig post block. Keep at the bottom of this file.
if [ $(command -v fig) ]; then
  [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Neofetch
neofetch --ascii "$HOME/.config/neofetch/ascii.txt"

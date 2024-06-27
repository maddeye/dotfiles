#!/bin/bash
# Ask for administrator password upfront
sudo -v &> /dev/null

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -n  $(find /etc/*-release) ]]; then
  source "$(find /etc/*-release)"
  _distro="$ID"
elif [[ -f $MFILE ]]; then
  _distro="macos"
fi
echo "Found distro $_distro"
echo

case $_distro in
  *ubuntu*)   PMG="apt install -y";;
  *debian*)   PGM="apt install -y";;
  *macos*)    PGM="brew";;
  *)          echo "Not supported system"; exit 1;;
esac

print_space() {
  for i in  $( eval echo {1..$1} ); do 
    echo -n " " 
  done
}

success() { return 0; }
failed() { return 1; }

install() {
  PRG=$1

  sudo $PGM $PRG &> /dev/null
  if [[ $? -ne 0 ]]; then
    STATUS="\e[31mFAILED\e[0m"
    INNER_SPACE=1
  else
    STATUS="\e[32mOK\e[0m"
    INNER_SPACE=3
  fi

  COLS=$(tput cols)
  SPACE=$(expr $COLS - ${#PRG} - 10)
  echo -n "$PRG"
  print_space $SPACE
  echo -n "["
  print_space $INNER_SPACE
  echo -ne "$STATUS"
  print_space $INNER_SPACE
  echo "]"
}

install stow
install gcc
install zsh
install nodejs
install npm
install neovim
install lf
install fzf
install fd
#install neofetch
install atuin

echo "Remember to install fastfetch"

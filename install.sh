#!/bin/bash

# Function to display colored ASCII art
display_ascii_art() {
  echo -e "\e[1;34m"
  echo "---------------------------------------------------------"
  echo " /$$$$$$$                   /$$$$$$$$                              "
  echo "| $$__  $$                 |__  $$__/                              "
  echo "| $$  \\ $$  /$$$$$$  /$$   /$$| $$  /$$$$$$   /$$$$$$  /$$$$$$/$$$$"
  echo "| $$$$$$$/ |____  $$| $$  | $$| $$ /$$__  $$ /$$__  $$| $$_  $$_  $$"
  echo "| $$__  $$  /$$$$$$$| $$  | $$| $$| $$$$$$$$| $$  \\__/| $$ \\ $$ \\ $$"
  echo "| $$  \\ $$ /$$__  $$| $$  | $$| $$| $$_____/| $$      | $$ | $$ | $$"
  echo "| $$  | $$|  $$$$$$$|  $$$$$$$| $$|  $$$$$$$| $$      | $$ | $$ | $$"
  echo "|__/  |__/ \\_______/ \\____  $$|__/ \\_______/|__/      |__/ |__/ |__/"
  echo "                     /$$  | $$                                      "
  echo "                    |  $$$$$$/                                      "
  echo "                     \\______/                                       "
  echo "---------------------------------------------------------"
  echo -e "\e[0m"
}

# Display ASCII art
display_ascii_art

git clone --recursive https://github.com/rayanramoul/RayTerm.git ~/RayTerm
# cd into RayTerm
cd ~/RayTerm

# copy dotfiles from RayTerm/dotfiles to ~
# cp -r dotfiles/.* ~
stow -t $HOME -R dotfiles --override=.*

# reminders on what to install
# test if on archlinux or debian
if [ -f /etc/arch-release ]; then
  # test if yay is installed if not install it
  if ! command -v yay &>/dev/null; then
    echo "yay could not be found"
    echo "Please install yay"
    exit
  fi
  yay -S neovim python-pip bpytop zsh git tmux fzf bat fd ripgrep tldr ulauncher nodejs npm
# check if on debian or ubuntu
elif [ -f /etc/debian_version ]; then
  sudo apt update -y
  sudo apt install python3-pip bpytop zsh git tmux fzf bat fd-find ripgrep tldr ulauncher nodejs npm python3.8 python3.8-venv
  sudo snap install nvim bpytop --classic
fi
# check if conda command is available
if command -v conda &>/dev/null; then
  # install miniconda
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  chmod +x Miniconda3-latest-Linux-x86_64.sh
  bash Miniconda3-latest-Linux-x86_64.sh -p $HOME/miniconda3 -b
fi

# End message
echo "Done! Enjoy your new terminal setup!"

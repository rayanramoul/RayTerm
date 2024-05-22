# This will serve to have a quick minimal setup on any server you have

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
cp -r dotfiles/.* ~

# remove the RayTerm directory
rm -rf ~/RayTerm

# reminders on what to install
sudo apt-get update
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt install python3-pip
pip3 install bpytop

sudo apt-get install -y zsh git tmux fzf bat fd-find ripgrep tldr 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -p $HOME/miniconda3 -b

# End message
echo "Done! Enjoy your new terminal setup!"

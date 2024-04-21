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

git clone https://github.com/rayanramoul/RayTerm.git ~/RayTerm
# cd into RayTerm
cd ~/RayTerm

# copy dotfiles from RayTerm/dotfiles to ~
cp -r dotfiles/.* ~

# remove the RayTerm directory
rm -rf ~/RayTerm

# reminders on what to install
echo "Don't forget to install the following:"
echo "1. zsh"
echo "2. oh-my-zsh"
echo "3. powerlevel10k"
echo "4. tmux"
echo "5. vim"
echo "6. fzf"
echo "7. bat"
echo "8. exa"
echo "9. fd"
echo "10. ripgrep"
echo "11. tldr"
echo "12. bpytop"


# End message
echo "Done! Enjoy your new terminal setup!"

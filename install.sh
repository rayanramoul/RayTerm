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

# Function to display colored messages
display_message() {
  echo -e "\e[1;32m$1\e[0m"
}

# Function to display colored error messages
display_error() {
  echo -e "\e[1;31m$1\e[0m"
}

# Function to display a prompt with color
prompt_user() {
  echo -e "\e[1;33m$1\e[0m"
}

# Check if running on WSL
if uname -a | grep -q Microsoft; then
  display_message "Running on Windows Subsystem for Linux (WSL)"
  WSL_DISTRO=$(lsb_release -si 2>/dev/null)
  case "$WSL_DISTRO" in
    Ubuntu)
      display_message "WSL Distribution: $WSL_DISTRO"
      display_message "Installing Ansible on $WSL_DISTRO..."
      sudo apt update
      sudo apt install -y ansible
      ;;
    *)
      display_error "Unsupported WSL distribution: $WSL_DISTRO"
      exit 1
      ;;
  esac
else
  # Display ASCII art for non-WSL environments
  display_ascii_art

  # Clone the dotfiles repository
  cd ~
  display_message "Cloning dotfiles repository..."
  git clone --recursive https://github.com/rayanramoul/RayTerm.git ~/RayTerm

  # Change into the cloned repository directory
  cd ~/RayTerm

  # Function to install Ansible on different platforms
  install_ansible() {
    case "$1" in
      debian|ubuntu)
        sudo apt update
        sudo apt install -y ansible
        ;;
      centos|rhel|fedora|amazon)
        sudo yum install -y ansible
        ;;
      arch|manjaro)
        sudo pacman -Sy --noconfirm ansible
        ;;
      darwin)
        brew install ansible
        ;;
      *)
        display_error "Unsupported platform: $1"
        exit 1
        ;;
    esac
  }

  # Determine the OS and install Ansible
  OS=$(uname -a)
  if [ -f /etc/os-release ]; then
    source /etc/os-release
    display_message "Installing Ansible on $ID..."
    install_ansible "$ID"
  else
    display_error "Unable to determine Linux distribution."
    exit 1
  fi
fi

# Execute the Ansible playbook
prompt_user "Press Enter to execute the Ansible playbook..."
display_message "Executing Ansible playbook..."
ansible-playbook --ask-become-pass -i ansible/inventory.ini ansible/setup_terminal.yml

display_message "Script execution completed successfully!"


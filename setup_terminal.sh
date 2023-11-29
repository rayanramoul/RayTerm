#!/bin/bash

# Determine OS
OS="$(uname)"
echo "Detected OS: $OS"

# Function to install wget depending on the OS
install_wget() {
  echo "Installing wget..."

  if [ "$OS" = "Darwin" ]; then
    # Install wget using Homebrew on macOS
    if ! command -v brew &> /dev/null; then
      echo "Homebrew not found. Installing Homebrew first..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install wget
  elif [ "$OS" = "Linux" ]; then
    # For Linux, determine if it's Arch, Ubuntu, or Amazon Linux
    if [ -f /etc/arch-release ]; then
      pacman -Sy --noconfirm wget
      pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
      cd .. && rm -rf yay-bin
    else
      # For Ubuntu or Amazon Linux
      if command -v apt &> /dev/null; then
        apt-get update && apt-get install -y wget
      elif command -v yum &> /dev/null; then
        yum install -y wget
      else
        echo "Neither apt nor yum found. Exiting."
        exit 1
      fi
    fi
  else
    echo "Unsupported OS for wget installation."
    exit 1
  fi
}

# Install wget first
install_wget

# Function to get the Python command
get_python_cmd() {
  if command -v python3 &>/dev/null; then
    echo "python3"
  else
    echo "python"
  fi
}

# Installation and configuration steps that are common between Arch Linux, macOS, Ubuntu, and Amazon Linux
install_common_packages() {
  echo "Installing Oh-My-Zsh..."
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

  echo "Downloading and installing Meslo Nerd Font..."
  FONT_PATH="$HOME/.local/share/fonts"
  FONT_NAME="MesloLGS NF Regular.ttf"
  FONT_URL="https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/${FONT_NAME// /%20}"
  mkdir -p "${FONT_PATH}"
  wget -O "${FONT_PATH}/${FONT_NAME}" "${FONT_URL}"

  echo "Installing additional fonts from 'fonts' folder..."
  cp fonts/* "${FONT_PATH}/"


  echo "Configuring Zsh plugins..."
  ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
  git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "${ZSH_CUSTOM}/plugins/zsh-autocomplete"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"

  echo "Downloading .zshrc and .p10k.zsh..."
  # Remove existing config files if they exist
  rm -f ~/.zshrc ~/.p10k.zsh
  wget -O ~/.zshrc https://raw.githubusercontent.com/rayanramoul/RayTerm/master/.zshrc
  wget -O ~/.p10k.zsh https://raw.githubusercontent.com/rayanramoul/RayTerm/master/.p10k.zsh

  echo "Installing Miniconda..."
  # Function to install miniconda
install_miniconda3() {
  # Check if Conda is already installed
  if command -v conda >/dev/null 2>&1;
  then
      echo "${YELLOW} Conda is already installed. ${RESET}"
  else
    echo "${YELLOW} Conda is not installed. Installing... ${RESET}"

    case "$(uname -s)" in
      Linux*)
      # Download and install Miniconda
      wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
      chmod +x Miniconda3-latest-Linux-x86_64.sh
      bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3

      # Initialize Conda for the current shell
      source $HOME/miniconda3/etc/profile.d/conda.sh

      echo "${YELLOW}Initializing Conda for the default shell $(basename $SHELL) ${RESET}"
      # Get the shell's configuration file
      shell_config=""

      case "$(basename $SHELL)" in
          bash) shell_config=~/.bashrc;;
          zsh) shell_config=~/.zshrc;;
          *)   echo "${RED}Shell type $(basename $SHELL) is not supported. Manual initialization may be required.${RESET}";;
      esac

      if [ -n "$shell_config" ]; then
          # Initialize Conda for the restarted shell
          ~/miniconda3/bin/conda init $(basename $SHELL)

      echo  "${YELLOW} Conda has been automatically initialized in your terminal and you should see (base). if not, restart it manually and verify that it's inside your file shell_config.${RESET}"
    fi
    ;;
    *)
      echo "${RED}Miniconda installation with this script is only supported on Linux at the moment.${RESET}"
      ;;
    esac
  fi
}

install_miniconda3

  echo "Installing tmux..."
  if [ "$OS" = "Linux" ]; then
    pacman -S --noconfirm tmux
  elif [ "$OS" = "Darwin" ]; then
    brew install tmux
  fi
  echo "Default keybindings for tmux: 'Ctrl-b' as the prefix key. For example, 'Ctrl-b c' to create a new window."

  echo "Installing fzf..."
  if [ "$OS" = "Linux" ]; then
    pacman -S --noconfirm fzf lazygit
  elif [ "$OS" = "Darwin" ]; then
    brew install fzf
    brew install lazygit
  fi
  echo "Default keybindings for fzf: 'Ctrl-r' for command history search and 'Ctrl-t' for file search."

  echo "Installing Alacritty..."
  if [ "$OS" = "Linux" ]; then
    pacman -S --noconfirm alacritty
  elif [ "$OS" = "Darwin" ]; then
    brew install --cask alacritty
  fi
  echo "Alacritty installed. Configuring..."
  mkdir -p ~/.config/alacritty
  cp alacritty/* ~/.config/alacritty/
}

# Function to install packages on Ubuntu or Amazon Linux
install_packages_ubuntu_amazon() {
  # Determine package manager (apt for Ubuntu, yum for Amazon Linux)
  if command -v apt &> /dev/null; then
      PKG_MANAGER="apt"
      wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.2.3/fastfetch-2.2.3-Linux.deb
      apt install ./fastfetch-2.2.3-Linux.deb
      PKG_INSTALL_CMD="apt-get install -y"
  elif command -v yum &> /dev/null; then
      PKG_MANAGER="yum"
      PKG_INSTALL_CMD="yum install -y"
  else
      echo "Neither apt nor yum found. Exiting."
      exit 1
  fi

  $PKG_INSTALL_CMD neovim zsh tmux fzf lazygit bat exa fd-find ripgrep ansible lsd fastfetch bpytop

  install_common_packages
}

# Install packages depending on OS
if [ "$OS" = "Linux" ]; then
  # Determine if it's Arch, Ubuntu, or Amazon Linux
  if [ -f /etc/arch-release ]; then
    echo "Running setup for Arch Linux..."
    pacman -Sy --noconfirm neovim zsh fzf tmux
    pacman -Sy --noconfirm bpytop lsd fastfetch ansible bat exa fd ripgrep lazygit
    install_common_packages
  else
    echo "Running setup for Ubuntu or Amazon Linux..."
    install_packages_ubuntu_amazon
  fi

elif [ "$OS" = "Darwin" ]; then
  echo "Running setup for macOS..."
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
      echo "Homebrew not found. Installing Homebrew first..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install packages using Homebrew
  brew install neovim zsh tmux fzf lazygit bat exa fd ripgrep ansible lsd fastfetch bpytop
  brew install --cask alacritty

  install_common_packages
else
  echo "Unsupported OS."
  exit 1
fi

# Change the default shell to Zsh
echo "Changing the default shell to Zsh..."
rm ~/.bash_profile
cp .bash_profile ~/.bash_profile

echo "Use the Obsidian theme for your terminal emulator of choice!"

# Final message
echo "Setup complete! Please restart your terminal for all changes to take effect."

echo "Installing debugpy in a dedicated virtualenv..."
mkdir -p "$HOME/.virtualenvs"
cd "$HOME/.virtualenvs"
PYTHON_CMD=$(get_python_cmd)
$PYTHON_CMD -m venv debugpy
$HOME/.virtualenvs/debugpy/bin/python -m pip install debugpy
cd - # Go back to the previous directory


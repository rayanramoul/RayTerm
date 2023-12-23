#!/bin/bash

echo "---------------------------------------------------------"
echo "$$$$$$                      "
echo "$$  __$$\                     "
echo "$$ |  $$ | \$\$\$\$\$\$\\  $$\   $$\\ "
echo "$$$$$$$  | \\____$$\\ $$ |  $$ |"
echo "$$  __$$<  \$\$\$\$\$\$\$ |$$ |  $$ |"
echo "$$ |  $$ |$$  __$$ |$$ |  $$ |"
echo "$$ |  $$ |\\$$$$$$$ |\\$$$$$$$ |"
echo "\__|  \__| \\_______| \\____$$ |"
echo "                    $$\   $$ |"
echo "                    \\$$$$$$  |"
echo "                     \\______/ "
echo "---------------------------------------------------------"
# Clone the dotfiles repository
cd ~
echo "Cloning dotfiles repository..."
git clone https://github.com/rayanramoul/RayTerm.git ~/RayTerm

# Change into the cloned repository directory
cd ~/RayTerm

# Ask the user if they want to install all packages and set up dotfiles

read -p "Do you want to install all packages and set up dotfiles? otherwise setup only dotfiles (y/n): " answer

if [ "$answer" == "y" ]; then
    # Execute the setup_all.sh script
    echo "Executing setup_all.sh..."
    bash setup_all.sh
elif [ "$answer" == "n" ]; then
    # Execute the setup_dotfiles.sh script
    echo "Executing setup_dotfiles.sh..."
    bash setup_dotfiles.sh
else
    echo "Invalid choice. Exiting..."
fi


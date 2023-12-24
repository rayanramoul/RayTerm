# Windows

# Explanation 
GlazeWM Configuration Explanation
General Configuration

    Focus Settings:
        Disable automatically focusing windows underneath the cursor.
        Disable jumping the cursor between windows focused by the WM.
        Toggle workspace when refocusing the current workspace.
        Do not show floating windows as always on top.
        Define the amount to move floating windows when using specific keybindings.
        Disable global window transition animations.

Gaps Configuration

    Set gaps between adjacent windows and windows and the screen edge.

Focus Borders Configuration

    Highlight active windows with a blue border.

Bar Configuration

    Set the bar's height, position, opacity, background, foreground, font family, font size, padding, offset, and border radius.
    Configure components for the left, center, and right sections of the bar.
        Left: Workspaces with specific background and foreground colors.
        Center: Display window titles with green foreground.
        Right: System tray, CPU, GPU, memory, and clock components with specific colors.

Workspaces Configuration

    Define workspace names, display names, and optional settings for each workspace.
    Workspaces 6 to 9 are left empty.

Window Rules Configuration

    Ignore the "ScreenClippingHost" process.
    Set system dialogs as floating by default.

Binding Modes Configuration

    Define a "resize" binding mode for resizing windows using HJKL or arrow keys.

Keybindings Configuration
Window Focus and Movement

    Change focus in a given direction.
    Move the focused window in a given direction.
    Resize focused window by a percentage or pixel amount.
    Enter/escape to return to default keybindings.
    Change tiling direction.
    Change focus between floating/tiling windows.
    Toggle floating for the focused window.
    Toggle maximized state for the focused window.
    Minimize the focused window.
    Close the focused window.
    Safely exit GlazeWM.
    Re-evaluate the configuration file.
    Launch CMD terminal.
    Focus the workspace that last had focus.
    Focus the next/previous workspace.
    Change focus to a specific workspace.
    Move focused workspace to a monitor in a given direction.
    Move the focused window to a specific workspace.
    Close the focused window.

Window Rules

    Move specific applications to predefined workspaces.

Color Palette

    Define a color palette using YAML anchors for various colors used in the configuration.

The GlazeWM configuration provides a detailed setup for window focus, movement, resizing, and workspace management, along with a customizable bar and color palette. Adjustments can be made based on personal preferences and workflows.



# How to 
- Install Wox comme launcher / changer son theme par default / changer le keybding par default a Alt + Espace
- Installer GlazeWM / update la configuration se situant a C:/Users/<USER>/.glaze-wm/config.yaml
- Windows Terminal themes : https://terminalsplash.com/
- Telecharger des fonts patches : https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md
- Lancer les scripts setup de WSL
- Creer un raccourci pour Window Terminal : l'executable se trouve ici : %LocalAppData%\Microsoft\WindowsApps, y aller, creer un shortcut sur le bureau, ouvrir les proprietes du shortcut et y associer le hotkey voulu (par exemple Alt + Entree)
- Se debarasser de la task bar : https://github.com/valinet/ExplorerPatcher/releases


## Setup Alacritty on Windows :
### If using ArchWSL :
wsl --set-default Arch

To use WSL, go to %APPDATA%\alacritty\alacritty.yml, and set to use bash shell:

shell:
 program: "C:\\Windows\\System32\\wsl.exe"


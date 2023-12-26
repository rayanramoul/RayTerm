<div align="center">
    <h1>MacOS</h1>
    <img src="https://github.com/rayanramoul/RayTerm/blob/master/assets/macos_preview.png?raw=true"/>
</div>

# Summary :
- Fetch Script : neoFetch
- Editor : Neovim
- Terminal : Alacritty
- Window Manager : Yabai
- Status Bar : Simple Bar
- Terminal Multiplexer : Tmux
- Hotkeys : Skhd
- Launcher : Raycast
- Fonts : Fira Code, JetBrains Mono, SF Mono, Nerd Fonts
- Color Scheme : Catppuccin Mocha
- Zsh Theme : Powerlevel10k
- Other Terminal Utilities : Bat, Exa, Fzf, Ripgrep, Starship, Tldr, Zoxide, Lsd, LazyGit

Yabai and Skhd Configuration Explanation
Yabai Configuration (yabairc)
## Autostart Applications

    Refresh Uebersicht widgets on startup.
    Load the Yabai configuration on startup.
    Configure Yabai to load the space layout script on dock restart.

## General Settings

    Set various global settings such as mouse behavior, window opacity, split ratio, padding, gaps, layout, and more.
    Configure Yabai to display window borders.

## Space Configuration

    Set up custom spaces with labels for specific use cases, such as Terminal, Browser, Music, Chat, Games, and Meetings.

## Application Rules

    Assign applications to specific spaces based on regular expressions, ensuring that certain applications open in designated spaces.

## Status Bar Configuration

    Set the font for the status bar icons.

# Skhd Configuration
## Window Focus

    Change window focus within a space using keybindings.
        alt - j: Focus south
        alt - k: Focus north
        alt - h: Focus west
        alt - l: Focus east
    Change focus between external displays.
        alt - s: Focus west
        alt - g: Focus east

## Modifying the Layout

    Rotate and flip the layout.
        (Not currently used in the provided configuration)

## Modifying Window Size

    Maximize a window.
        alt - f: Toggle fullscreen
    Balance the tree of windows (resize to occupy the same area).
        shift + alt - e

## Moving Windows Around

    Swap windows in different directions.
        shift + alt - j: Swap with window south
        shift + alt - k: Swap with window north
        shift + alt - h: Swap with window west
        shift + alt - l: Swap with window east
    Move windows and split.
        ctrl + alt - j: Move and split south
        ctrl + alt - k: Move and split north
        ctrl + alt - h: Move and split west
        ctrl + alt - l: Move and split east
    Move windows to display left and right.
        shift + alt - s: Move window to display west
        shift + alt - g: Move window to display east

## Moving Windows Between Spaces

    Move windows to the previous and next space.
        shift + alt - p: Move to previous space
        shift + alt - n: Move to next space
    Move windows to specific spaces.
        shift + alt - 1 to 7: Move to spaces 1 to 7

## Yabai Control

    Stop, start, and restart Yabai.
        shift + alt - q: Stop Yabai
        shift + alt - s: Start Yabai
        shift + alt - r: Restart Yabai
    Focus window to a specific space.
        alt - 1 to 7: Focus spaces 1 to 7
    Assign hotkeys to focus individual spaces and go to the previous one.
        alt - p: Focus previous space

## Other Actions

    Open Alacritty with a specific keybinding.
        alt - return
    Close the focused window.
        shift + alt - q
    Go to the previous space.
        alt - p

These configurations and keybindings provide comprehensive control over window management, space organization, and system actions within the Yabai window manager on macOS. Adjustments can be made to match personal preferences and workflows.


## Essential keybindings 
- Ctrl Left or Ctrl Right : move from a desktop to another
- Ctrl 1 or Ctrl 2 : access window 1 or 2 (to activate the shortcut in mission control in Mac settings)

## Tiling Window Manager :
- twm : https://github.com/koekeishiya/yabai
- shortcuts : https://github.com/koekeishiya/skhd
- status bar : https://github.com/Jean-Tinland/simple-bar


## Interesting Apps
- Resize windows like in Windows : https://rectangleapp.com/
- Keeps not sleepy : https://apps.apple.com/fr/app/amphetamine/id937984704?mt=12
- Test of camera : https://apps.apple.com/us/app/hand-mirror/id1502839586?mt=12
- Better spotlight : https://manual.raycast.com/
- Bind hotkeys : https://apps.apple.com/fr/app/hotkey-app/id975890633?mt=12
- Optimize images sizes : https://imageoptim.com/mac
- Save apps for later to prepare calls/sharing screen : https://getlater.app/
- Download latest versions of apps : https://max.codes/latest/
- Read articles : https://quietreader.app/
- Better Screenshot tool : https://shottr.cc/
- Best terminal for Mac : https://www.warp.dev/
- Setup Terminal : https://youtu.be/ynL1fYncZ1E and https://github.com/zsh-users/zsh-completions and https://fig.io/

# Global Setup :
Global tutorial : https://youtu.be/WJrtA6SKGXU?si=GPBa75eKD6CcQ8qX


## Yabai Install
## Simple :
https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)

### (Optional) if Apple-Silicon :
Run :
sudo nvram boot-args=-arm64e_preview_abi

## Skbhd Install 
https://github.com/koekeishiya/skhd

## Uebersicht Install 
http://tracesof.net/uebersicht/

## Simple Bar install 
https://github.com/Jean-Tinland/simple-bar

## JankyBorders 
https://github.com/FelixKratz/JankyBorders


# Prepare for yabai
System Prefs > Mission Control:
Uncheck - Automatically rearrange
Check - Displays have separate spaces

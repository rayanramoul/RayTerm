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

# How To
- Install [Yabai](https://github.com/koekeishiya/yabai) Tiling Window Manager, follow this [Tutorial](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)) for example. 
- If you are using a Mac with Apple Silicon you will have to run this : sudo nvram boot-args=-arm64e_preview_abi
- Install [SKHD](https://github.com/koekeishiya/skhd) to set Yabai and system keybinds.
- Install [Uebersicht](http://tracesof.net/uebersicht/) this launcher will be helpful to setup the top bar.
- Install [Simple-Bar](https://github.com/Jean-Tinland/simple-bar), then you can configure it by clicking on it then CMD + ,
- Install [Janky-Border](https://github.com/FelixKratz/JankyBorders) this will help to highlight focused windows.
- Goo to System Prefs > Mission Control,
- Uncheck - Automatically rearrange
- Check - Displays have separate spaces
- Install [RayCast](https://www.raycast.com/) app launcher.
- Setup dotfiles, in your terminal launch :
```bash
sh -c "$(wget https://raw.githubusercontent.com/rayanramoul/RayTerm/master/install.sh -O -)"
```
The script will clone this repository and install ansible then prompt you to choose which part of the install you want to run. <br>
If you only want to check the dotfiles you can get them at this link : [Dotfiles](dotfiles) and for example run [Stow](https://www.gnu.org/software/stow/) to symlink your config with the repositories ones :
```bash
git clone https://github.com/rayanramoul/RayTerm/
cd RayTerm
stow -t $HOME -R dotfiles
```
- Now reload yabai and skbhd services
```bash
yabai --restart-service
skhd --restart-service
```


# Other Interesting Apps
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

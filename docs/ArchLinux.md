# ArchLinux
<div align="center">
![RayTerm](https://github.com/rayanramoul/RayTerm/blob/master/assets/arch_preview.png?raw=true)
</div>

This repository is dedicated to reproduce my local ArchLinux setup (starter packages, i3 setup, nvidia drivers, games packages, etc.)

Fetch Script : neoFetch
Editor : Neovim
Terminal : Alacritty
Window Manager : i3wm
Status Bar : i3blocks
Terminal Multiplexer : Tmux
Hotkeys : Managed by i3wm
Launcher : Rofi
Fonts : Fira Code, JetBrains Mono, SF Mono, Nerd Fonts
Color Scheme : Catppuccin Mocha
Zsh Theme : Powerlevel10k
Other Terminal Utilities : Bat, Exa, Fzf, Ripgrep, Starship, Tldr, Zoxide, Lsd, LazyGit
# Summary
- [Quick install of Arch](#quick-install-of-arch)
- [After Installation](#after-installation)
- [NVIDIA Drivers Setup](#nvidia-drivers-setup)
- [Keybinds](#keybinds)
- [Mindmap of the important OS Apps](#mindmap-of-the-important-os-apps)
- [Gaming](#gaming)
- [Diverse Tips](#diverse-tips)


 <div align="center">
  <img src="https://github.com/rayanramoul/BetterLinux/blob/master/preview.png?raw=true" alt="Preevieew"></img>
</div>



Overview

This i3wm (i3 Window Manager) configuration file is designed to create a productive and visually appealing desktop environment. i3wm is a tiling window manager known for its efficiency and minimalism. The configuration incorporates various tools and features to enhance the user experience, including custom workspace assignments, keybindings for common tasks, color schemes, transparency settings, and more.
Tools and Features
### Window Manager Configuration
- Font: FiraCode Nerd Font is set as the font for window titles.
- Modifier Key: The Win key is set as the modifier (Mod1).

### Autostart Applications
- dex is used for XDG autostart.
- xss-lock is employed to lock the screen before suspend.
- nm-applet is started for NetworkManager support.
- Keyboard layout is set using setxkbmap.
- Volume control is configured using keybindings and pactl.
- feh is used to set the wallpaper.
- compton is started for compositor support.
    rofi is configured as the application launcher.





Keybindings Reference

Here is a table summarizing the keybindings in the i3wm configuration:
| Keybinding |	Action |
| ------------- | -------------
| $mod+Return | Open terminal (alacritty) |
| $mod+Shift+q | Kill focused window |
| $mod+space | Open application launcher (rofi) |
| $mod+j/k/l/semicolon | Change focus between windows |
| $mod+Shift+j/k/l/semicolon | Move focused window |
| $mod+h/v | Split in horizontal/vertical orientation |
| $mod+f | Toggle fullscreen for the focused container |
| $mod+s/w/e | Change container layout (stacked, tabbed, toggle split) |
| $mod+Shift+space | Toggle tiling/floating mode |
| $mod+1-0 | Switch to workspaces 1-10 |
| $mod+Shift+1-0 | Move focused container to workspaces 1-10 |
| $mod+r | Enter resize mode |
| $mod+Shift+c | Reload configuration file | 
| $mod+Shift+r | Restart i3 in place |
| $mod+Shift+e | Exit i3 |
| $mod+Shift+X | Lock screen using a custom script |

These keybindings provide efficient control over window management, workspace switching, and system actions within the i3wm environment. The configuration is tailored for a productive and visually pleasing desktop experience.







## Quick install of Arch
When booted in the ArchLinux's USB :
```bash
sudo pacman -S archinstall
archinstall
```

## After Installation
Cloning
```
git clone https://github.com/rayanramoul/BetterLinux
cd BetterLinux
```

Setup of the whole system from scratch
```bash
chmod +x initial_setup.sh
./initial_setup.sh
```

Moving the dotfiles in appropriate directories
```bash
chmod -R +x *.sh
chmod +x ./dotfiles/i3blocks
cd dotfiles
./load_dotfiles.sh
```



## NVIDIA Drivers Setup
### Step 1 - Getting things ready 
1. Firstly update your system
~~~
$ sudo pacman -Syu
~~~
2. Edit your pacman.conf
~~~
$ vim /etc/pacman.conf/
~~~
3. Uncomment VerbosePkgLists and ParallelDownloads = 3
4. You can also add ILoveCandy under the ParallelDownloads for a surprise. You can remove it if you dislike it.
~~~
VerbosePkgLists
ParallelDownloads = 3
ILoveCandy
~~~
6. ALso Uncomment
~~~
[multilib]
Include = /etc/pacman.d/mirrorlist
~~~
7. Update your system again.
~~~
$ sudo pacman -Syu
~~~

### Step 2 - Installing the drivers
1. This step might be a bit confusing. First find your [nvidia card from this list here](https://nouveau.freedesktop.org/CodeNames.html)
2. You can Check what graphic hardware you have by running
~~~
$ lspci -k | grep -A 2 -E "(VGA|3D)"
~~~
4. Check what driver packages you need to install from the list below

| Driver name  | Base driver | OpenGL | OpenGL (multilib) |
| ------------- | ------------- | ------------- |  ------------ | 
| Maxwell (NV110) series and newer  | nvidia | nvidia-utils | lib32-nvidia-utils |
| Kepler (NVE0) series  | nvidia-470xx-dkms  | nvidia-470xx-utils | lib32-nvidia-470xx-utils |
| GeForce 400/500/600 series cards [NVCx and NVDx] | nvidia-390xx  | nvidia-390xx-utils  | lib32-nvidia-390xx-utils |
5. For more info it'll be better to go see the [wiki](https://wiki.archlinux.org/title/NVIDIA)
6. I have a 30-series card that is newer than the Maxwell Series so i'm gonna install the nvidia driver.
7. In Linux we have 5 [kernels](https://wiki.archlinux.org/title/kernel) - Mainline(Linux),linus-lts, linux-hardened, Realtime(linux-rt, linux-rt-lts), linux-zen.
8. I'll choose the mainline linux kernel for now. i will explain how to install other linux kernel on some other day.
9. Nvidia drivers you are gonna install basically depends on which kernel you are using. For example Nvidia for Linux, Nvidia-lts for linus-lts, nvidia-dkms for all other kernels.
10. So now on the main part of installing the drivers. **Have the linux-headers installed as its needed by these packages. linux-headers-lts forlinux-lts**
~~~
$ sudo pacman -S nvidia libglvnd nvidia-utils opencl-nvidia lib32-libglvnd lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings
~~~

## Step 3 - DRM kernel mode setting
1. Edit mkinitcpio.conf
~~~
$ vim /etc/mkinitcpio.conf
~~~
2. Add
   > MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)

3.Replace i915(intel integrated graphics) with amdgpu if you have amd integrated graphics. If you have no integrated graphics just write the nvidia thingies
4. Run the command and see if there are any warnings stating nvidia. There are other warning too. you just have to know which to ignore and which to not.
~~~
$ mkinitcpio -P
~~~
5. Edit the grub file
~~~
$ vim /etc/default/grub
~~~
6. Edit the following line
~~~
GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"
~~~
7. Run the following command
~~~
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
~~~
8. Adding a pacman hooks
~~~
$ /etc/pacman.d/hooks/nvidia.hook
---------------------------------------------------------
# Add it to to the file
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
~~~
9. Make sure the Target package set in this hook is the one you have installed in steps above (e.g. nvidia, nvidia-dkms, nvidia-lts or nvidia-ck-something).
10. **Note :**  The complication in the Exec line above is in order to avoid running mkinitcpio multiple times if both nvidia and linux get updated. In case this does not bother you, the Target=linux and NeedsTargets lines may be dropped, and the Exec line may be reduced to simply Exec=/usr/bin/mkinitcpio -P.



## Keybinds
### OS Keybinds :
| Keybinding  | Description |
| ------------- | ------------- |
| Mod + Enter | Open terminal |
| Mod + ← | Focus left |
| Mod + → |	Focus right |
| Mod + ↑ |	Focus up |
| Mod + ↓ |	Focus down |
| Mod + Shift + ←| Move the window to the left side |
| Mod + Shift + → | Move the window to the right side |
| Mod + Shift + ↑ | Move the window up |
| Mod + Shift + ↓ | Move the window down |
| Mod + f |	Toggle the focused window to full-screen |
| Mod + v | The next window will be placed vertically |
| Mod + h | The next window will be placed horizontally |
| Mod + s | Enables the stacked window layout |
| Mod + w | Enables the tabbed window layout |
| Mod + Shift + Space | Enables the floating window (for focused window) |
| Mod + Left-mouse-click | Drag the entire window using the mouse |
| Mod + 0-9 | Switch to another workspace |
| Mod + Shift + 0-9 | Move the window to another workspace |
| Mod + d | Open the application launcher (D menu) |
| Mod + Shift + q | Kills the focused window |
| Mod + Shift + c | Reloads the I3 config file |
| Mod + Shift + r | Restart the I3 WM |
| Mod + Shift + e | Exit I3 WM |



### Tilix Keybinds
| Keybinding  | Description |
| ------------- | ------------- |
| CTRL ALT r | Vertical Split |
| CTRL ALT d | Horizontal Split

## Mindmap of the important OS Apps:
- Audio Control : pavucontrol : https://aur.archlinux.org/packages/pavucontrol-git
- Group Messaging Apps : https://github.com/getferdi/ferdi/tree/v5.8.1
- Heroic Game Launcher : Epic Games Store
- arandr : Managing screen resolutions
- Wallpaper management : nitrogen
- Browser :
https://www.rockyourcode.com/change-the-default-browser-in-i3-manjaro-linux/
- File browser : xplr
- Drive Sync : rclone
- Create multiple terminal inside one for SSH : tmux




## Gaming
### League of legends setup and optimize : 
- https://leagueoflinux.org/optimise/

### Ubisoft Connect :
Use lutris : https://lutris.net/games/ubisoft-connect/
If the launcher is stuck on "looking for patches" :
- Disable FSync
- Disable ESync
- Switch to wine staging/system wine
Re-launch, do the patches, then change everything back.
You might need to change configuraiton files (.ini) of the downloaded game to change game resolution and borderless.
KEEP FSync DISABLED!!!

### Epic Games Store :
- https://heroicgameslauncher.com
- https://aur.archlinux.org/packages/heroic-games-launcher-bin

### Resolution Change:
Install arandr (GUI for xrandr)

### Yuri's Revenge :
Create launcher with Lutris then install with winetricks : xna40 and dotnet40

### Playing VR :
https://github.com/alvr-org/alvr

### Assassin's Creed Origin :
Use at least proton GE 7.3 : https://www.reddit.com/r/SteamDeck/comments/xb6c9q/comment/inyp7pt/?utm_source=share&utm_medium=web2x&context=3


## Diverse Tips
### change theme Manjaro KDE :
You probably have ```qt5ct``` installed and set up to theme Qt.
Same with  ```lxappearance```

### i3 config :
Choose theme for i3 menu bar : https://thomashunter.name/i3-configurator/

### Install Gnome Shell extensions
```
sudo pacman -S gnome-shell-extensions
```
### Material Shell
Have tiling features in Gnome :
- https://material-shell.com/#persistence
- https://extensions.gnome.org/extension/3357/material-shell/

### Gnome extensions : 
https://extensions.gnome.org/extension/779/clipboard-indicator/
https://extensions.gnome.org/extension/750/openweather/
https://extensions.gnome.org/extension/4338/allow-locked-remote-desktop/
https://extensions.gnome.org/extension/5306/firefox-pip-always-on-top/
https://extensions.gnome.org/extension/4727/primary-input-on-lockscreen/
https://extensions.gnome.org/extension/906/sound-output-device-chooser/

### Mod Skyrim
https://github.com/rockerbacon/modorganizer2-linux-installer
or this  
https://github.com/sonic2kk/steamtinkerlaunch

### Manage Proton :
https://github.com/DavidoTek/ProtonUp-Qt

### i3 Setup Tutorial

https://itsfoss.com/i3-customization/

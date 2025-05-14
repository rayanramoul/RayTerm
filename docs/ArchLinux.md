<div align="center">
    <h1>ArchLinux</h1>
    <img src="https://github.com/rayanramoul/dotfiles/blob/main/assets/arch_preview.png?raw=true"/>
</div>

# Summary

- Fetch Script : neoFetch
- Editor : Neovim
- Terminal : Alacritty
- Window Manager : i3wm
- Status Bar : i3blocks
- Terminal Multiplexer : Tmux
- Hotkeys : Managed by i3wm
- Launcher : Rofi
- Fonts : Fira Code, JetBrains Mono, SF Mono, Nerd Fonts
- Color Scheme : Catppuccin Mocha
- Zsh Theme : Powerlevel10k
- Other Terminal Utilities : Bat, Exa, Fzf, Ripgrep, Starship, Tldr, Zoxide, Lsd, LazyGit

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

# How To

One command :

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

# Autostart Applications

- dex is used for XDG autostart.
- xss-lock is employed to lock the screen before suspend.
- nm-applet is started for NetworkManager support.
- Keyboard layout is set using setxkbmap.
- Volume control is configured using keybindings and pactl.
- feh is used to set the wallpaper.
- compton is started for compositor support.
    rofi is configured as the application launcher.

# Tips

## Quick install of Arch

When booted in the ArchLinux's USB :

```bash
sudo pacman -S archinstall
archinstall
```

## NVIDIA Drivers Setup

### Step 1 - Getting things ready

1. Firstly update your system

~~~
sudo pacman -Syu
~~~

2. Edit your pacman.conf

~~~
vim /etc/pacman.conf/
~~~

3. Uncomment VerbosePkgLists and ParallelDownloads = 3
4. You can also add ILoveCandy under the ParallelDownloads for a surprise. You can remove it if you dislike it.

~~~
VerbosePkgLists
ParallelDownloads = 3
ILoveCandy
~~~

6. Also Uncomment

~~~
[multilib]
Include = /etc/pacman.d/mirrorlist
~~~

7. Update your system again.

~~~
sudo pacman -Syu
~~~

### Step 2 - Installing the drivers

1. This step might be a bit confusing. First find your [nvidia card from this list here](https://nouveau.freedesktop.org/CodeNames.html)
2. You can Check what graphic hardware you have by running

~~~
lspci -k | grep -A 2 -E "(VGA|3D)"
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
sudo pacman -S nvidia libglvnd nvidia-utils opencl-nvidia lib32-libglvnd lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings
~~~

## Step 3 - DRM kernel mode setting

1. Edit mkinitcpio.conf

~~~
vim /etc/mkinitcpio.conf
~~~

2. Add
   > MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)

3.Replace i915(intel integrated graphics) with amdgpu if you have amd integrated graphics. If you have no integrated graphics just write the nvidia thingies
4. Run the command and see if there are any warnings stating nvidia. There are other warning too. you just have to know which to ignore and which to not.

~~~
mkinitcpio -P
~~~

5. Edit the grub file

~~~
vim /etc/default/grub
~~~

6. Edit the following line

~~~
GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"
~~~

7. Run the following command

~~~
sudo grub-mkconfig -o /boot/grub/grub.cfg
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

# Mindmap of the important OS Apps

- Audio Control : pavucontrol : <https://aur.archlinux.org/packages/pavucontrol-git>
- Group Messaging Apps : <https://github.com/getferdi/ferdi/tree/v5.8.1>
- Heroic Game Launcher : Epic Games Store
- arandr : Managing screen resolutions
- Wallpaper management : nitrogen
- Browser :
<https://www.rockyourcode.com/change-the-default-browser-in-i3-manjaro-linux/>
- File browser : xplr
- Drive Sync : rclone
- Create multiple terminal inside one for SSH : tmux
- File explorer : yazi

## Optimizaitons and Tips

### Run apps natively on wayland
<https://www.reddit.com/r/archlinux/comments/s2xvrn/getting_discord_to_run_natively_on_wayland/?show=original>

## Gaming

### League of legends setup and optimize

- <https://leagueoflinux.org/optimise/>

### Ubisoft Connect

Use lutris : <https://lutris.net/games/ubisoft-connect/>
If the launcher is stuck on "looking for patches" :

- Disable FSync
- Disable ESync
- Switch to wine staging/system wine
Re-launch, do the patches, then change everything back.
You might need to change configuraiton files (.ini) of the downloaded game to change game resolution and borderless.
KEEP FSync DISABLED!!!

### Epic Games Store

- <https://heroicgameslauncher.com>
- <https://aur.archlinux.org/packages/heroic-games-launcher-bin>

### Resolution Change

Install arandr (GUI for xrandr)

### Yuri's Revenge

Create launcher with Lutris then install with winetricks : xna40 and dotnet40

### Playing VR

<https://github.com/alvr-org/alvr>

### Assassin's Creed Origin

Use at least proton GE 7.3 : <https://www.reddit.com/r/SteamDeck/comments/xb6c9q/comment/inyp7pt/?utm_source=share&utm_medium=web2x&context=3>

### Mod Skyrim

<https://github.com/rockerbacon/modorganizer2-linux-installer>
or this  
<https://github.com/sonic2kk/steamtinkerlaunch>

### Manage Proton

<https://github.com/DavidoTek/ProtonUp-Qt>

## Others

### change theme GUI

You probably have ```qt5ct``` installed and set up to theme Qt.
Same with  ```lxappearance```

### i3 config

Choose theme for i3 menu bar : <https://thomashunter.name/i3-configurator/>

### i3 Setup Tutorial

<https://itsfoss.com/i3-customization/>

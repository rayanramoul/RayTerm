<div align="center">
 
<img width="200" src="https://github.com/rayanramoul/RayTerm/blob/master/assets/logo.png?raw=true">
</img>
<h1>RayTerm</h1>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
<h6 align="center">
  <a href="https://github.com/rayanramoul/RayTerm/blob/master/docs/Neovim.md">Neovim</a>
  ·
  <a href="https://github.com/rayanramoul/RayTerm/blob/master/docs/Terminal.md">Terminal</a>
  ·
  <a href="https://github.com/rayanramoul/RayTerm/blob/master/docs/Tmux.md">Tmux</a>
  ·
  <a href="https://github.com/rayanramoul/RayTerm/blob/master/docs/ArchLinux.md">ArchLinux</a>
  ·
  <a href="https://github.com/rayanramoul/RayTerm/blob/master/docs/MacOS.md">MacOS</a>
  ·
  <a href="https://github.com/rayanramoul/RayTerm/blob/master/docs/Windows.md">Windows</a>
</h6>

&nbsp;

    _MacOS Setup_
 <img src="https://github.com/rayanramoul/RayTerm/blob/master/assets/macos_preview.png?raw=true" alt="RayTerm" width="600">
  </img>
    _Windows and WSL Setup_
   <img src="https://github.com/rayanramoul/RayTerm/blob/master/assets/windows_preview.png?raw=true" alt="RayTerm" width="600">
  </img>

</div>

# Get Started

```bash
sh -c "$(wget https://raw.githubusercontent.com/rayanramoul/RayTerm/master/install.sh -O -)"
```
The script will clone this repository and install ansible then prompt you to choose which part of the install you want to run. 
If you only want to check the dotfiles you can get them at this link : [Dotfiles](dotfiles)

# What is this ?
RayTerm is a set of configuration, dotfiles and software to ensure a vision on the optimal environement to code in.
It is :
- Tiling Window Management.
- Coherent and reproducible workflows from an OS to another.
- Strongly relying on terminal tools : Neovim, Tmux, Zsh, Fzf, etc.
- All prettier with Catppuccin !

# How ?
The idea is to have one main key associated with each part of the system 
- `Alt` for the window manager.
- `Ctrl` for the terminal.
- `Ctrl + b` for tmux.
- `Ctrl` and `Space` for neovim.

# Docs
You can find my documentation of each part of my workflow in the [docs](docs) folder.
- [Neovim](docs/Neovim.md): My neovim configuration.
- [Terminal](docs/Terminal.md): My terminal configuration.
- [Tmux](docs/Tmux.md): My tmux configuration.
- [ArchLinux](docs/ArchLinux.md): My ArchLinux installation guide.
- [MacOS](docs/MacOS.md): My MacOS installation guide.
- [Windows](docs/Windows.md): My Windows installation guide.

# Development
This repository is delivered with a set of Dockefiles to ensure a reproducible development environement.
So if you want to altere it and test it let's say on Ubuntu you can do it with the following command :
```bash
cd docker
bash build_test_docker.sh ubuntu
```
It will build the docker image (omitting the cache) and run it in interactive mode.
Possible arguments being : `ubuntu`, `arch`, `macos`, `aws`.

# ❤️ Enjoying RayTerm?

If RayTerm has been helpful to you, please consider giving it a star! ⭐ It helps others discover the repository and shows appreciation for the effort put into creating and maintaining it.

Thank you for your support! 🚀




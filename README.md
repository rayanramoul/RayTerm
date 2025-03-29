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
![RayTerm](https://github.com/rayanramoul/RayTerm/blob/master/assets/macos_preview.png?raw=true)
_Windows and WSL Setup_
![RayTerm](https://github.com/rayanramoul/RayTerm/blob/master/assets/windows_preview.png?raw=true)
_ArchLinux Setup_
![RayTerm](https://github.com/rayanramoul/RayTerm/blob/master/assets/arch_preview.png?raw=true)

</div>

# Get Started with one command (Linux and MacOS only)

```bash
sh -c "$(wget https://raw.githubusercontent.com/rayanramoul/RayTerm/master/install.sh -O -)"
```

The script will clone this repository and install ansible then prompt you to choose which part of the install you want to run. <br>
If you only want to check the dotfiles you can get them at this link : [Dotfiles](dotfiles) and for example run [Stow](https://www.gnu.org/software/stow/) to symlink your config with the repositories ones :

```bash
git clone --recurse-submodules  https://github.com/rayanramoul/RayTerm/
cd RayTerm/dotfiles
stow -v -t ~ dotfiles
```

Or if you want a minimal setup for a server (only copy dotfiles) you can run the following command :

```bash
sh -c "$(wget https://raw.githubusercontent.com/rayanramoul/RayTerm/master/install.sh -O -)" -- -m
```

_for Windows you can check the [Windows](docs/Windows.md) doc_

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
- [ArchLinux](docs/ArchLinux.md): My ArchLinux workflow guide.
- [MacOS](docs/MacOS.md): My MacOS workflow guide.
- [Windows](docs/Windows.md): My Windows workflow guide.

# ❤️ Enjoying RayTerm?

If RayTerm has been helpful to you, please consider giving it a star! ⭐ It helps others discover the repository and shows appreciation for the effort put into creating and maintaining it.

Thank you for your support! 🚀

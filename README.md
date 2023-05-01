# About
Dotfiles for my dual-monitor hyprland rice on a minimal arch linux install, circa 2023.

## Preview

### Clean
![Clean](https://i.imgur.com/F9gdSzz.jpeg)

### Dirty
![Dirty](https://i.imgur.com/uRxoLsV.png)

## Components
 Key components include:

- **Bootloader**: grub2

- **Services Manager**: systemd

- **Display Manager**: ly

- **Display Server**: wayland

- **Window Manager / Compositor**: hyprland-nvidia based on wl-roots implementation of wayland

- **Audio Manager**: pipewire

- **Bar**: waybar-hyprland-git

- **Notification Manager**: dunst

- **Idling Manager**: swayidle

- **Launcher**: rofi-lbonn-wayland

- **Lock**: swaylock-effects

- **Logout Manager**: wlogout

- **Wallpaper Manager**: swaybg

- **Appearance Manager**: nwg-look

- **Clipboard Manager**: wl-clipboard + wl-clip-persist

- **Terminal**: kitty

- **File Manager**: thunar

- **Internet Browser**: vivaldi

- **Music Player**: mpd

- **Visualizer**: cava

### Custom Components

- Wallpapers

- Custom themes for:
    
    - telegram-desktop-bin
    - vivaldi
    - visual-studio-code-bin
    - GTK

- Other useful scripts..


## Backup and Restore / Installation
The first section contains steps to install this configuration and broadly consists of installing required packages and putting dotfiles in the correct place.

The second section contains steps to create a new set of dotfiles and backing up configurations in a sane manner using bare repositories.

### Restore / Installation Scripts
To be able to bootstrap your restore, download .scripts/dotfiles-restore.sh to your $HOME and make sure that dotfiles-restore.sh has the correct <git-repo-url\> set.

#### Restore Dotfiles
```bash
chmod +x $HOME/dotfiles-restore.sh
$HOME/./dotfiles-restore.sh
```

#### Restore Packages
```bash
chmod +x $HOME/.scripts/pkg-restore.sh
$HOME/.scripts/./pkg-restore.sh
```

### Backup Scripts

#### Backup Packages
Download .scripts/pkg-backup.sh to your $HOME.

```bash
chmod +x $HOME/pkg-backup.sh
$HOME/./pkg-backup.sh
```

#### Backup Dotfiles - One Shot
Only do this **one time after a remote's first commit**, i.e., a set of dotfiles are created, i.e., . Refer to [Bare Repository and Alias](#bare-repository-and-alias) for the steps.

## Appendix
Background on install and backup scripts to manage packages and dotfiles for quick and powerful disaster recovery.

### Maintaing Dotfiles
Using a bare repository to manage dotfiles is a very clean way of solving this use case. 

#### Bare Repository and Alias
```bash
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

#### Add / Commit / Push to tracked dotfiles
```bash
dotfiles add file
dotfiles add folder/
dotfiles commit -m "comment"
dotfiles remote add origin <git-repo-url>
dotfiles push origin master
```

#### Refetch dotfiles on new system
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### Package Management
Backing up and restoring installed packages to/from a file to resume system state

#### Backup explicit and AUR packages

##### Explicit Packages (Pacman)
```bash
pacman -Qqe | grep -v "$(pacman -Qqm)" > $HOME/pacman-packages.lst
```

##### AUR Packages
```bash
pacman -Qqm > $HOME/aur-packages.lst
```

#### Restore explicit and AUR packages

##### Explicit packages
```bash
cat $HOME/pacman-packages.lst | xargs pacman -S --needed --noconfirm
```

##### AUR packages
```bash
yay -S --needed --noconfirm - < $HOME/aur-packages.lst
```

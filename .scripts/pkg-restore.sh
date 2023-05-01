#!/bin/bash
printf "\n\n============================================================"
printf "\n\055 Restoring explicitly installed packages from file\n(Additional dependencies will be pulled in by pacman)\n"
printf "\n\055 Make sure that $HOME/pacman-packages.lst exists\n"
printf "============================================================"
printf "\n\n\055 You need to be root as this script uses -S flag for pacman\n\n"

sudo bash -c "cat $HOME/pacman-packages.lst | xargs pacman -S --needed --noconfirm"

printf "\n============================================================"
if [ $? -eq 0 ]; then
printf "\n\055 Done restoring official packages and dependencies"
else
printf "\n\055 Uh-oh! Something went wrong. Make sure $HOME/pacman-packages.lst exists"
fi
printf "\n============================================================"




printf "\n\n\n\n\n============================================================"
printf "\n\055 Restoring external packages\n(For most users these will be AUR packages)\n"
printf "\055 Make sure that $HOME/aur-packages.lst exists\n"
printf "============================================================\n"
printf "\055 This script is dependent on yay, change the script if you use another pacman wrapper\n"
yay -S --needed --noconfirm - < $HOME/aur-packages.lst

printf "\n============================================================"
if [ $? -eq 0 ]; then
printf "\n\055 Done restoring external packages and dependencies"
else
printf "\n\055 Uh-oh! Something went wrong. Make sure $HOME/aur-packages.lst exists"
fi
printf "\n============================================================\n\n\n"

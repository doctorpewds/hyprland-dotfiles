#!/bin/bash
printf "\n\n============================================================"
printf "\n\055 Backing up the following arch official packages\n"
printf "============================================================"
printf "\n\n$(pacman -Qqe | grep -v "$(pacman -Qqm)")\n"
pacman -Qqe | grep -v "$(pacman -Qqm)" > $HOME/pacman-packages.lst
printf "\n============================================================"
printf "\n\055 Done backing up official arch packages to $HOME/pacman-packages.lst\n"
printf "============================================================\n\n"


printf "\n\n============================================================"
printf "\nBacking up external packages (For most users these will be AUR packages)\n"
printf "============================================================\n\n"
printf "$(pacman -Qqm)\n"
pacman -Qqm > $HOME/aur-packages.lst
printf "\n\n============================================================"
printf "\n\055 Done backing up external packages to $HOME/aur-packages.lst\n"
printf "============================================================"
printf "\n\n\n"






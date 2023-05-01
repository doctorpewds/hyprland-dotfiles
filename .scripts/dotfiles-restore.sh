#!/bin/bash
printf "\n\n============================================================"
printf "\n\055 Setting up dotfiles alias for current and future bash sesiions"
printf "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'"
printf "\n\55============================================================\n\n"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' >> $HOME/.bashrc
echo ".dotfiles" >> $HOME/.gitignore


printf "\n\n============================================================"
printf "\n\055 Setting up bare git repository targeted to $HOME/.dotfiles\n"
printf "\n\055 Make sure repo url is set in the script or script will fail\n"
printf "============================================================"

git clone --bare <git-repo-url> $HOME/.dotfiles

if [ $? -eq 0 ]; then
printf "\n\055 Successfully cloned the dotfile repo as bare to $Home/.dotfiles"
else
printf "\n\055 Make sure <git-repo-url> is set in the script or script will fail\n"
fi

dotfiles config --local status.showUntrackedFiles no

printf "\n\n============================================================"
printf "\n\055 Checking out dotfiles repo\n"
printf "\n\055 This step pulls all the files and place them at correct paths in $HOME"
printf "============================================================"

dotfiles checkout

printf "\n\n============================================================"
printf "\n\055 Setting up bare git repository targeted to $HOME/.dotfiles\n"
printf "\n\055 Make sure repo url is set in the script or script will fail\n"
printf "============================================================"
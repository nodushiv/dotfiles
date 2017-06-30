#!/bin/bash -
#===============================================================================
#
#          FILE: makesymlinks.sh
#
#         USAGE: ./makesymlinks.sh
#
#   DESCRIPTION: This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Rahul Shivananda (), nodushiv@gmail.com
#  ORGANIZATION:
#       CREATED: 06/30/2017 03:28:17
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
############################
# .make.sh
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile tmux.conf tmux bashrc vimrc vim zshrc oh-my-zsh vim_runtime"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

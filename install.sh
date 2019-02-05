#!/bin/bash

DIR=`pwd`

function confirm() {
    read -p "$1 [Yn]: " -n 1 -r
    echo;
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ $REPLY == "" ]]; then
      return 0;
    else
      return 1;
    fi
}


if confirm "Make symbolic links to (tmux.conf, perltidyrc, astylerc, ackrc)? "; then
  cd ~
  pwd
  ln -s $DIR/tmux.conf .tmux.conf
  ln -s $DIR/perltidyrc .perltidyrc
  ln -s $DIR/astylerc .astylerc
  ln -s $DIR/ackrc .ackrc
  cd $DIR
fi

if confirm "Should I pimp vim (.vim folder)? "; then
  cd ~
  ln -s $DIR/vim .vim
  cd $DIR/vim
  ./install
  cd $DIR
fi

if [ -d ~/.profile.d ]; then
  if confirm "Update .profile.d"; then
    ln -s $DIR/profile.d/tmux ~/.profile.d/tmux
  fi
fi

if [ -d ~/.profile.d ]; then
  if confirm "Update .profile.d"; then
    ln -s $DIR/profile.d/tmux ~/.profile.d/tmux
  fi
else
  if ! grep -q tmux "~/.profile" && confirm "Enable autostart of tmux? "; then
    cat $DIR/profile.d/tmux >> ~/.profile
  fi
fi





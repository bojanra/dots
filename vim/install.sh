#!/bin/bash

cat > ~/.vimrc <<EOF
source ~/.vim/vimrc
EOF

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

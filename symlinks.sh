#!/bin/bash

DOT_FILES=(
.zshrc
.vimrc
.gvimrc
.tmux.conf
)

CONFIG_FILES=(
  pylintrc
  pep8
  flake8
)

echo "### Create symbolic link under home directory..."
for file in ${DOT_FILES[@]}
do
	if [ -e $HOME/dotfiles/$file ]; then
		echo "ln -snf $HOME/dotfiles/$file $HOME/$file"
		ln -snf $HOME/dotfiles/$file $HOME/$file
	else
		echo "[SKIP] $file does not exist."
	fi
done

echo "### Create symbolic link under .config directory..."
mkdir -p $HOME/.config
for file in ${CONFIG_FILES[@]}
do
	if [ -e $HOME/dotfiles/config/$file ]; then
		echo "ln -snf $HOME/dotfiles/config/$file $HOME/.config/$file"
		ln -snf $HOME/dotfiles/config/$file $HOME/.config/$file
	else
		echo "[SKIP] $file does not exist."
	fi
done

if [ -e $HOME/dotfiles/snippets ]; then
	ln -snf $HOME/dotfiles/snippets $HOME/.vim/snippets
fi

if [ -e $HOME/dotfiles/ftdetect ]; then
	ln -snf $HOME/dotfiles/ftdetect $HOME/.vim/ftdetect
fi

if [ -e $HOME/dotfiles/ftplugin ]; then
	mkdir -p $HOME/.vim/after
	ln -snf $HOME/dotfiles/ftplugin $HOME/.vim/after/ftplugin
fi


ln -snf $HOME/dotfiles/rc $HOME/.vim/rc

# zsh completion
echo "### [zsh] Create symbolic link under .zsh/completion directory..."
if [ -e $HOME/dotfiles/zsh-completion ]; then
  ln -snf $HOME/dotfiles/zsh-completion $HOME/.zsh/completion
fi

# for dein.vim
if [ ! -e $HOME/dotfiles/dein ]; then
  sh ./installer.sh dein
fi

# for Neovim
mkdir -p $HOME/.config/nvim
ln -snf $HOME/dotfiles/ftdetect $HOME/.config/nvim/ftdetect
ln -snf $HOME/dotfiles/ftplugin $HOME/.config/nvim/ftplugin
ln -snf $HOME/dotfiles/snippets $HOME/.config/nvim/snippets
ln -snf $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

# zsh completion
ln -snf $HOME/dotfiles/zsh $HOME/.zsh

# install oh-my-zsh
# [ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# [ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'


echo "### Installing anyenv..."
git clone https://github.com/riywo/anyenv ~/.anyenv

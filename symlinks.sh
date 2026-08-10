#!/bin/bash
set -eu

# スクリプト自身の場所からリポジトリのパスを動的に解決する（$HOME/dotfiles固定をやめる）
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# $1: リポジトリ内のソースパス（DOTFILES_DIRからの相対パス）
# $2: リンク先の絶対パス
# ソースが存在しない場合はスキップ。リンク先に「symlinkでない実ファイル」が
# 既にある場合は上書きせず *.bak にリネームしてから貼り直す。
link_file() {
  local src="$DOTFILES_DIR/$1"
  local dst="$2"

  if [ ! -e "$src" ]; then
    echo "[SKIP] $1 does not exist in dotfiles."
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "[BACKUP] $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi

  ln -snf "$src" "$dst"
  echo "linked: $dst -> $src"
}

DOT_FILES=(
  .zshrc
  .vimrc
  .tmux.conf
  .gitconfig
  .ideavimrc
)

echo "### Create symbolic link under home directory..."
for file in "${DOT_FILES[@]}"; do
  link_file "$file" "$HOME/$file"
done

echo "### Create symbolic link under .config directory..."
link_file "config/herdr/config.toml" "$HOME/.config/herdr/config.toml"
link_file "config/ghostty/config" "$HOME/.config/ghostty/config"
link_file "config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

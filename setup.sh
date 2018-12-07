#!/bin/bash

# Disable Screenshot's shadow
# ref. https://dackdive.hateblo.jp/entry/2014/01/20/122818
defaults write com.apple.screencapture disable-shadow -boolean true

# Change Screenshot file name and location
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
defaults write com.apple.screencapture name SS

# Show hidden files/folders on Finder
defaults write com.apple.finder AppleShowAllFiles -boolean true

killall Finder
killall SystemUIServer

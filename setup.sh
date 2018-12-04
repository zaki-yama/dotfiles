# ref. https://dackdive.hateblo.jp/entry/2014/01/20/122818
defaults write com.apple.screencapture disable-shadow -boolean true
killall SystemUIServer

# Change Screenshot file name and location
cd ~/Desktop
mkdir Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
defaults write com.apple.screencapture name SS
killall SystemUIServer
  
# Show hidden files/folders on Finder
defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder 

#!/usr/bin/env bash

##
##	PRIVACY
##

## Disable AirDrop
defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES

## Save to disk instead of iCloud
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

##
##	FILE SYSTEMS
##

## Disable creating metadata files `.DS_Store` and AppleDouble
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
## for USB drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true && \
killall SystemUIServer

## Show all hidden files, starting from home folder Library
chflags nohidden ~/Library

## Factory default is false
# defaults write com.apple.finder AppleShowAllFiles false
defaults write com.apple.finder AppleShowAllFiles true

## Show full path on windows title 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## Expand Save Panel by Default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true && \
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

## Always show scrollbar
defaults write -g AppleShowScrollBars -string "Always"

## Show status bar (false by default)
defaults write com.apple.finder ShowStatusBar -bool true

## Set default Finder opens to ~ (home)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

## Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

## Set to metrics
defaults write 'Apple Global Domain' AppleMetricUnits -bool true

## Copy SF Mono fonts (pre Sierra)
# cp -v /Applications/Xcode-beta.app/Contents/SharedFrameworks/DVTKit.framework/Versions/A/Resources/Fonts/SFMono-* ~/Library/Fonts

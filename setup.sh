#!/bin/sh

ROOT=$(
	cd "$(dirname "$0")" || return
	pwd -P
)

CONFIGS='
	hammerspoon
	gitconfig
	zshrc
'

for f in $CONFIGS; do
	if [ ! -h ~/."$f" ]; then
		mkdir -p ~/."$(dirname "$f")"
		ln -vs "$ROOT/$f" ~/."$f"
	fi
done

# Dock changes:
# - position to the bottom
# - reduce size
# - auto hide
# - spaces order static
# - disable recent non-open apps
# - disable quick note hot corner
defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.menuextra.clock.plist ShowDate -int 1

SPELLING_CONFIGS='
	Capitalization
	DashSubstitution
	PeriodSubstitution
	QuoteSubstitution
	SpellingCorrection
'

# Disable typing corrections:
for s in $SPELLING_CONFIGS; do
	defaults write NSGlobalDomain "NSAutomatic${s}Enabled" -bool false
done

# Show battery percentage in menu bar:
defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Disable spotlight in menu bar:
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

# Remap caps-lock to escape:
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'

_url=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

if ! [ -e /opt/homebrew/bin/brew ]; then
	/bin/bash -c "$(curl -fsSL $_url)"
fi
brew bundle

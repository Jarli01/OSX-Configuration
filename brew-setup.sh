#!/bin/sh

if test ! $(which brew); then
 echo "Installing Brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names

brew install dockutil
brew install mas
brew install curl
brew install macosvpn
 
brew cask install adobe-acrobat-pro
brew cask install adobe-acrobat-reader
brew cask install adobe-creative-cloud
brew cask install airtame
brew cask install diskmaker-x
brew cask install dropbox
brew cask install filezilla
brew cask install firefox
brew cask install fontexplorer-x-pro
brew cask install google-chrome
brew cask install i1profiler
brew cask install microsoft-office
brew cask install skype-for-business
brew cask install spotify
brew cask install veracrypt
brew cask install vlc
brew cask install basecamp

mas install 1295203466

open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app/

dockutil --remove Siri
dockutil --remove Mail
dockutil --remove Contacts
dockutil --remove Calendar
dockutil --remove Pages
dockutil --remove Numbers
dockutil --remove Messages
dockutil --remove Safari

dockutil --add "/Applications/Google Chrome.app"/
dockutil --add "/Applications/Spotify.app"/
dockutil --add "/Applications/Basecamp 3.app"/
dockutil --add "/Applications/Firefox.app"/
dockutil --add "/Applications/Veracrypt.app"/
dockutil --add "/Applications/FontExplorer X Pro.app"/
dockutil --add "/Applications/Microsoft Excel.app"/
dockutil --add "/Applications/Microsoft Word.app"/
dockutil --add "/Applications/Microsoft Powerpoint.app"/
dockutil --add "/Applications/Microsoft Outlook.app"/

sudo systemsetup -setremotelogin on

dseditgroup com.apple.access_ssh
dseditgroup -o create -q com.apple.access_ssh

sudo dseditgroup -o edit -a admin -t group com.apple.access_ssh

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users admin,admin -privs -DeleteFiles -ControlObserve -TextMessages -OpenQuitApps -GenerateReports -RestartShutDown -SendFiles -ChangeSettings -specifiedUsers

sudo macosvpn create --l2tp 'VPN Name' --endpoint vpn.domain.com --username '' --password '' --shared-secret secret-password

softwareupdate -i -a

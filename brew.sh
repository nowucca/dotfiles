#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Install my binaries.
brew install maven31
brew install node
brew install wireshark --with-lua
brew install docker
brew install docker-machine
brew install id3lib
brew install xmlstarlet
brew install kdiff3
brew install gpg
brew install ag
brew install gradle
brew install lz4
brew install jq
brew install rpm
brew install golang

# Install my cask-based binaries.
#brew install phinze/cask/brew-cask
brew tap homebrew/cask
brew tap caskroom/versions
brew cask install alfred
brew cask install hazel
brew cask install perforce
brew cask install p4v
brew cask install github 
brew cask install google-chrome 
brew cask install slack
brew cask install imagealpha 
brew cask install imageoptim 
brew cask install iterm2 
brew cask install macvim
brew cask install miro-video-converter 
brew cask install opera 
brew cask install sublime-text 
brew cask install the-unarchiver 
brew cask install thunderbird 
brew cask install transmission 
brew cask install ukelele 
brew cask install virtualbox 
brew cask install vlc 

brew cask install gimp
brew cask install macvim
brew cask install kdiff3

brew cask install remote-desktop-connection

brew cask install little-snitch
brew cask install micro-snitch

#Ext4
brew cask install osxfuse
brew install ext4fuse

#Utilities
brew install dos2unix

# Blockchain
#brew tap paritytech/paritytech
#brew install parity --stable

# Remove outdated versions from the cellar.
brew cleanup

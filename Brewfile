# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
install bash

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep

# Install other useful binaries
install ack
#install exiv2
install git
install maven31
install imagemagick --with-webp
install lynx
install nmap
install ucspi-tcp # `tcpserver` et al.
install node
install p7zip
install pigz
install pv
install rename
install rhino
install sqlmap
install tree
install webkit2png
install xpdf
install zopfli

install wireshark --with-lua

install homebrew/versions/bash-completion2 

install docker

install ssh-copy-id

# Remove outdated versions from the cellar
cleanup

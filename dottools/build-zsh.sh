#!/bin/bash

set -e

sudo apt-get install -y git-core gcc make autoconf yodl libncursesw5-dev texinfo

wget "https://github.com/zsh-users/zsh/archive/zsh-5.3.1.tar.gz"
tar -xzf zsh*tar.gz

cd zsh*/

./Util/preconfig

# Options from Ubuntu Zsh package rules file (http://launchpad.net/ubuntu/+source/zsh)
./configure --prefix=/usr \
            --mandir=/usr/share/man \
            --bindir=/bin \
            --infodir=/usr/share/info \
            --enable-maildir-support \
            --enable-max-jobtable-size=256 \
            --enable-etcdir=/etc/zsh \
            --enable-function-subdirs \
            --enable-site-fndir=/usr/local/share/zsh/site-functions \
            --enable-fndir=/usr/share/zsh/functions \
            --with-tcsetpgrp \
            --with-term-lib="ncursesw" \
            --enable-cap \
            --enable-pcre \
            --enable-readnullcmd=pager \
            --enable-custom-patchlevel=Debian \
            LDFLAGS="-Wl,--as-needed -g"

make

make check

sudo make install

sudo make install.info

rm -rf zsh*/
rm -rf zsh*.tar.gz

# Add zsh to /etc/shells
command -v zsh | sudo tee -a /etc/shells

# Set zsh as the default shell
sudo chsh -s "$(command -v zsh)" "${USER}"

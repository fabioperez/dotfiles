# dotfiles

First, clone dotfiles:

```
git clone https://github.com/fabioperez/dotfiles/ ~/.dotfiles
```

## Install softwares
### Debian/Ubuntu
```
sudo apt-get install -y ack-grep aria2 cmake ctags curl git tree vim wget \
xclip gnome-tweak-tool libclang-dev
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

# LinuxBrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
```

Use carefully:
```
sudo apt-get install g++ gcc
```

#### Guake

    sudo apt-get install python-dbus

    git clone https://github.com/Guake/guake
    (cd guake
    ./dev.sh --install)
    rm -rf guake

#### tmux
    sudo apt-get -y remove tmux
    sudo apt-get -y install libevent-dev ncurses-dev
    cd ~
    wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
    tar -zxf tmux-2.6.tar.gz
    (cd tmux-2.6
     ./configure && make
     sudo make install)
    rm -rf tmux-2.6
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Open tmux and hit `prefix + I` to download the plugins.
  
#### Zsh

    bash ~/.dotfiles/dottools/build-zsh.sh
    
#### [Powerline fonts](http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)

```
sudo -i
su -c 'pip install git+git://github.com/Lokaltog/powerline'
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
exit
```

### Mac OS X
```
brew install vim zsh node tmux fzf aria2 ripgrep
```
## Config files

#### zsh

1. Install [Prezto](https://github.com/sorin-ionescu/prezto).

2. Source custom zsh+prezto config:
```
echo -e '\nsource "$HOME/.dotfiles/.zsh_custom"' >> ~/.zshrc
ln -fs ~/.dotfiles/.zpreztorc ~/.zpreztorc
```

#### vim + tmux
```
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -fs ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
bash ~/.dotfiles/dottools/vimstall.sh
```

## Tweaks

#### Ubuntu

##### Caps Lock as Control

Use `gnome-tweak-tool`.

##### Don't open nautilus window when auto-mounting device

    gsettings set org.gnome.desktop.media-handling automount-open false

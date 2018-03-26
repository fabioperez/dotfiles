# dotfiles

First, clone dotfiles:

```
git clone https://github.com/fabioperez/dotfiles/ ~/.dotfiles
```

## Install softwares
### Debian/Ubuntu
```
sudo add-apt-repository ppa:dyatlov-igor/materia-theme -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt update
sudo apt-get install -y ack-grep aria2 cmake ctags curl git tree vim wget \
xclip unity-tweak-tool libclang-dev materia-theme paper-icon-theme
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo snap install rg

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
  
#### Zsh

    bash ~/.dotfiles/dottools/build-zsh.sh
    
#### Fonts
    
    (cd ~
     mkdir -p ~/.fonts
     wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.2.0/SourceCodePro.zip
     wget https://github.com/google/roboto/releases/download/v2.136/roboto-hinted.zip
     unzip SourceCodePro.zip -d ~/.fonts/
     unzip roboto-hinted.zip -d ~/.fonts/
     rm -f SourceCodePro.zip
     rm -f roboto-hinted.zip
     fc-cache -f -v
    )


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

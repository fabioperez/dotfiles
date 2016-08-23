# dotfiles

## Install softwares
### Debian/Ubuntu
```
sudo apt-get install -y ack-grep aria2 cmake ctags curl git tmux tree vim wget xclip
```

Use carefully:
```
sudo apt-get install g++ gcc
```

#### Zsh

[Compile](https://gist.github.com/nicoulaj/715855) from [source](http://zsh.sourceforge.net/Arc/source.html).

#### [Powerline fonts](http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)

```
sudo -i
su -c 'pip install git+git://github.com/Lokaltog/powerline'
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

### Mac OS X
```
brew install vim
brew install zsh
```
## Config files

#### zsh

Install [Prezto](https://github.com/sorin-ionescu/prezto).

#### vim + tmux
```
git clone https://github.com/fabioperez/dotfiles/ .dotfiles
ln -fs ~/.dotfiles/.tmux-2.2.conf ~/.tmux.conf
bash ~/.dotfiles/dottools/vimstall.sh
```

## Tweaks

#### Ubuntu 14.04

##### Caps Lock as Control
Add the following line to `/etc/default/keyboard`:

```
XKBOPTIONS="ctrl:nocaps"
```

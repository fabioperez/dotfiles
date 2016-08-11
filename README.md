# dotfiles

## Install softwares
### Debian/Ubuntu
```
sudo apt-get install -y ack-grep aria2 cmake ctags curl git tmux vim wget xclip
```

Use carefully:
```
sudo apt-get install g++ gcc
```

* Zsh

[Compile](https://gist.github.com/nicoulaj/715855) from [source](http://zsh.sourceforge.net/Arc/source.html).


### Mac OS X
```
brew install vim
brew install zsh
```
## Config files

#### zsh

Install [Prezto](https://github.com/sorin-ionescu/prezto).

#### vim
```
bash <(curl -fsSL https://raw.githubusercontent.com/fabioperez/dotfiles/master/dottools/vimstall.sh)
```

#### tmux
```
wget -q https://raw.githubusercontent.com/fabioperez/dotfiles/master/.tmux.conf -O ~/.tmux.conf
```

## Tweaks

#### Ubuntu 14.04

##### Caps Lock as Control
Add the following line to `/etc/default/keyboard`:

```
XKBOPTIONS="ctrl:nocaps"
```

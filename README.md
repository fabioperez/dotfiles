# dotfiles

#### Install softwares
* Debian/Ubuntu
```
sudo apt-get install ack aria2 cmake curl g++ gcc git tmux vim wget zsh
```

* Mac OS X
```
brew install vim
brew install zsh
```

#### zsh
```
# Install prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
```


#### vim
```
wget "https://raw.githubusercontent.com/fabioperez/dotfiles/master/dottools/vimstall.sh"
bash vimstall.sh
rm -f vimstall.sh
```

#### tmux
```
wget -q https://raw.githubusercontent.com/fabioperez/dotfiles/master/.tmux.conf -O ~/.tmux.conf
```

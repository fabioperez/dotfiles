# dotfiles

First, clone dotfiles:

```bash
git clone https://github.com/fabioperez/dotfiles/ ~/.dotfiles
```

## Install softwares

### macOS

```bash
brew install vim zsh node tmux fzf aria2 ripgrep go wget cmake fig git-delta pyenv
$(brew --prefix)/opt/fzf/install
```

#### Fonts

```bash
(cd ~
    mkdir -p ~/.fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
    wget https://github.com/googlefonts/roboto/releases/download/v2.136/roboto-hinted.zip
    unzip SourceCodePro.zip -d /Library/Fonts
    unzip roboto-hinted.zip -d /Library/Fonts
    rm -f SourceCodePro.zip
    rm -f roboto-hinted.zip
)
```

## Config files

### zsh

1. Install [Prezto](https://github.com/sorin-ionescu/prezto).

2. Source custom zsh+prezto config:

```bash
echo -e '\nsource "$HOME/.dotfiles/.zsh_custom"' >> ~/.zshrc
ln -fs ~/.dotfiles/.zpreztorc ~/.zpreztorc
```

### vim + tmux

```bash
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -fs ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
bash ~/.dotfiles/dottools/vimstall.sh
```

### git

```bash
cp ~/.dotfiles/.gitconfig ~
git config --global user.email "EMAIL_HERE"
```

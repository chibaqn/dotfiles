# dotfiles

## About

```shell
$ pwd
/Users/kaito_chiba/dev/dotfiles
$ sh dotfilesLink.sh
The dotfiles link process was successful.
```

## Vim Plugin Install
### 1. Vundle をcloneする

[VundleVim Quick Start](https://github.com/VundleVim/Vundle.Vim#quick-start)

```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### 2. vim のプラグインをインストールする

vimを開いた状態で下記のコマンドを実行。

```vim
:PluginInstall
```

コンソールで下記のコマンドを実行。

```bash
$ vim +PluginInstall +qall
```

## Tmux Install

利用しているパッケージ管理ツールにて tmux をインストールする。

```shell
# 例: Homebrew
$ brew install tmux
```

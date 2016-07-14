## 1. 安装vim

```
mac和ubuntu自带的vim版本太低，没有lua支持

$brew install vim --with-lua
```

## 2.

```
$cp ./vimrc ~/.vimrc
```

## 3.

安装vundle

## 需要特殊配置

### taglist

需要先安装ctags

```
mac
$brew install ctags

ubuntu
$sudo apt-get install exuberant-ctags
```

### YCM

PluginInstall后需要编译

```
$cd ~/.vim/bundle/youcompleteme
$./install.py --clang-completer
```

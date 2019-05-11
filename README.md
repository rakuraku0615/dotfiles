# dotfiles

### setting zsh
```
# install
$ sudo yum install zsh

# check ablirable shell
$ echo $SHELL
$ cat /etc/shells

# change shell
$ chsh -s /bin/zsh

# copy zsh setting files to root path
$ cp dotfiles/.zshrc ~/.
$ cp dotfiles/.zhistory ~/.

# install oh-my-zsh
$ curl -L http://install.ohmyz.sh | sh

# solve oh-my-zsh and zsh setting file
$ mv ~/.zshrc ~/.zshrc.oh-my-zsh
$ mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
$ vim .zshrc
$ add : source ~/.oh-my-zshrc
```

### setting tmux
```
# check tmux
$ tmux -V

# install tmux
$ sudo yum install tmux

# tmux setting file
$ cp dotfiles/.tmux.conf ~/.
```

### setting vim
```
$ cp -r dotfiles/.vim* ~/.
```
*require lua*
linux install sample
```
# check version
$ vim --version | grep lua
+lua

#install 
$ sudo yum install ncurses-devel lua lua-devel
$ git clone https://github.com/vim/vim.git
$ cd vim/
$ ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset
$ make
$ sudo make install

# set new vim to path
# check path
# export path

# check version
$ vim --version | grep lua
```

### peco
```
# move to home dir
$ cd ~/
# check newest version
$ https://github.com/peco/peco/releases
# install (change url to newest version)
$ sudo wget "https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_386.tar.gz"
# unzip
$ sudo tar xzvf peco_linux_386.tar.gz
# moce to peco dit
$ cd peco_linux_386
# change permission
$ sudo chmod +x peco
# set path
$ sudo cp peco /usr/local/bin
# check version
$ peco --version
```

### other tools
```
# htop
$ sudo yum install htop
# tig
$ sudo yum install tig
```

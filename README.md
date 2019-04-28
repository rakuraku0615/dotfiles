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
$ cp dotfiles/.tmux.conf ~/.
$ cp -r dotfiles/.vim* ~/.
```

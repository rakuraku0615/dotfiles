#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# ls setting
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

# auto complete
autoload -U compinit
compinit

# sqweeze auto comlete
setopt list_packed

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP
setopt nolistbeep

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# term color
TERM=xterm-256color
autoload -U colors
colors

PROMPT='[%*]local:%F{green}%~%f
%F{yellow}$%f '

# command history
# history file
HISTFILE=~/.zhistory
# history on memory
HISTSIZE=100000
# history on file
SAVEHIST=6000000
# ignoew duplicate 
setopt hist_ignore_dups
# save start and end
setopt EXTENDED_HISTORY

# command history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# auto cd
setopt auto_cd

# save dir history. "cd -tab" to show.
setopt auto_pushd

# choose correct command
setopt correct


# peco + git
alias gitch='git checkout $(git branch | sed "s/*//g" | sed "s/ //g" | peco)'
alias gitbd='git branch -D $(git branch | sed "s/*//g" | sed "s/ //g" | peco)'

function peco-select-gitadd() {
    local SELECTED_FILE_TO_ADD="$(git status --porcelain | \
                                  peco --query "$LBUFFER" | \
                                  awk -F ' ' '{print $NF}')"
    if [ -n "$SELECTED_FILE_TO_ADD" ]; then
      BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
      CURSOR=$#BUFFER
    fi
    zle accept-line
    # zle clear-screen
}
zle -N peco-select-gitadd
bindkey '^@' peco-select-gitadd

function peco-dir-open-app () {
    find . | peco | xargs sh -c 'vim "$0" < /dev/tty'
    zle clear-screen
}
zle -N peco-dir-open-app
bindkey '^f' peco-dir-open-app

function g-cmp() {

    # repository情報を取得
    REPO=`git remote -v | grep fetch | awk -F '[:. ]' '{print $3}'`

    # pecoを使って始まりと終わりのcommitを指定する
    START=`git log --pretty=oneline | peco`
    END=`git log --pretty=oneline | peco`

    # どちらかが選択されないとerror
    if [[ -z $START || -z $END ]];then
        echo "canceled comparison."
        return
    fi

    # 選択したcommit情報を出力
    echo " from : $START"
    echo " to   : $END"

    # 選択したcommitからcompareURLを生成
    START_COMMIT=`echo $START | awk '{print $1}'`
    END_COMMIT=`echo $END | awk '{print $1}'`
    URL="https://github.com/$REPO/compare/$START_COMMIT..$END_COMMIT"

    # 生成したURLを出力
    echo $URL
}

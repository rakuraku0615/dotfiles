" ==================== .vimrc base settings ==================
"""""" encoding
"encoding for vim
set encoding=utf-8
"encoding for using muti-bite
scriptencoding utf-8
"encoding for read files
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
"encoding for write to file
set fileencoding=utf-8
"encoding for output in terminal
set termencoding=utf-8

"""""" base
"show line number
set number
"show modifying file title
set title
"highlights matched bracket
set showmatch
"change indent to 4 spaces
set tabstop=4
"shift auto indent to 4 spaces
set shiftwidth=4
"autoindent
set smartindent
set autoindent
"use spaces for tab
set expandtab
"backup file path and dir path
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup
"able to open modifying file
set hidden
"do increment search
set incsearch
"able to use backspase for insert mode
set backspace=indent,eol,start
"underline current line
set cursorline
"cumtome for cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
"command complete
set wildmenu

"""""" theme color
"add color to code
syntax on
"color scheme
colorscheme molokai
"color setting for tmux
set t_ut=
set t_Co=256

"""""" text search
"search for both case
set ignorecase
"distinguish letter for uppercase is included
set smartcase
"go back to top at last of file
set wrapscan "検索時に最後まで行ったら最初に戻る
"highlight search result
set hlsearch

""""""" status line
"show file name
set statusline=%F
"show modify check
set statusline+=%m
"show readonly or not
set statusline+=%r
"show [HELP] when it is help page
set statusline+=%h
"show [PEAVIEW] when it is preview window
set statusline+=%w
"right justified
set statusline+=%=
"show file encoding
set statusline+=[ENC=%{&fileencoding}]
"show current line/max line
set statusline+=[LOW=%l/%L]
"always show status line (0:won't show 1:show it when there are more than 2 windows)
set laststatus=2
"show current mode
set showmode
"show used command
set showcmd
" show current posistion
set ruler

"""""" key config
nnoremap <ESC><ESC> :nohlsearch<CR>
inoremap <silent> jj <ESC>
" ==================== end: .vimrc base settings =============

" ==================== start: neobundle ======================
" setup
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

"""""" bundles
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
"""""" end bundles

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

""""" start: setting for neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
""""" end setting for neocomplete
" ==================== end: neobundle ========================

" ==================== file yanktmp.vimrc ====================
" map <silent> sy :call YanktmpYank()<CR>
" map <silent> sp :call YanktmpPaste_p()<CR>
" map <silent> sP :call YanktmpPaste_P()<CR>

if v:version < 700 || (exists('g:loaded_yanktmp') && g:loaded_yanktmp || &cp)
  finish
endif
let g:loaded_yanktmp = 1

if !exists('g:yanktmp_file')
  let g:yanktmp_file = $HOME."/.vim/vimtmp"
endif

function! YanktmpYank() range
  call writefile(getline(a:firstline, a:lastline), g:yanktmp_file, 'b')
endfunction

function! YanktmpPaste_p() range
  let pos = getpos('.')
  call append(a:firstline, readfile(g:yanktmp_file, "b"))
  call setpos('.', [0, pos[1] + 1, 1, 0])
endfunction

function! YanktmpPaste_P() range
  let pos = getpos('.')
  call append(a:firstline - 1, readfile(g:yanktmp_file, "b"))
  call setpos('.', [0, pos[1], 1, 0])
endfunction

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
" ==================== end: yanktmp.vimrc ====================



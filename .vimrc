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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'alvan/vim-closetag'
NeoBundle 'cohama/lexima.vim'
NeoBundle "ctrlpvim/ctrlp.vim"
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
let g:neosnippet#snippets_directory = '~/.vim/my_snippets'
""""" end setting for neocomplete
""""" start: setting for fugitive
"show quick list  after Ggrep
autocmd QuickFixCmdPost *grep* cwindow
"show current git branch
set statusline+=%{fugitive#statusline()}
""""" end setting for fugitive
""""" start: setting for NERDTree
"auto load NERDTree
autocmd vimenter * NERDTree

"NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
""""" end setting for NERDTree
""""" start: setting for auto closing
let g:closetag_filenames = '*.html,*.xhtml,*.php'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,php'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
augroup END
""""" end setting for auto closing

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

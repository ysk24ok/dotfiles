"-----
"vim reference
"-----
"anti-pattern: http://rbtnn.hateblo.jp/entry/2014/11/30/174749
"auto-completion: http://daisuzu.hatenablog.com/entry/2015/12/05/002129

"-----
"base setting
"-----
"utf-8
set encoding=utf-8
scriptencoding utf-8
"enable syntax highlight
syntax on
"set mapleader
let g:mapleader=','
"use 256 colors
"NOTE: &term and &t_Co is automatically set based on environment variable $TERM
"set term=xterm-256color
"set t_Co=256
"turn beep off
set vb t_vb=
"enable mouse control
set mouse=a
"enable backspace delete in INSERT mode
"equivalent to ':set backspace=indent,eol,start'
set backspace=2
"disable preview in autocomplete
set completeopt=menuone
"enable modeline
set modelines=1
"copy to clipboard
set clipboard=unnamed,autoselect

"-----
"vim-plug
"https://github.com/junegunn/vim-plug
"http://qiita.com/jiminko/items/f4b337ab41db751388f7
"-----
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
"Plug 'osyo-manga/vim-over'
"Plug 'vim-latex/vim-latex'
"Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
call plug#end()

"-----
"display setting
"-----
"set Solarized Dark
set background=dark
colorscheme solarized
"show statusline
set laststatus=2
"set filename on the window
set title
"set cursor position
set ruler
"set line number
set number
"change the background color of current line and column
hi clear CursorLine
hi clear CursorColumn
hi CursorLine cterm=NONE ctermbg=black guibg=black
hi CursorColumn cterm=NONE ctermbg=black guibg=black
set cursorline
set cursorcolumn
"visualize empty spaces at the end of lines
highlight WhitespaceEOL ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' \+$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL",  ' \+$')
"visualize tab characters
highlight TabString cterm=underline ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '\t')
au WinEnter * let w:m2 = matchadd("TabString", '\t')
"visualize full-width characters
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"-----
"control setting
"-----
"insert half-width space instead of tab
set expandtab
"width displayed for tab
set tabstop=2
"width inserted for tab
set shiftwidth=2
"width moved for tab
set softtabstop=2
"continue indent in new line
set autoindent
set smartindent
"settings per filetype
augroup FileTypeSetting
  autocmd!
  autocmd BufNewFile,BufRead *.go set tabstop=4 shiftwidth=4 noexpandtab
  autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.tt set filetype=html
augroup END
"autocompletion for quotation and parenthesis
"use ':set paste' to disable this autocompletion when pasted
"TODO: disable when there is a word
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap '<Enter> ''<Left><CR><ESC><S-o>
inoremap "<Enter> ""<Left><CR><ESC><S-o>
"turn paste off always when you leave intert mode
autocmd InsertLeave * set nopaste

"-----
"search setting
"-----
"distinguish case only when it contains uppercase
set ignorecase
set smartcase
"return to top of the file
set wrapscan
"highlight words, and turn highlight off by Esc
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
"enable incremental search
set incsearch

"-----
"syntastic
"https://github.com/scrooloose/syntastic
":help syntastic-checkers
"-----
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_python_checkers=['pyflakes', 'pep8']

"-----
"vim-airline
"https://github.com/vim-airline/vim-airline
"-----
"let g:airline_powerline_fonts=1
"let g:Powerline_symbols='fancy'
let g:airline_left_sep="⮀"
let g:airline_right_sep="⮂"
let g:airline_left_alt_sep="⮁"
let g:airline_right_alt_sep="⮃"
let g:airline_linecolumn_prefix=' '

let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#branch#enabled=0
let g:airline#extensions#readonly#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#left_sep="⮀"
let g:airline#extensions#tabline#right_sep="⮂"
let g:airline#extensions#tabline#left_alt_sep="⮁"
let g:airline#extensions#tabline#right_alt_sep="⮃"

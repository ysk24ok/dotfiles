"Configuration file for vim
syntax on
scriptencoding utf-8
highlight Comment ctermfg=blue


"------------------
"NeoBundle Setting
"------------------
filetype off
if has( 'vim_starting' )
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'alpaca-tc/alpaca_powertabline'

"for vim-powerline setting
NeoBundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

"for latex setting
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

"for clojure setting
NeoBundle 'vim-scripts/VimClojure'
let vimclojure#Wantnailgun = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow= 1
let vimclojure#DynamicHighlighting = 1

NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'

"-------------------
"autocmd setting
"-------------------
filetype indent on
if has( 'autocmd' )
  filetype plugin indent on		"ファイルタイプ別インデント、プラグインを有効にする
  autocmd BufReadPost	*				"ファイルの前回閉じた位置を記憶する
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \	exe "normal g`\"" |
    \endif
endif


"--------------------
"base setting
"--------------------
set nocompatible		"viとの互換性をとらない（vim独自の拡張機能を使う為）
set encoding=utf8		"エンコーディング設定
set modelines=0			"CVE-2007-2438
set mouse=a					"全モードでマウス操作を有効にする
set vb t_vb=				"ビープ音を鳴らさない
set clipboard=unnamed,autoselect


"--------------------
"cursor
"--------------------
set whichwrap=b,s,h,l,<,>,[,]		"行頭行末の左右移動で行をまたぐ
set backspace=indent,eol,start	"Backspaceキーの影響範囲に制限を設けない


"--------------------
"display
"--------------------
set title          "タイトルをウィンドウ枠に表示する
set ruler          "カーソルの位置表示
set number         "行番号表示
"set cursorcolumn  "カーソル位置のカラムの背景色を変える
set showmatch      "対応する括弧を強調表示
"set cmdheight     "メッセージ表示欄を2行確保
set cursorline     "カーソル行の背景色を変える

"カレントウィンドウにのみ罫線を引く
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"行末の空白文字の可視化
highlight WhitespaceEOL ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' \+$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL",  ' \+$')

"行頭のTAB文字を可視化
highlight TabString cterm=underline ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t\+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t\+')

"行末のTAB文字を可視化
highlight TabStringEOL cterm=underline ctermbg=red guibg=red
au BufWinEnter * let w:m3 = matchadd("TabStringEOL", '\t\+$')
au WinEnter * let w:m3 = matchadd("TabStringEOL", '\t\+$')

"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m4 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m4 = matchadd("ZenkakuSpace", '　')

"--------------------
"edit
"--------------------
set tabstop=2					"タブを表示するときの幅
set shiftwidth=2			"タブを挿入するときの幅
set softtabstop=2			"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set expandtab				  "Tabキー押下時やインデントの際、タブ文字ではなく半角スペースが挿入される
set autoindent				"改行時に前の行のインデントを継続する
set smartindent				"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set clipboard=unnamed	"クリップボードを連携


"--------------------
"search
"--------------------
set ignorecase			"検索時に小文字と大文字を区別しない
set smartcase				"検索時に大文字で検索した場合にのみ大文字/小文字を区別する
set wrapscan				"最後まで検索したら先頭に戻る
set hlsearch				"検索文字列をハイライトする
set incsearch				"インクリメンタルサーチを行う
"set nonincsearch		"インクリメンタルサーチを行わない
nmap <Esc><Esc> :nohlsearch<CR><Esc>
  "検索文字列のハイライトをEscキー連打で解除
"nnoremap / /\v
  "正規表現のメタ文字を\無しで使えるようにする

"--------------------
"abbreviation setting
"--------------------
ab Mon Monday
ab Tue Tuesday
ab Wed Wednesday
ab Thu Thursday
ab Fri Friday
ab Sat Saturday
ab Sun Sunday

ab Jan January
ab Feb February
ab Sep September
ab Oct October
ab Nov November
ab Dec December

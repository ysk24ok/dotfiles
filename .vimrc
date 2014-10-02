"----------------------------
"vim global setting
"----------------------------
syntax on
scriptencoding utf-8
set t_Co=256
let mapleader=','


"----------------------------
"NeoBundle setting
"----------------------------
filetype off
if has( 'vim_starting' )
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/syntastic'


"----------------------------
"autocmd setting
"----------------------------
filetype indent on
if has( 'autocmd' )
    filetype plugin indent on   "ファイルタイプ別インデント、プラグインを有効にする
    autocmd BufReadPost *       "ファイルの前回閉じた位置を記憶する
        \if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \endif
endif


"----------------------------
"unite.vim setting
"----------------------------
NeoBundle 'Shougo/unite.vim'
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

"vinarise
let g:vinarise_enable_auto_detect = 1

"unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>


"----------------------------
"vim-surround setting
"http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
"----------------------------
NeoBundle 'tpope/vim-surround'


"----------------------------
"NERDtree setting
"----------------------------
NeoBundle 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1      "隠しファイルをデフォルトで表示させる

"<mapleader>nを:NERDTreeにエイリアス
nnoremap <silent> <Leader>n :NERDTree<CR>
"デフォルトでツリーを表示させる
"autocmd VimEnter * execute 'NERDTree'


"----------------------------
"vim-over setting
"http://qiita.com/syui/items/3a1af1301ee197b32a8a
"----------------------------
NeoBundle 'osyo-manga/vim-over'
"<mapleader>mを:OverCommandlineにエイリアス
nnoremap <silent> <Leader>m :OverCommandLine<CR>
"カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
"コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!','g')<CR>!!gI<Left><Left><Left>


"----------------------------
"yankround.vim setting
"http://qiita.com/syui/items/3a1af1301ee197b32a8a
"----------------------------
NeoBundle 'LeafCage/yankround.vim'
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


"----------------------------
"neocomplete.vim setting
"https://github.com/Shougo/neocomplete.vim
"----------------------------
NeoBundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup=1     "use neocomplete
let g:neocomplete#enable_smart_case=1     "use smartcase

hi Pmenu ctermfg=0 ctermbg=255
hi PmenuSel ctermfg=0 ctermbg=1
hi PmenuSbar ctermfg=0 ctermbg=255


"----------------------------
"vim-airline setting
"----------------------------
NeoBundle 'bling/vim-airline'
"let g:airline_powerline_fonts=1
let g:airline_linecolumn_prefix=' '
let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#branch#enabled=0
let g:airline#extensions#readonly#enabled=0

"display tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
"let g:airline#extensions#tabline#left_sep='▶︎'
"let g:airline#extensions#tabline#right_sep='◀︎'
let g:airline#extensions#tabline#left_alt_sep='>'
let g:airline#extensions#tabline#right_alt_sep='<'

let g:Powerline_symbols='fancy'
let g:airline_left_sep=''
let g:airline_right_sep=''


"----------------------------
"latex setting
"----------------------------
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'


"----------------------------
"markdown setting
"----------------------------
NeoBundle 'plasticboy/vim-markdown'
au BufRead, BufNewFile *.md set filetype=markdown


"----------------------------
"vim-jp/cpp-vim setting
"http://vim-jp.org/blog/2012/06/14/vim-jp-become-maintenar-of-cpp-vim.html
"----------------------------
NeoBundle 'vim-jp/cpp-vim'
let g:syntastic_cpp_compiler='-std=c++11'


"----------------------------
"javascript setting
"----------------------------
NeoBundle 'jelera/vim-javascript-syntax'


"----------------------------
"clojure setting
"----------------------------
NeoBundle 'vim-scripts/VimClojure'
let vimclojure#Wantnailgun = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow= 1
let vimclojure#DynamicHighlighting = 1

NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'


"----------------------------
"base
"----------------------------
set nocompatible    "viとの互換性をとらない（vim独自の拡張機能を使う為）
set encoding=utf8   "エンコーディング設定
set modelines=0     "CVE-2007-2438
set mouse=a         "全モードでマウス操作を有効にする
set vb t_vb=        "ビープ音を鳴らさない
set clipboard=unnamed,autoselect


"----------------------------
"cursor
"----------------------------
set whichwrap=b,s,h,l,<,>,[,]   "行頭行末の左右移動で行をまたぐ
set backspace=indent,eol,start  "Backspaceキーの影響範囲に制限を設けない


"----------------------------
"display
"----------------------------
set title          "タイトルをウィンドウ枠に表示する
set ruler          "カーソルの位置表示
set number         "行番号表示
"set cursorcolumn  "カーソル位置のカラムの背景色を変える
set showmatch      "対応する括弧を強調表示
"set cmdheight     "メッセージ表示欄を2行確保
set cursorline     "カーソル行の背景色を変える
set laststatus=2   "ステータスラインを表示する

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

"visualize tab character
highlight TabString cterm=underline ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '\t')
au WinEnter * let w:m2 = matchadd("TabString", '\t')

"visualize full-width character
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')


"----------------------------
"edit
"----------------------------
set tabstop=2         "タブを表示するときの幅
set shiftwidth=2      "タブを挿入するときの幅
set softtabstop=2     "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set expandtab         "Tabキー押下時やインデントの際、タブ文字ではなく半角スペースが挿入される
set autoindent        "改行時に前の行のインデントを継続する
set smartindent       "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set clipboard=unnamed "クリップボードを連携

"括弧・クォーテーションの自動補完
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

"----------------------------
"search
"----------------------------
set ignorecase        "検索時に小文字と大文字を区別しない
set smartcase         "検索時に大文字で検索した場合にのみ大文字/小文字を区別する
set wrapscan          "最後まで検索したら先頭に戻る
set hlsearch          "検索文字列をハイライトする
set incsearch         "インクリメンタルサーチを行う
"set nonincsearch     "インクリメンタルサーチを行わない
"nnoremap / /\v       "正規表現のメタ文字を\無しで使えるようにする
"検索文字列のハイライトをEscキー連打で解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"----------------------------
"abbreviation setting
"----------------------------
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

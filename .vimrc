"----------------------------
"vim global setting
"----------------------------
syntax on
scriptencoding utf-8
highlight Comment ctermfg=blue
set t_Co=256


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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'

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
"neocomplete.vim setting
"----------------------------
NeoBundle 'Shougo/neocomplete.vim'
    let g:neocomplete#enable_at_startup=1     "use neocomplete
    let g:neocomplete#enable_smart_case=1     "use smartcase

    hi Pmenu ctermfg=0 ctermbg=255
    hi PmenuSel ctermfg=0 ctermbg=1
    hi PmenuSbar ctermfg=0 ctermbg=255

"----------------------------
"lightline.vim setting
"----------------------------
"NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'landscape',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
    \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'mode': 'MyMode',
    \   'ctrlpmark': 'CtrlPMark',
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \   'syntastic': 'error',
    \ },
    \ 'separator': {'left': '▶︎', 'right': '<<'},
    \ 'subseparator': { 'left': '>', 'right': '<' }
    \ }

function! MyModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
    let fname = expand('%:t')
        return fname == 'ControlP' ? g:lightline.ctrlp_item :
            \ fname == '__Tagbar__' ? g:lightline.fname :
            \ fname =~ '__Gundo\|NERD_tree' ? '' :
            \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
            \ &ft == 'unite' ? unite#get_status_string() :
            \ &ft == 'vimshell' ? vimshell#get_status_string() :
            \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
            \ ('' != fname ? fname : '[No Name]') .
            \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
              let mark = ''  " edit here for cool mark
              let _ = fugitive#head()
              return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
      return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
            \ fname == 'ControlP' ? 'CtrlP' :
            \ fname == '__Gundo__' ? 'Gundo' :
            \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
            \ fname =~ 'NERD_tree' ? 'NERDTree' :
            \ &ft == 'unite' ? 'Unite' :
            \ &ft == 'vimfiler' ? 'VimFiler' :
            \ &ft == 'vimshell' ? 'VimShell' :
            \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
            return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                      \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


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

"TAB文字を可視化
highlight TabString cterm=underline ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '\t')
au WinEnter * let w:m2 = matchadd("TabString", '\t')

"全角スペースの表示
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
nmap <Esc><Esc> :nohlsearch<CR><Esc>
    "検索文字列のハイライトをEscキー連打で解除


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

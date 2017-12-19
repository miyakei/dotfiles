" " encoding settings
set encoding=utf-8
scriptencoding utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileformats=unix,dos,mac
" " バックアップをとる
" " 逆は [ set nobackup ]
set nobackup
" " 編集中のファイル名表示
set title
" " 検索履歴を50個残す
set history=50
" " 検索時に大文字小文字を区別しない
set ignorecase
" " 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" " 検索語にマッチした単語をハイライトする
" " 逆は [ set nohlsearch ]
set hlsearch
" " インクリメンタルサーチを使う
" 検索語を入れている途中から随時マッチする文字列の検索を開始
" " 逆は [ set noincsearch ]
set incsearch
" " 行番号を表示する
" " 逆は [ set nonumber ]
set number
" " 改行  $  やタブ  ^I  を可視化する
"タブ、空白、改行の可視化
set list
set list listchars=tab:¦_,trail:_,extends:>,precedes:<,nbsp:%
" " esc二回押しでハイライト削除
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

""全角スペースをハイライト表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

" " 括弧入力時に対応する括弧を強調する
set showmatch
" " 構文ごとに色分け表示する
" " 逆は [ syntax off ]
syntax on
" " [ syntax on ] の場合のコメント文の色を変更する
highlight Comment ctermfg=LightCyan
" " ウィンドウ幅で行を折り返す
" " 逆は [ set nowrap ]
set wrap

" " TAB
set tabstop=4     "" 表示上の幅
set shiftwidth=4  "" 自動インデントの長さ
set softtabstop=4 "" 連続した空白の削除数
set autoindent    "" 改行時に前の行のインデントを継続する
set smartindent   "" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" " swapファイルを作成しない
set noswapfile
" " 他のファイルにペースト
set clipboard=unnamedplus,autoselect
" " 自動閉じ括弧入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif


" *********** neobundleの設定（sshrc先でディレクトリなければ読み込まない）*************************
if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" " unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ul :<C-u>Unite -buffer-name=file file<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,up :<C-u>Unite -auto-preview<CR>

" " neocomplete用設定
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" " vim-yaml
NeoBundle 'stephpy/vim-yaml'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

endif
" *********** neobundleの設定（sshrc先でディレクトリなければ読み込まない）*************************

" " encoding settings
set encoding=utf-8
scriptencoding utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileformats=unix,dos,mac
" " バックアップをとる 逆は [ set nobackup ]
set nobackup
" " 編集中のファイル名表示
set title
" " backspaceを使う
set backspace=indent,eol,start
" " 検索履歴を50個残す
set history=50
" " 検索時に大文字小文字を区別しない
set ignorecase
" " 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" " 検索語にマッチした単語をハイライトする 逆は [ set nohlsearch ]
set hlsearch
" " インクリメンタルサーチを使う 逆は [ set noincsearch ]
set incsearch
" " 行番号を表示する 逆は [ set nonumber ]
set number
"タブ、空白、改行の可視化
set list
set list listchars=tab:¦_,trail:_,extends:>,precedes:<,nbsp:%
" " esc二回押しでハイライト削除
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
" " 括弧入力時に対応する括弧を強調する
set showmatch

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

" " 構文ごとに色分け表示する 逆は [ syntax off ]
syntax on
" " [ syntax on ] の場合のコメント文の色を変更する
highlight Comment ctermfg=LightCyan
" " ウィンドウ幅で行を折り返す 逆は [ set nowrap ]
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

"dein Scripts-----------------------------
if isdirectory(expand("~/.vim/bundles/dein.vim"))

if &compatible
	set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/dein.vim

" Required:
call dein#begin('~/.vim/bundles')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/Unite.vim')
call dein#add('Shougo/neomru.vim')
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Clean up unused plugins
function! s:deinClean()
	if len(dein#check_clean())
		call map(dein#check_clean(), 'delete(v:val, "rf")')
	else
		echo '[ERR] no disabled plugins'
	endif
endfunction
command! DeinClean :call s:deinClean()

endif
"End dein Scripts-------------------------

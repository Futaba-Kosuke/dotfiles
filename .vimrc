syntax enable

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" insert here your Neobundle plugins
" tree
NeoBundle 'scrooloose/nerdtree'
" colorscheme
NeoBundle 'w0ng/vim-hybrid'
" neovim plugins
NeoBundle 'roxma/nvim-yarp'
NeoBundle 'roxma/vim-hug-neovim-rpc'

" brackets
NeoBundle 'cohama/lexima.vim'

" deoplete
NeoBundle 'Shougo/deoplete.nvim'
" py
NeoBundle 'deoplete-plugins/deoplete-jedi'
" js
NeoBundle 'carlitux/deoplete-ternjs', { 'build': { 'mac': 'npm install -g tern', 'unix': 'npm install -g tern' }}
" C
" NeoBundle 'zchee/deoplete-clang'
" NeoBundle 'Shougo/deoplete-clangx'
" Go
NeoBundle 'fatih/vim-go'
NeoBundle 'deoplete-plugins/deoplete-go', {'build': {'unix': 'make'}}

" markdown
NeoBundle 'skanehira/preview-markdown.vim'

" load editor_config
NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'roxma/vim-hug-neovim-rpc'

" Flutter
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'thosakwe/vim-flutter'
NeoBundle 'villainy/deoplete-dart'

call neobundle#end()

" Required:
" default
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" set colors
set background=dark
colorscheme hybrid

set whichwrap=b,s,h,l,<,>,[,]

set backspace=indent,eol,start

map <C-w> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

let g:python3_host_prog = "/Users/futaba/.anyenv/envs/pyenv/shims/python"

" lexima with depplete setting
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
call lexima#insmode#map_hook('before', '<CR>', "<C-]><Space><BS>")

" deoplete settings
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#go#gocode_binary = '/usr/local/bin/go'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:deoplete#sources#ternjs#tern_bin = '$HOME/.config/yarn/global/node_modules/ternjs/bin/'
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#guess = 0
let g:deoplete#sources#ternjs#sort = 0
let g:deoplete#sources#ternjs#expand_word_forward = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#in_literal = 0
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ 'js',
                \ 'ts']

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set completeopt=menuone,noinsert
" deoplete key bind
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

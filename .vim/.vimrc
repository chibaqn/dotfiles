""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'simeji/winresizer'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/unite.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fenc=utf-8             "文字コードをUFT-8に設定"
set nobackup               "バックアップファイルを作らない"
set noswapfile             "スワップファイルを作らない"
set autoread               "編集中のファイルが変更されたら自動で読み直す"
set hidden                 "バッファが編集中でもその他のファイルを開けるように"
set showcmd                "入力中のコマンドをステータスに表示する"
set showmode               "現在のモードを表示する"
set pumheight=10           "補完メニューの高さを設定"
set ruler                  "ルーラーを表示"
set number                 "行番号を表示"
set cursorline             "現在の行を強調表示"
set visualbell             "ビープ音を可視化"
set showmatch              "括弧入力時の対応する括弧を表示"
set laststatus=2           "ステータスラインを常に表示"
set wrap                   "ウィンドウの幅より長い行は折り返して、次の行に続けて表示する"
set wildmode=list:longest  "コマンドラインの補完"
set virtualedit=block      "vim の矩形選択で文字が無くても右へ進める"
set virtualedit=onemore    "行末の1文字先までカーソルを移動できるように"
set cursorcolumn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list listchars=tab:\▸\-  "不可視文字を可視化(タブが「▸-」と表示される)"
set expandtab                "Tab文字を半角スペースにする"
set tabstop=2                "インデントをスペース2つ分に設定"
set tabstop=2                "行頭以外のTab文字の表示幅（スペースいくつ分）"
set shiftwidth=2             "行頭でのTab文字の表示幅"
set autoindent               "自動インデント"
set smartindent              "オートインデント"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase      "大文字小文字を無視"
set smartcase       "ignorecaseと合わせることで，小文字入力の時のみ大文字小文字を無視"
set incsearch       "インクリメンタルサーチ"
set hlsearch        "検索結果をハイライト"
set history=100     "コマンド、検索パターンを100個まで履歴に残す"

"ESCキー連打でハイライトを消す"
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 入力系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start   "挿入モードでバックスペースを有効にする"

"入力モードでのカーソル移動"
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"折り返し時に表示行単位での移動できるようにする"
nnoremap j gj
nnoremap k gk

"画面移動のコマンドを変更"
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

"タブ移動のコマンドを変更"
nnoremap sn gt
nnoremap sp gT

"画面分割のコマンドを変更"
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

"保存時に行末の空白を削除する"
autocmd BufWritePre * :%s/\s\+$//ge

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" カラースキーマ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme iceberg
let g:rehash256 = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ステータスラインの設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

"ステータスラインに表示する情報の指定"
set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]

"ESC後にすぐ反映されない対策"
if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ペースト設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTreeToggleのショートカットキー
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><C-n> :NERDTreeToggle<CR>

"隠しファイルを表示"
let g:NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"入力モードで開始する"
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

"バッファ一覧"
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"ファイル一覧"
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"レジスタ一覧"
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧"
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
"常用セット"
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"全部乗せ"
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"yankの履歴"
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>

"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"ESCを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

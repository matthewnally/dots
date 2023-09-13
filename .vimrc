set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/surround'
Plugin 'tpope/commentary'
Plugin 'machakann/vim-highlightedyank'
Plugin 'davidhalter/jedi-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:highlightedyank_highlight_duration = 100

set mouse=a
colorscheme desert
set nu
set relativenumber

set autoread

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent

set nowrap

set hlsearch
set incsearch

set termguicolors

set scrolloff=8 " " Minimum number of lines above and below cursor
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=0
" " Set block and Insert Mode cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" " Paths will search recursively down
set path+=**

" " Tab completion shows all
set wildmenu

let g:mapleader=" "

nnoremap <leader>ef :Ex<CR> 
" " Move selected text and keep indented
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" " Center cursor while half page jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" " Center cursor while searching 
nnoremap n nzzzv
nnoremap N nzzzv

" " Paste and delete to void registry
xnoremap <leader>p \"_dP
nnoremap <leader>d \"_dP
vnoremap <leader>d \"_dP

nnoremap Q <nop>

xnoremap <leader>s y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>
nnoremap <leader>s :%s///gI<Left><Left><Left><Left>

" " Remove highlights with c l
nnoremap <silent> <C-l> :nohl<CR>

" " Find buffers
nnoremap <leader>fb :ls<CR>:b 
" " Find files fuzzy
nnoremap <leader>ff :find *

" " Tagline
set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

autocmd FileType python compiler pylint
autocmd QuickFixCmdPost [^l]* cwindow

augroup python_format
    autocmd!
    autocmd BufWritePost *.py silent !black % -q && isort % --profile black
    autocmd BufWritePost *.py redraw!
    autocmd BufWritePost *.py silent !ctags -R . &
    autocmd BufWritePost *.py silent make! <afile> | silent redraw!
augroup end

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\


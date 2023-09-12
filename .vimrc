set mouse=a
set nu
set relativenumber


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
let g:netrw_browse_split=4
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

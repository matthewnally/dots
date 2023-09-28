colorscheme desert

" Enable mouse mode
set mouse=a


" Enable numbers and relative numbers
set nu
set relativenumber

" Reloads buffers if the file changes
set autoread

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nowrap

set hlsearch
set nohlsearch " Disables hlsearch on startup
set incsearch

set termguicolors

set scrolloff=8 " Minimum number of lines above and below cursor

set path+=** " Paths will search recursively down
set wildmenu " Tab completion shows all

" open splits to right and below
set splitright
set splitbelow

" Use space as the <leader> key
nnoremap <SPACE> <Nop>
let mapleader=" "

" File browser settings for IDE style browser
let g:netrw_liststyle=3 " Tree based list
" let g:netrw_banner=0 " Disable netrw banner
" let g:netrw_browse_split=4 " Open files in previous window by default
" let g:netrw_winsize=25
" let g:netrw_altv=1
" let g:netrw_alto=1

" Open netrw to the right on vim startup
" augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Lexplore
" augroup END
" Explorer Focus, opens explore to right
nnoremap <leader>ef :Ex<CR>
" Find buffers
nnoremap <leader>fb :ls<CR>:b
" Find files fuzzy
nnoremap <leader>ff :find

" Set block and Insert Mode cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" set ttimeout
" set ttimeoutlen=1
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
" set ttyfast

" Move selected text and keep indented
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Center cursor while half page jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Center cursor while searching
nnoremap n nzzzv
nnoremap N nzzzv

" Paste and delete to void registry
xnoremap <leader>p \"_dP
nnoremap <leader>d \"_dP
vnoremap <leader>d \"_dP
xnoremap <leader>y "*y
nnoremap <leader>y "*y

" Disables Ex mode with Q
nnoremap Q <nop>

" Open find and replace with visual selection
xnoremap <leader>s y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>
" Open find and replace
nnoremap <leader>s :%s/
" Remove highlights with c l
nnoremap <silent> <C-l> :nohl<CR>

" Open Config
nnoremap <silent> <leader>C :e ~/.config/vim/.vimrc<CR>

" Statusline setup with git branch
set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%{StatuslineGit()}
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

" Vim Specific Settings
if !has('nvim')
    augroup python
        autocmd!
        autocmd BufWritePre *.py :%!black - -q 2>/dev/null | isort - --profile=black 2>/dev/null
    augroup end
endif 

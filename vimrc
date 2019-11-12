"=====> Plugins management <=====
" add/delete plugins in .minpac.vim
" use :PackUpdate command inside Vim editor to install/update all plugins
command! PackUpdate source .minpac.vim | call PackInit() | call minpac#update('', {'do': 'source $MYVIMRC'})
" use :PackClean command to delete plugins not listed in .minpac.vim
command! PackClean  source .minpac.vim | call PackInit() | call minpac#clean()
command! PackStatus source .minpac.vim | call PackInit() | call minpac#status()

" Plugins configuration
colorscheme codedark
set background=dark

map <C-s-e> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
map  <Leader>n  :NERDTreeFind<CR>

let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

let g:deoplete#enable_at_startup = 1
let jsServer=substitute(system('which javascript-typescript-stdio'), '\n', '', 'g')
let g:LanguageClient_serverCommands = {
    \ 'javascript': [jsServer],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"=====> UX <=====
set number relativenumber "show line numbers
set cursorline
syntax enable "enable syntax processing

set showcmd "show last command (partial) entered in bottom bar (status line)
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

  " Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

  " Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
  call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

  " TABs spaces setup
set expandtab "turns TABs into spaces
set tabstop=2 "number of visual space per TAB on file read
set softtabstop=2 "number of space per TAB when editing
set shiftwidth=2 "number of sapce per indentation (>>)
set autoindent


"=====> Search <=====
set path+=** "search files also in subdirectories
set wildmenu "visual autocomplete for command menu

packadd! matchit "activate matchit plugin, '%' jumps to html tags, if/else/end, etc
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search


"=====> General <=====
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible "Don't care about Vi compatibility 
endif
"Load language specific indentation files (in ".vim/indent/[languagueName].vim),
" and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


"=====> Miscellaneous <=====
  "get a block cursor in GitBash
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

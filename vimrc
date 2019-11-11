"=====> Plugins management <=====
" add/delete plugins in .minpac.vim
" use :PackUpdate command inside Vim editor to install/update all plugins
command! PackUpdate source .minpac.vim | call PackInit() | call minpac#update('', {'do': 'source $MYVIMRC'})
" use :PackClean command to delete plugins not listed in .minpac.vim
command! PackClean  source .minpac.vim | call PackInit() | call minpac#clean()
command! PackStatus source .minpac.vim | call PackInit() | call minpac#status()

"=====> UX <=====
set number relativenumber "show line numbers
set cursorline
syntax enable "enable syntax processing
colorscheme codedark
set background=dark

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
set tabstop=2 "number of visual space per TAB on file read
set softtabstop=2 "number of space per TAB when editing
set shiftwidth=2 "number of sapce per indentation (>>)
set expandtab "turns TABs into spaces


"=====> Search <=====
set path+=** "search files also in subdirectories
set wildmenu "visual autocomplete for command menu

packadd! matchit "activate matchit plugin, '%' jumps to html tags, if/else/end, etc
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search


"=====> General <=====
set nocompatible "Don't care about Vi compatibility
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

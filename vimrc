"=====> Plugins management <=====
packadd minpac
if !exists('*minpac#init')
  echo "Pulling minpac package manager"
  !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
  source %
endif

call minpac#init()
"Base plugins
call minpac#add('k-takata/minpac', {'type': 'opt'}) "Plugin manager
call minpac#add('jiangmiao/auto-pairs') "auto-close {, [, (, ', ...
call minpac#add('tpope/vim-surround') "quickly change surrounding {, [, (, ', etc...

"Add desired plugins here
call minpac#add('tomasiser/vim-code-dark') "VSCode color theme
call minpac#add('tpope/vim-commentary') "'gcc' to comment lines
call minpac#add('tpope/vim-endwise') "add 'end' automatically for ruby files
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-repeat') "'.' key to work also with plugins commands

if !isdirectory($HOME . '/.vim/pack/minpac/start/vim-surround')
  call minpac#update('') "to update/pull all packages
endif
"call minpac#clean() "to remove unlisted packages


"=====> UX <=====
set number relativenumber "show line numbers
set cursorline
colorscheme codedark
set background=dark
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


"=====> Filetype dectection <=====
  "language specific indentation file loading in .vim/indent/[languagueName].vim
filetype indent on
  "Load plugins according to the detected filetype.
if has("autocmd")
  filetype plugin on
endif


"=====> Miscellaneous <=====
  "get a block cursor in GitBash
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

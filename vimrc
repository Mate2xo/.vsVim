set number relativenumber "show line numbers
"colorscheme codedark
set cursorline
set showcmd "show last command entered in bottom bar

	"Search
set path+=** "search files also in subdirectories
set wildmenu "visual autocomplete for command menu

syntax enable "enable syntax processing

	"TABs spaces setup
"set tabstop=4 "number of visual space per TAB on file read
"set softtabstop=4 "number of space per TAB when editing
"set expandtab "turns TABs into spaces

	"Filetype detection + language specific indentation file loading in
	".vim/indent/[languagueName].vim
"filetype indent on

"	get a block cursor in GitBash
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

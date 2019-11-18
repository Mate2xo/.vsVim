"===============> General <===============
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done first
  " and only when 'compatible' is set.
  set nocompatible "Don't care about Vi compatibility 
endif


"===============> Plugins management <===============
" add/delete plugins in minpac.vimrc
" use :PackUpdate command inside Vim editor to install/update all plugins
command! PackUpdate source ~/.vim/minpac.vimrc | call PackInit() | call minpac#update('', {'do': 'source $MYVIMRC'})
" use :PackClean command to delete plugins not listed in minpac.vimrc
command! PackClean  source ~/.vim/minpac.vimrc | call PackInit() | call minpac#clean()
command! PackStatus source ~/.vim/minpac.vimrc | call PackInit() | call minpac#status()

" Plugins configuration
colorscheme codedark

  " FZF
  set rtp+=~/.vim/pack/minpac/start/fzf
  nmap <C-p> :FZF<CR>
  nmap <C-f> :Ag<CR>
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)
  nmap <Leader>t :Tags<CR>

  " NERDTree
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowLineNumbers=1
  let NERDTreeAutoDeleteBuffer = 1
  map <C-s-e> :NERDTreeToggle<CR>
  map  <Leader>n  :NERDTreeFind<CR>

  " ALE
  let g:ale_fixers = {
  \  'javascript': ['prettier', 'eslint'],
  \  'css': ['prettier'],
  \}
  let g:ale_fix_on_save = 1

  " Autocompletion : Deoplete, LanguageClient, LSPs
  set omnifunc=ale#completion#OmniFunc

  let g:deoplete#enable_at_startup = 1

  let jsServer=substitute(system('which javascript-typescript-stdio'), '\n', '', 'g')
  let g:LanguageClient_serverCommands = {
      \ 'javascript': [jsServer],
  \ }
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

  " Neosnippets key-mappings.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <expr><TAB>
     \ pumvisible() ? "\<C-n>" :
     \ neosnippet#expandable_or_jumpable() ?
     \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif


" Some default settings are set with Sensible plugin
"===============> UX <===============
set number relativenumber "show line numbers
set cursorline

set termguicolors  "24 bits colors
  " Make truecolors work better for tmux
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

set showcmd "show last command (partial) entered in bottom bar (status line)
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned

set mouse=a		" Enable mouse usage (all modes)
set ttymouse=sgr  " mouse support on more than 220 cols

set smartindent
set tw:1337   " Don't set a line limit size

set clipboard=unnamed   " Link to OS clipboard

  " Allow syntax folding
  set foldmethod=syntax   
  set foldnestmax=10
  set foldlevel=100   " set nofoldenable
  nnoremap <Space> za

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

  " Save line folds history
  autocmd BufWinLeave * if expand("%") != "" | mkview | endif
  autocmd BufWinEnter * if expand("%") != "" | loadview | endif
  highlight Folded guifg=darkYellow
  
  " TABs spaces setup
  set expandtab "turns TABs into spaces
  set tabstop=2 "number of visual space per TAB on file read
  set softtabstop=2 "number of space per TAB when editing
  set shiftwidth=2 "number of sapce per indentation (>>)


"===============> Search <===============
set path+=** "search files also in subdirectories
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hls is  " hilight search matches

packadd! matchit "activate matchit plugin, '%' jumps to html tags, if/else/end, etc
set showmatch		" Show matching brackets.


"===============> Miscellaneous <===============
" Pull custom configurations
source ~/.vim/custom_settings.vimrc

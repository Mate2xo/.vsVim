"===============> General <===============
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done first
  " and only when 'compatible' is set.
  set nocompatible "Don't care about Vi compatibility 
endif

" Keyboard Shortcuts
  " comment lines with Ctrl-/
  nmap <C-_> gcc
  vmap <C-_> gc

  "File explorer
  nmap <Leader>E :NERDTreeToggle<CR> 
  nmap <Leader>n  :NERDTreeFind<CR>

  " Fuzzy search
  "Search file
  nmap <Leader>p :FZF<CR>
  "Search string in files
  nmap <Leader>F :Ag<CR>
  "search vim's :help tags
  nmap <Leader>h :Helptags<CR>

nmap <Leader>t :Tags<CR>


"===============> Plugins management <===============
" add/delete plugins in minpac.vimrc
" use :PackUpdate command inside Vim editor to install/update all plugins
command! PackUpdate source ~/.vim/minpac.vimrc | call PackInit() | call minpac#update('', {'do': 'source $MYVIMRC'})
" use :PackClean command to delete plugins not listed in minpac.vimrc
command! PackClean  source ~/.vim/minpac.vimrc | call PackInit() | call minpac#clean()
command! PackStatus source ~/.vim/minpac.vimrc | call PackInit() | call minpac#status()

colorscheme codedark

" FZF
  set rtp+=~/.vim/pack/minpac/start/fzf
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

" NERDTree
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowLineNumbers=1
  let NERDTreeAutoDeleteBuffer = 1

" Autocompletion : Deoplete, LanguageClient, LSPs
set omnifunc=syntaxcomplete#Complete
  
" CoC
"  Extensions
  let g:coc_global_extensions = [
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-tsserver',
        \ 'coc-json',
        \ 'coc-yaml',
        \ 'coc-snippets',
        \ 'coc-emmet',
        \ 'coc-prettier',
        \ 'coc-eslint',
        \ 'coc-pairs',
        \ 'coc-solargraph',
        \]

  set hidden " if hidden is not set, TextEdit might fail.

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  set cmdheight=2 " Better display for messages
  set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
  set shortmess+=c " don't give |ins-completion-menu| messages.
  set signcolumn=yes " always show signcolumns

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <F2> <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <Leader><d> <Plug>(coc-range-select)
  xmap <silent> <Leader><d> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Some default settings are set with Sensible plugin
"===============> UX <===============
set number relativenumber "show line numbers
set cursorline
  "get a block cursor in GitBash, change shape when going in Insert mode
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

set smartindent
set tw:1337   " Don't set a line limit size
  " TABs spaces setup
  set expandtab "turns TABs into spaces
  set tabstop=2 "number of visual space per TAB on file read
  set softtabstop=2 "number of space per TAB when editing
  set shiftwidth=2 "number of sapce per indentation (>>)

set mouse=a		" Enable mouse usage (all modes)
set ttymouse=sgr  " mouse support on more than 220 cols

set termguicolors  "24 bits colors
  " Make truecolors work better for tmux
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

set showcmd "show last command (partial) entered in bottom bar (status line)
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
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

set clipboard=unnamed   " Link to OS clipboard

" Allow syntax folding
  set foldmethod=syntax   
  set foldnestmax=10
  set foldlevel=100   " set nofoldenable
  highlight Folded guifg=darkYellow

  " Save line folds history
  " autocmd BufWinLeave * if expand("%") != "" | mkview | endif
  " autocmd BufWinEnter * if expand("%") != "" | loadview | endif

" For conceal markers. (automatically hide/change some characters)
  if has('conceal')
    set conceallevel=2 
    set concealcursor=n "hide only in Normal mode
  endif


"===============> Search <===============
set path+=** "search files also in subdirectories
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hls is  " hilight search matches

packadd! matchit "activate matchit plugin, '%' jumps to html tags, if/else/end, etc
set showmatch		" Show matching brackets.


"===============> Miscellaneous <===============

" Uncomment the following line to pull any local custom configurations. 
" source ~/.vim/custom_settings.vimrc

function! PackInit() abort
  packadd minpac
  if !exists('*minpac#init')
    if has('nvim')
      !git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
    else
      !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
    endif
    packadd minpac
  endif

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('tpope/vim-repeat') "'.' key to work also with plugins commands

    " Edition
  call minpac#add('jiangmiao/auto-pairs') "auto-close {, [, (, ', ...
  call minpac#add('tpope/vim-commentary') "'gcc' to comment lines
  call minpac#add('tpope/vim-endwise') "auto-insert 'end' keywords to 'if' control flows
  call minpac#add('tpope/vim-surround') "quickly change surrounding {, [, (, ', ...
  if has('nvim')
    call minpac#add('machakann/vim-highlightedyank') "briefly hilight yanked text
  endif

    " Search
  call minpac#add('junegunn/fzf', { 'do': './install --bin' })
  call minpac#add('junegunn/fzf.vim') "quick lookup of/jump to a file with <C-p>
  call minpac#add('scrooloose/nerdtree') "file tree sidebar
  call minpac#add('Xuyuanp/nerdtree-git-plugin') "show file git status in NerdTree

    " UI
  call minpac#add('vim-airline/vim-airline')  "enhanced status line
  call minpac#add('tomasiser/vim-code-dark') "VSCode color theme
  call minpac#add('tpope/vim-fugitive') "Git integration
  call minpac#add('mhinz/vim-signify') "Git diff in sign column
  call minpac#add('tpope/vim-sensible') "sensible vanilla default settings
  call minpac#add('kassio/neoterm') "terminal buffers management helpers
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')

    " Language support
  call minpac#add('sheerun/vim-polyglot')
  "
    " Autocompletion
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('honza/vim-snippets')

  if filereadable(expand('~/.vsVim/custom_plugins.vimrc'))
    source ~/.vsVim/custom_plugins.vimrc
  endif

  echo "Please wait... and restart Vim after updating plugins"
endfunction

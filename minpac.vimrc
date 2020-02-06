function! PackInit() abort
  packadd minpac
  if !exists('*minpac#init')
    !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
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

    " Search
  call minpac#add('junegunn/fzf', { 'do': './install --bin' })
  call minpac#add('junegunn/fzf.vim') "quick lookup of/jump to a file with <C-p>
  call minpac#add('scrooloose/nerdtree') "file tree sidebar
  call minpac#add('Xuyuanp/nerdtree-git-plugin') "show file git status in NerdTree

    " UI
  call minpac#add('vim-airline/vim-airline')  "enhanced status line
  call minpac#add('tomasiser/vim-code-dark') "VSCode color theme
  call minpac#add('tpope/vim-fugitive') "Git integration
  call minpac#add('tpope/vim-sensible') "sensible vanilla default settings

    " Language support
  call minpac#add('sheerun/vim-polyglot')
  "
    " Autocompletion
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('honza/vim-snippets')
  "
  " Uncomment the following line to pull any local custom configurations.
  " source ~/.vim/custom_plugins.vimrc

  echo "Please wait... and restart Vim after updating plugins"
endfunction

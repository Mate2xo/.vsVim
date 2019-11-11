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
  call minpac#add('tpope/vim-surround') "quickly change surrounding {, [, (, ', ...
  call minpac#add('tpope/vim-commentary') "'gcc' to comment lines
  call minpac#add('tpope/vim-endwise') "auto-insert 'end' keywords to 'if' control flows
    " Search
  call minpac#add('scrooloose/nerdtree') "file tree sidebar
  call minpac#add('Xuyuanp/nerdtree-git-plugin') "show file git status in NerdTree
  call minpac#add('ctrlpvim/ctrlp.vim') "quick lookup of/jump to a file with <C-p>
    " UI
  call minpac#add('tomasiser/vim-code-dark') "VSCode color theme
  call minpac#add('dense-analysis/ale') "asyncronous linter
endfunction


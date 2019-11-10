packadd minpac
if !exists('*minpac#init')
  echo 'Pulling minpac package manager\n'
  !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
  source %
endif
if exists('*minpac#init')
  "Base plugins
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'}) "Plugin manager

  "Add desired plugins here
  call minpac#add('jiangmiao/auto-pairs') "auto-close {, [, (, ', ...
  call minpac#add('tomasiser/vim-code-dark') "VSCode color theme
  call minpac#add('tpope/vim-commentary') "'gcc' to comment lines
  call minpac#add('tpope/vim-endwise') "add 'end' automatically for ruby files
  call minpac#add('tpope/vim-surround') "quickly change surrounding {, [, (, ', etc...
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-repeat') "'.' key to work also with plugins commands

  if !isdirectory($HOME . '/.vim/pack/minpac/start/vim-surround')
    call minpac#update('') "to update/pull all packages
    echo "Please reload vim for updates to take effect\n"
  endif
  "call minpac#clean() "to remove unlisted packages
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

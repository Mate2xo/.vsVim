function! PackInit() abort
  packadd minpac
  if !exists('*minpac#init')
    !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
    packadd minpac
  endif

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('jiangmiao/auto-pairs') "auto-close {, [, (, ', ...
  call minpac#add('tomasiser/vim-code-dark') "VSCode color theme
  call minpac#add('tpope/vim-commentary') "'gcc' to comment lines
  call minpac#add('tpope/vim-endwise') "add 'end' automatically for ruby files
  call minpac#add('tpope/vim-surround') "quickly change surrounding {, [, (, ', etc...
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-repeat') "'.' key to work also with plugins commands
endfunction


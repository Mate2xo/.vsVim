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
  
    " Autocompletion
  if has('python3')
    call minpac#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call minpac#add('roxma/nvim-yarp')
      call minpac#add('roxma/vim-hug-neovim-rpc')
    endif
    call minpac#add('Shougo/neosnippet.vim')
    call minpac#add('Shougo/neosnippet-snippets')
  else
    echo "Install Python3 to enable autocompletion through Deoplete plugin"
  endif

  function! Setup_LSPs(hooktype, name)
    !bash install.sh
    echo "Sudo permission is required to install javascript LSP"
    !sudo npm i -g javascript-typescript-langserver
  endfunction
  call minpac#add('autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': function('Setup_LSPs'),
      \ }) 
  echo "Please restart Vim after updating plugins"
endfunction

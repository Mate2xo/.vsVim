# VSCode for Vim

## What's this?

A simple, ready-to-use basic Vim IDE setup for web development with pre-configured plugin management. It's an attempt to bring VSCode's feel into Vim (as VSCode became too slow for me), and is aimed at beginner Vim users to get up and running quickly. It's still relatively snappy even on weak machines (tested on dual-core/3gb-RAM virtual machine)

## Set up

### Flavors

2 different flavors are available as switchable branches with git:
* `coc-js` (default) branch for a freshly-installed-VSCode-like setup
* `coc-ruby-js` branch for up-to-date ruby/rails support (with solargraph LSP) and rails very useful shortcuts (`:help rails`)
  * For Vim : check with `$ vim --version` if you have `+ruby`. If not, install and use either `vim-athena` or `vim-gnome` (this last one seems to be launchable via `$ vim.gtk3`).
  * For NeoVim : use `:checkhealth` to see if you need any dependencies

### Install

* In your home folder:
  * `$ git clone https://github.com/Mate2xo/.vsVim.git`
  * Choose the branch(flavor) you want to use in `~/.vsVim` folder
* If you use Vim:
  * `$ cat ~/.vsVim/coc-settings.json > ~/.vim/coc-settings.json`
  * `$ echo "source ~/.vsVim/vimrc" >> ~/.vimrc`
* If you use NeoVim:
  * `$ cat ~/.vsVim/coc-settings.json > ~/.config/nvim/coc-settings.json`
  * `$ echo "source ~/.vsVim/vimrc" >> ~/.config/nvim/init.vim`
* Launch Vim with `$ vim +PackUpdate`
* Restart Vim and start working

### Recommended

Install [The Silver Searcher (Ag)](https://github.com/ggreer/the_silver_searcher) to be able to search a pattern through file with `<Leader><Shift-F>` (equivalent of `<Ctrl-Shift-F>` in VScode). It's much faster than the default `$ find` command.

### If you want to share Vim and NeoVim's config

Follow these [instructions](https://thoughtbot.com/upcase/videos/meet-neovim) to connect NeoVim's config files to Vim. NeoVim will then use `~/.vim`'s setup. This could be an easy way to try NeoVim with your current Vim config

## What's included / How to use

Global documentation fuzzy search is available with `<Leader-H>`

* [minpac plugin manager](https://github.com/k-takata/minpac)
  This setup uses it's own plugin manager and should not conflit with your own plugin management solution, as it is only loaded when explicitly called.
  If you want to use only minpac to handle your plugins :
  * 1. register your plugins : create a `custom_plugins.vimrc` file in `~/.vsVim`, and add `call minpac#add('plugin/url/path')`. Check `~/.vsVim/minpac.vimrc` for some examples
  * 2. inside Vim, use `:PackUpdate` to install/update plugins.
  * `:PackClean` will uninstall any plugin that are not listed in `~/.vsVim/minpac.vimrc` and `~/.vsVim/custom_plugins.vimrc`.
* Essentials
  * [vim-repeat](https://github.com/tpope/vim-repeat): allow `.` command to be also usable for plugin commands
  * [vim-sensible](https://github.com/tpope/vim-sensible): set sensible vimrc defaults
  * [vim-polyglot](https://github.com/sheerun/vim-polyglot): languages pack (syntax highlighting, ...)
* Edition
  * [vim-commnentary](https://github.com/tpope/vim-commentary): `gcc` to comment a line of code
  * [vim-endwise](https://github.com/tpope/vim-endwise): auto-add 'end' keywords to 'if', 'def', ... statements
  * [auto-pair](https://github.com/jiangmiao/auto-pairs): auto-close {[("")]}
  * [vim-surround](https://github.com/tpope/vim-surround): quickly change surrounding {[("")]} : ``cs[{`` -> Changes Surrounding [] into {}
  * [vim-rails](https://github.com/tpope/vim-rails): for Ruby on Rails related shortcuts and commands
* Search plugins
  * [NERDTree](https://github.com/scrooloose/nerdtree) (file explorer). Access with `<Leader><Shift-E>`, once inside acces file menu with `m`. Documentation: `:help nerdtree`.
  * [FZF](https://github.com/junegunn/fzf.vim): Access fuzzy file search with `<Leader><p>`, fuzzy pattern search in files with `<Leader><Shift-F>`, :help documentation fuzzy search with `<Leader><h>`. Documentation: `:help fzf`
* Linting, Autocompletion (VSCode's language server): [CoC](https://github.com/neoclide/coc.nvim). A few sensible CoC extensions have been added and configured (prettier, emmet, JS language server, ...). Check the list in `vimrc`'s `g:coc_global_extensions`.
* Git integration: [vim-fugitive](https://github.com/tpope/vim-fugitive) and [vim-signify](https://github.com/mhinz/vim-signify)
  * status: `:GStatus`. Acces documentation from there with `g?`. E.g. `cc` to commit, `ca` to amend, `s` to stage file under cursor, `>` and `<` to turn git diff on/off, ...
  * log: `:Glog`. Navigate through the log quicklist with `:cn` and `:cp`, close the quicklist with `:cclo`
  * check `:help fugitive` for more
  * vim-signify plugin shows diff icons in the sign column
* Terminal integration: [neoterm](https://github.com/kassio/neoterm)
  * to pop a terminal window -> `:Ttoggle` in Vim, `<Ctrl-Space>` (or Ctrl-backtick) in NeoVim


### Contributions

Any suggestions would be very welcome!
I am a beginner Vim user, so some config errors might have been made. I tried to make everything clean though ; any pull request would be apreciated.

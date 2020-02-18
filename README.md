# VSCode for Vim

## What's this?

A simple, ready-to-use basic Vim IDE setup for web development with pre-configured plugin management. It's an attempt to bring VSCode's feel into Vim (as VSCode became too slow for me), and is aimed at beginner Vim users to get up and running quickly. It's still relatively snappy even on weak machines (tested on dual-core/3gb-RAM virtual machine)

## Set up

### If you use Ruby

* Check with `$ vim --version` if you have `+ruby`. If not, install and use either `vim-athena` or `vim-gnome` (this last one seems to be launchable via `$ vim.gtk3`).

### Recommended

* Install [The Silver Searcher (Ag)](https://github.com/ggreer/the_silver_searcher) to be able to search a pattern through file with `<Leader><Shift-F>` (equivalent of `<Ctrl-Shift-F>` in VScode). It's much faster than the default `$ find` command.

### Install (on a Linux environment)

* Clone this repo in your `~/` folder for linux users, or your default vim config folder for other OS (I don't know how other OS are setup with Vim, sorry).
* If you use NeoVim, follow these [instructions](https://thoughtbot.com/upcase/videos/meet-neovim) to connect NeoVim's config files to `~/.vim` folder
* Launch vim with `$ vim +PackUpdate` command
* Restart Vim and start working

### Customization

2 different flavors as switchable branches with git:
* `coc-js` (default) branch for a freshly-installed-VSCode-like setup
* `coc-ruby-js` branch for up-to-date ruby/rails support (with solargraph LSP) and rails very useful shortcuts (`:help rails`)

If you want to add your own customizations to this setup, without overwriting the `~/.vim` folder when you update this repo, create `custom_settings.vimrc` (for `vimrc` customization) and `custom_plugins.vimrc` (to add other plugins) files instead. These files are pulled at the end of `vimrc` and `minpac.vimrc` (you'll need to uncomment related lines in these files).

## What's included / How to use

Global documentation fuzzy search is available with `<Leader-H>`

* [minpac plugin manager](https://github.com/k-takata/minpac): just put the repo names of the plugins you want to add in `custom_plugins.vimrc` (take example on what's already included in `minpac.vimrc`), and run `:PackUpdate`, and/or `:PackClean` to delete plugins that are not listed there.
* Essentials:
  * [vim-repeat](https://github.com/tpope/vim-repeat): allow `.` command to be also usable for plugin commands
  * [vim-sensible](https://github.com/tpope/vim-sensible): set sensible vimrc defaults
  * [vim-polyglot](https://github.com/sheerun/vim-polyglot): languages pack (syntax highlighting, ...)
* Edition
  * [vim-commnentary](https://github.com/tpope/vim-commentary): `gcc` to comment a line of code
  * [vim-endwise](https://github.com/tpope/vim-endwise): auto-add 'end' keywords to 'if', 'def', ... statements
  * [auto-pair](https://github.com/jiangmiao/auto-pairs): auto-close {[("")]}
  * [vim-surround](https://github.com/tpope/vim-surround): quickly change surrounding {[("")]} : ``cs[{`` -> Changes Surrounding [] into {}
  * [vim-rails](https://github.com/tpope/vim-rails): for Ruby on Rails related shortcuts and commands
* Search plugins:
  * [NERDTree](https://github.com/scrooloose/nerdtree) (file explorer). Access with `<Leader><Shift-E>`, once inside acces file menu with `m`. Documentation: `:help nerdtree`.
  * [FZF](https://github.com/junegunn/fzf.vim): Access fuzzy file search with `<Leader><p>`, fuzzy pattern search in files with `<Leader><Shift-F>`, :help documentation fuzzy search with `<Leader><h>`. Documentation: `:help fzf`
* Linting, Autocompletion (VSCode's language server): [CoC](https://github.com/neoclide/coc.nvim). A few sensible CoC extensions have been added and configured (prettier, emmet, JS language server, ...). Check the list in `vimrc`'s `g:coc_global_extensions`.
* Git integration: [vim-fugitive](https://github.com/tpope/vim-fugitive) and [vim-signify](https://github.com/mhinz/vim-signify)
  * status: `:GStatus`. Acces documentation from there with `g?`. E.g. `cc` to commit, `ca` to amend, `s` to stage file under cursor, `>` and `<` to turn git diff on/off, ...
  * log: `:Glog`. Navigate through the log quicklist with `:cn` and `:cp`, close the quicklist with `:cclo`
  * check `:help fugitive` for more
  * vim-signify plugin shows diff icons in the sign column


### Contributions

Any suggestions would be very welcome!
I am a beginner Vim user, so some config errors might have been made. I tried to make everything clean though ; any pull request would be apreciated.

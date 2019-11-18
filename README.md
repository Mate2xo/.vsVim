# VSCode for Vim

## What's this?

A simple, ready-to-use basic Vim IDE setup for web development with pre-configured plugin management. It's an attempt to bring VSCode's feel into Vim (as VSCode became too slow for me), and is aimed at beginner Vim users to get up and running quickly.

## Set up

### Required

* Check with `$ vim --version` if you have `+ruby` and `+python3` support. If not, install and use either `vim-athena` or `vim-gnome` (this last one seems to be launchable via `$ vim.gtk3`). If you don't care about Ruby programming, then just check that `+python3` support is enabled.
* `python3` should be installed on your local machine, as well as `pynvim`(`$ pip3 install --user pynvim`) for Deoplete plugin

### Optional

* Install [The Silver Searcher (Ag)](https://github.com/ggreer/the_silver_searcher) to be able to search a pattern through file with `<Ctrl-F>` (equivalent of `<Ctrl-Shift-F>` in VScode)

### Install

* Clone this repo in your `~/` folder for linux users, or your default vim config folder for other OS (I don't know how other OS are setup with Vim, sorry).
* Launch vim with `$ vim +PackUpdate` command
* Restart Vim and start working

### Customization

For different flavors of this basic setup switch your cloned `~/.vim` folder's branch:
* to the `ruby-rails` branch for up-to-date ruby support and rails very useful shortcuts (`:help rails`)
* to the `lite` branch for a version without language servers (snappier on older PCs). --work in progress

If you want to add your customizations to this setup, without overwriting the `~/.vim` folder when you update this repo, use the `custom_*.vimrc` files instead. These files are pulled at the end of `vimrc` and `minpac.vimrc`.

## What's included / How to use

* [minpac plugin manager](https://github.com/k-takata/minpac): just put the repo names of the plugins you want to add in `custom_plugins.vimrc` (take example on what's already included in `minpac.vimrc`), and run `:PackUpdate`, and/or `:PackClean` to delete plugins that are not listed there.
* Essentials:
  * [vim-repeat](https://github.com/tpope/vim-repeat): allow `.` command to be also usable for plugin commands
  * [vim-sensible](https://github.com/tpope/vim-sensible): set sensible vimrc defaults
* Edition
  * [vim-commnentary](https://github.com/tpope/vim-commentary): `gcc` to comment a line of code
  * [vim-endwise](https://github.com/tpope/vim-endwise): auto-add 'end' keywords to 'if', 'def', ... statements
  * [auto-pair](https://github.com/jiangmiao/auto-pairs): auto-close {[("")]}
  * [vim-surround](https://github.com/tpope/vim-surround): quickly change surrounding {[("")]}
* Search plugins:
  * [NERDTree](https://github.com/scrooloose/nerdtree) (file explorer). Access with `<Ctrl-E>`, acces file menu with `m`. Documentation: `:help nerdtree`.
  * [FZF](https://github.com/junegunn/fzf.vim): Access fuzzy file search with `<Ctrl-P>`, fuzzy pattern search in files with `<Ctrl-F>`. Documentation: `:help fzf`
* Linting: [ALE](https://github.com/dense-analysis/ale), linting manager
  * Will use whatever linter is already installed on your machine, out-of-the-box most of the time.
  * If your local project has no linting setup, ALE will fetch your global linter configuration according to the filetype (if it exists). Type `:ALEInfo` to know how linters are used on the current file
  * Add options to `ale_fixers` options in `vimrc` to activate auto-formatting. [Prettier](https://prettier.io) is set by default to auto-format css and javascript code on save.
  * Documentation: `:help ale`
* Autocompletion : [deoplete](https://github.com/Shougo/deoplete.nvim)
  * [Language-Client-neovim](https://github.com/autozimu/LanguageClient-neovim) is used to connect deoplete and Language Servers
  * Javascript LSP use javascript-typescript-langserver [npm](https://www.npmjs.com/get-npm) package, and will be installed with Language-Client-Neovim
  * [Neosnippet](https://github.com/Shougo/neosnippet.vim) adds snippets for many languages. Use `<Ctrl-K>` to expand the selected suggestion in the popup while typing.

## What's next

* Make auto-completion less clunky : in certain cases, suggestions have nothing to do with the context (especially `<Ctrl-X><Ctrl-O>` command. Especially useful for `lite` branches of this repo. Maybe switch to CoC?
* Get full compatibilty with Neovim (should be ok for most things, give me some feedback if I can update something)

### Contributions

Any suggestions would be very welcome!
I am a beginner Vim user, so some config errors might have been made. I tried to make everything clean though ; any pull request would be apreciated.
Also, CoC seems to be a better fit for the VSCode feel, instead of Deoplete. But Deoplete seems faster, which is very important for older PCs. Please share your insights if you think one option is better than another.

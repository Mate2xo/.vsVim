# VSCode for Vim

## What's this?

A simple, ready-to-use basic Vim IDE setup for web development with pre-configured plugin management. It's an attempt to bring VSCode's feel into Vim, as VSCode can unfortunately get very laggy sometimes.

## Set up

* Clone this repo in your ~/ folder
* Open any file with Vim, and use the `:PackUpdate` command

If you want to use some Ruby/Rails plugins added to this basic setup, switch your .vim folder to the `ruby-rails` branch

## What's included

* [minpac plugin manager](https://github.com/k-takata/minpac): just put the repo names of the plugins you want in `.minpac.vim`, and run `:PackUpdate`, and/or `:PackClean` to delete plugins that are not listed there.
* vimrc tuned to feel like a fresh install of VSCode
* search plugins:
  * [NERDTree](https://github.com/scrooloose/nerdtree) plugin (file explorer). Access with `<Ctrl> <Shift> e`, documentation: `:help nerdtree`
  * [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) plugin: Access fuzzy file search with `<Ctrl> p`, documentation: `:help ctrlp`

## Contributions

Any suggestions would be very welcome


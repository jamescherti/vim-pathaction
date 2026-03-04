# Vim Plugin: pathaction - A Vim plugin for executing `pathaction`, the universal Makefile for the entire filesystem

The **vim-pathaction** Vim plugin provides an interface for executing `.pathaction.yaml` rules directly from Vim through the [pathaction cli](https://github.com/jamescherti/pathaction), a flexible tool for running commands on files and directories.

Think of `pathaction` like a Makefile for your entire filesystem. It uses a `.pathaction.yaml` file to figure out which command to run, and you can even use Jinja2 templating to make those commands dynamic. You can also use tags to define multiple actions for the exact same file type, like setting up one tag to run a script, and another to debug it.

This tool is for software developers who manage multiple projects across diverse ecosystems and want to eliminate the cognitive load of switching between different build tools, environment configurations, and deployment methods. Just run one single command on any file and trust that it gets handled correctly.

If this package helps your workflow, please show your support by **⭐ starring pathaction.el on GitHub** to help more software developers discover its benefits.

## Usage

### Keybindings

Below are two examples of key bindings (`<leader>ee` to execute the "main" tag and `<leader>ei` to execute the "install" tag):

```vim
nnoremap <leader>ee :call pathaction#run("main")<CR>
nnoremap <leader>ei :call pathaction#run("install")<CR>
nnoremap <leader>ed :call pathaction#run("debug")<CR>
```

### Allow the directory explicitly

By default, `pathaction` does not read rule-set files such as `.pathaction.yaml` from arbitrary directories. The target directory must be explicitly permitted.

Run the following command to allow `pathaction` to read rule-set files from the project directory:

```
pathaction --allow-dir ~/projects
```

After this command completes, `.pathaction.yaml` files located in the `~/projects` directory will be recognized and processed.

## Author and license

Copyright (C) 2021-2026 [James Cherti](https://www.jamescherti.com).

Distributed under terms of the MIT license.

## Installation

### Installation with Vim's built-in package manager (Vim 8 and above)

```bash
mkdir -p ~/.vim/pack/jamescherti/start
cd ~/.vim/pack/jamescherti/start
git clone --depth 1 https://github.com/jamescherti/vim-pathaction
vim -u NONE -c "helptags vim-pathaction/doc" -c q
```

### Installation with a third-party plugin manager

You can also install this Vim plugin with any third-party plugin manager such as Pathogen or Vundle.

## Links

- [vim-pathaction @GitHub](https://github.com/jamescherti/vim-pathaction)
- The `pathaction` command-line tool (requirement): [pathaction cli](https://github.com/jamescherti/pathaction)
- For Emacs users: [pathaction.el](https://github.com/jamescherti/pathaction.el), an Emacs package that allows executing the `pathaction` command-line tool directly from Emacs.

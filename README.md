# pathaction.el - Execute commands on any files directly from Vim by applying rule definitions through the `pathaction` cli

The **vim-pathaction** Vim plugin provides an interface for executing `.pathaction.yaml` rules directly from Vim through the `pathaction` command-line tool.

The [pathaction](https://github.com/jamescherti/pathaction) command-line tool evaluates a target file or directory against a declarative rule set defined in `.pathaction.yaml` and runs the associated command automatically. By passing a path as an argument, actions are resolved and executed according to matching rules.

The rule set is written in YAML and supports Jinja2 templating, enabling dynamic command construction based on the target path. This separates configuration from execution logic and offers a flexible framework for automating file and directory operations.

## Customizations

### Keybindings

Below are two examples of key bindings (`<leader>ee` to execute the "main" tag and `<leader>ei` to execute the "install" tag):

```vim
nnoremap <leader>ee :call pathaction#run("main")<CR>
nnoremap <leader>ei :call pathaction#run("install")<CR>
```

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
- The `pathaction` command-line tool (requirement): [pathaction](https://github.com/jamescherti/pathaction)
- For Emacs users: [pathaction.el @GitHub](https://github.com/jamescherti/pathaction.el), an Emacs package that allows executing the `pathaction` command-line tool directly from Emacs.

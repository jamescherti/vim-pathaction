# vim-pathaction - Execute the pathaction command-line tool from Vim
![License](https://img.shields.io/github/license/jamescherti/vim-pathaction)

Execute pathaction.yaml rules using the pathaction command-line tool from Vim.

(The [pathaction](https://github.com/jamescherti/pathaction) command-line tool enables the execution of specific commands on targeted files or directories. Its key advantage lies in its flexibility, allowing users to handle various types of files simply by passing the file or directory as an argument to the `pathaction` tool. The tool uses a `.pathaction.yaml` rule-set file to determine which command to execute. Additionally, Jinja2 templating can be employed in the rule-set file to further customize the commands.)

## Customizations

### Keybindings

Below are two examples of key bindings (`<leader>ee` to execute the "main" tag and `<leader>ei` to execute the "install" tag):

```vim
nnoremap <leader>ee :call pathaction#run("main")<CR>
nnoremap <leader>ei :call pathaction#run("install")<CR>
```

## Author and license

Copyright (C) 2021-2025 [James Cherti](https://www.jamescherti.com).

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

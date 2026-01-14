" Name:        pathaction.vim
" Description: Execute the pathaction command-line tool from Vim
"
" Maintainer:  James Cherti
" URL:         https://github.com/jamescherti/vim-pathaction
"
" Licence:     Copyright (C) 2021-2026 James Cherti
"              Distributed under terms of the MIT license.
"
"              Permission is hereby granted, free of charge, to any person
"              obtaining a copy of this software and associated documentation
"              files (the 'Software'), to deal in the Software without
"              restriction, including without limitation the rights to use,
"              copy, modify, merge, publish, distribute, sublicense, and/or
"              sell copies of the Software, and to permit persons to whom the
"              Software is furnished to do so, subject to the following
"              conditions: The above copyright notice and this permission
"              notice shall be included in all copies or substantial portions
"              of the Software.  THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT
"              WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
"              LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
"              PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"              AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
"              OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
"              OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"              SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function! pathaction#edit() abort
  if &buftype !=# ''
    echoerr printf('pathaction: the buftype ''%s'' is not supported', &buftype)
    return
  endif

  if !executable('pathaction')
    echoerr 'pathaction: ''pathaction'' was not found in $PATH.'
    return
  endif

  let l:lines = systemlist('pathaction --list ' . shellescape(expand('%')))
  if v:shell_error !=# 0
    echoerr 'pathaction: ' . join(l:lines, "\n")
    return
  endif

  for l:line in l:lines
    if ! filereadable(l:line)
      continue
    endif

    tabnew
    execute ':edit ' . fnameescape(l:line)
  endfor
endfunction

function! pathaction#run(tag) abort
  if &modifiable && &buftype ==# ''
    write
  endif

  if !executable('pathaction')
    echoerr '''pathaction'' was not found in $PATH.'
    return
  endif

  let l:cmd_pathaction = ['pathaction', '--tag', a:tag,
        \                  '--confirm-after', expand('%:p')]

  call term_start(l:cmd_pathaction,
        \         {'term_name': "pathaction",
        \          'term_finish': 'close'})
endfunction

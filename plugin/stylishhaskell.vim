"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Name:         vim-codefmt-haskell
" Description:  Stylish-haskell plugin for vim-codefmt
" Author:       Leandro Penz <lpenz@lpenz.org>
" Url:          https://github.com/lpenz/vim-codefmt-haskell
" License:      Apache License 2.0
" Credits:      The authors of vim-codefmt and the related vim plugins
"               maktaba and glaive
"               (https://github.com/google/vim-codefmt)
"               syml for the rust-codefmt plugin that served as the basis for
"               this one
"               (https://github.com/syml/rust-codefmt)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:plugin = maktaba#plugin#Get('codefmt')
let s:registry = s:plugin.GetExtensionRegistry()

call s:plugin.Flag('stylish_haskell_executable', 'stylish-haskell')

function! stylishhaskell#GetStylishHaskellFormatter() abort
  let l:formatter = {
      \ 'name': 'stylish-haskell',
      \ 'setup_instructions': 'Install stylish-haskell ' .
          \ '(https://github.com/jaspervdj/stylish-haskell).'}

  function l:formatter.IsAvailable() abort
    return executable(s:plugin.Flag('stylish_haskell_executable'))
  endfunction

  function l:formatter.AppliesToBuffer() abort
    return &filetype is# 'haskell'
  endfunction

  ""
  " Reformat the current buffer with stylish-haskell or the binary named in
  " @flag(stylish_haskell_executable)
  " @throws ShellError
  function l:formatter.Format() abort
    let l:cmd = [s:plugin.Flag('stylish_haskell_executable')]

    let l:lines = getline(1, line('$'))
    let l:input = join(l:lines, "\n")

    let l:result = maktaba#syscall#Create(l:cmd).WithStdin(l:input).Call()
    let l:formatted = split(l:result.stdout, "\n")

    call maktaba#buffer#Overwrite(1, line('$'), l:formatted)
  endfunction

  return l:formatter
endfunction

call s:registry.AddExtension(stylishhaskell#GetStylishHaskellFormatter())

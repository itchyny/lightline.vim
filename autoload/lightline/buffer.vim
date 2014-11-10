" =============================================================================
" Filename: autoload/lightline/buffer.vim
" Version: 0.0
" Author: fouvrai
" License: MIT License
" Last Change: 2014/11/07 16:11:22.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! lightline#buffer#filename(n)
  let _ = expand("#".a:n.":t")
  return strlen(_) ? _ : '[No Name]'
endfunction

function! lightline#buffer#modified(n)
  return getbufvar(a:n, '&modified') ? '+' : getbufvar(a:n, '&modifiable') ? '' : '-'
endfunction

function! lightline#buffer#readonly(n)
  return getbufvar(a:n, '&readonly') ? 'RO' : ''
endfunction

function! lightline#buffer#bufnum(n)
  return a:n
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo


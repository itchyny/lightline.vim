" =============================================================================
" Filename: autoload/lightline/tab.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 16:22:50.
" =============================================================================

function! lightline#tab#filename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand("#".buflist[winnr - 1].":t")
  return strlen(_) ? _ : '[No Name]'
endfunction

function! lightline#tab#modified(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified', 0) ? '+' : gettabwinvar(a:n, winnr, '&modifiable', 1) ? '' : '-'
endfunction

function! lightline#tab#readonly(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly', 0) ? 'RO' : ''
endfunction

function! lightline#tab#tabnum(n)
  return a:n
endfunction

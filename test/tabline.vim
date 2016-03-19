let s:suite = themis#suite('tabline')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  let g:lightline = {}
  call lightline#init()
  tabnew
  tabonly
endfunction

function! s:suite.tabline()
  call s:assert.equals(&tabline, '%!lightline#tabline()')
endfunction

function! s:suite.enabled()
  let g:lightline = { 'enable': { 'tabline': 1 } }
  call lightline#init()
  call s:assert.equals(&tabline, '%!lightline#tabline()')
endfunction

function! s:suite.disabled()
  let g:lightline = { 'enable': { 'tabline': 0 } }
  call lightline#init()
  call s:assert.equals(&tabline, '')
endfunction

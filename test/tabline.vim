let s:suite = themis#suite('tabline')
let s:assert = themis#helper('assert')

function! s:suite.before()
  let g:lightline = {}
endfunction

function! s:suite.before_each()
  let g:lightline = {}
  call lightline#init()
  tabnew
  tabonly
endfunction

function! s:suite.tabline()
  call s:assert.equals(&tabline, '%!lightline#tabline()')
endfunction

function! s:suite.tabline_enabled()
  let g:lightline = { 'enable': { 'tabline': 1 } }
  call lightline#init()
  call s:assert.equals(&tabline, '%!lightline#tabline()')
endfunction

function! s:suite.tabline_disabled()
  let g:lightline = { 'enable': { 'tabline': 0 } }
  call lightline#init()
  call s:assert.equals(&tabline, '')
endfunction

function! s:tab(number, active, last) abort
  return '%' . a:number . 'T%{lightline#onetab(' . a:number . ',' . a:active . ')}' . (a:last ? '%T' : '')
endfunction

function! s:suite.init()
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1, 1)], []])
endfunction

function! s:suite.tabnew()
  tabnew
  call s:assert.equals(lightline#tabs(), [[s:tab(1, 0, 0)], [s:tab(2, 1, 1)], []])
endfunction

function! s:suite.tabnew_tabnew()
  tabnew
  tabnew
  call s:assert.equals(lightline#tabs(), [[s:tab(1, 0, 0), s:tab(2, 0, 0)], [s:tab(3, 1, 1)], []])
endfunction

function! s:suite.tabnew_tabfirst()
  tabnew
  tabfirst
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1, 0)], [s:tab(2, 0, 1)]])
endfunction

function! s:suite.tabnew_tabnew_tabfirst()
  tabnew
  tabnew
  tabfirst
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1, 0)], [s:tab(2, 0, 0), s:tab(3, 0, 1)]])
endfunction

function! s:suite.tabnew_tabnew_tabprevious()
  tabnew
  tabnew
  tabprevious
  call s:assert.equals(lightline#tabs(), [[s:tab(1, 0, 0)], [s:tab(2, 1, 0)], [s:tab(3, 0, 1)]])
endfunction

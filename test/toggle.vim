let s:suite = themis#suite('toggle')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  let g:lightline = {}
  call lightline#init()
  tabnew
  tabonly
endfunction

function! s:suite.default()
  call s:assert.equals(exists('#lightline'), 1)
  call s:assert.equals(exists('#lightline-disable'), 0)
  call s:assert.not_equals(&statusline, '')
  call s:assert.not_equals(&tabline, '')
endfunction

function! s:suite.disable_enable()
  call lightline#disable()
  call s:assert.equals(exists('#lightline'), 0)
  call s:assert.equals(exists('#lightline-disable'), 1)
  call s:assert.equals(&statusline, '')
  call s:assert.equals(&tabline, '')
  call lightline#update()
  call s:assert.equals(&statusline, '')
  call s:assert.equals(&tabline, '')
  call lightline#enable()
  call s:assert.equals(exists('#lightline'), 1)
  call s:assert.equals(exists('#lightline-disable'), 0)
  call s:assert.not_equals(&statusline, '')
  call s:assert.not_equals(&tabline, '')
  call lightline#disable()
  call lightline#disable()
  call lightline#enable()
  call lightline#enable()
  call s:assert.equals(exists('#lightline'), 1)
  call s:assert.equals(exists('#lightline-disable'), 0)
endfunction

function! s:suite.toggle()
  call lightline#toggle()
  call s:assert.equals(exists('#lightline'), 0)
  call s:assert.equals(exists('#lightline-disable'), 1)
  call s:assert.equals(&statusline, '')
  call s:assert.equals(&tabline, '')
  call lightline#toggle()
  call s:assert.equals(exists('#lightline'), 1)
  call s:assert.equals(exists('#lightline-disable'), 0)
  call s:assert.not_equals(&statusline, '')
  call s:assert.not_equals(&tabline, '')
endfunction

function! s:suite.toggle_tabline_disabled()
  let g:lightline = { 'enable': { 'tabline': 0 } }
  call lightline#init()
  call lightline#toggle()
  set tabline=TAB
  call lightline#toggle()
  let tabline = &tabline
  set tabline=
  call s:assert.equals(tabline, 'TAB')
endfunction

function! s:suite.disable_statusline_disabled()
  let g:lightline = { 'enable': { 'statusline': 0 } }
  call lightline#init()
  let [&g:statusline, &l:statusline] = ['GLOBAL', 'LOCAL']
  call lightline#disable()
  let [statusline, l_statusline] = [&g:statusline, &l:statusline]
  let [&g:statusline, &l:statusline] = ['', '']
  call lightline#enable()
  call s:assert.equals(statusline, 'GLOBAL')
  call s:assert.equals(l_statusline, 'LOCAL')
endfunction

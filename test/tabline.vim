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

function! s:tab(number, ...) abort
  let active = get(a:000, 0, 0)
  let last = get(a:000, 1, 0)
  return '%' . a:number . 'T%{lightline#onetab(' . a:number . ',' . active . ')}' . (last ? '%T' : '')
endfunction

function! s:suite.init()
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1, 1)], []])
endfunction

function! s:suite.tabnew()
  tabnew
  call s:assert.equals(lightline#tabs(), [[s:tab(1)], [s:tab(2, 1, 1)], []])
endfunction

function! s:suite.tabnew_tabnew()
  tabnew
  tabnew
  call s:assert.equals(lightline#tabs(), [[s:tab(1), s:tab(2)], [s:tab(3, 1, 1)], []])
endfunction

function! s:suite.tabnew_tabfirst()
  tabnew
  tabfirst
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1)], [s:tab(2, 0, 1)]])
endfunction

function! s:suite.tabnew_tabnew_tabfirst()
  tabnew
  tabnew
  tabfirst
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1)], [s:tab(2), s:tab(3, 0, 1)]])
endfunction

function! s:suite.tabnew_tabnew_tabprevious()
  tabnew
  tabnew
  tabprevious
  call s:assert.equals(lightline#tabs(), [[s:tab(1)], [s:tab(2, 1)], [s:tab(3, 0, 1)]])
endfunction

function! s:suite.tabnew_20()
  for i in range(19)
    tabnew
  endfor
  call s:assert.equals(lightline#tabs(), [[s:tab(1), s:tab(2), s:tab(3), s:tab(4), '...', s:tab(16), s:tab(17), s:tab(18), s:tab(19)], [s:tab(20, 1, 1)], []])
endfunction

function! s:suite.tabnew_20_tabfirst()
  for i in range(19)
    tabnew
  endfor
  tabfirst
  call s:assert.equals(lightline#tabs(), [[], [s:tab(1, 1)], [s:tab(2), s:tab(3), s:tab(4), s:tab(5), '...', s:tab(17), s:tab(18), s:tab(19), s:tab(20, 0, 1)]])
endfunction

function! s:suite.tabnew_20_tabfirst_tabnext()
  for i in range(19)
    tabnew
  endfor
  tabfirst
  tabnext
  call s:assert.equals(lightline#tabs(), [[s:tab(1)], [s:tab(2, 1)], [s:tab(3), s:tab(4), s:tab(5), s:tab(6), '...', s:tab(18), s:tab(19), s:tab(20, 0, 1)]])
endfunction

function! s:suite.tabnew_20_tabnext_10()
  for i in range(19)
    tabnew
  endfor
  tabnext 10
  call s:assert.equals(lightline#tabs(), [[s:tab(1), s:tab(2), '...', s:tab(8), s:tab(9)], [s:tab(10, 1)], [s:tab(11), s:tab(12), '...', s:tab(19), s:tab(20, 0, 1)]])
endfunction

function! s:suite.tabnew_20_tabprevious()
  for i in range(19)
    tabnew
  endfor
  tabprevious
  call s:assert.equals(lightline#tabs(), [[s:tab(1), s:tab(2), s:tab(3), '...', s:tab(15), s:tab(16), s:tab(17), s:tab(18)], [s:tab(19, 1)], [s:tab(20, 0, 1)]])
endfunction

function! s:suite.tabnew_20_tabprevious_tabprevious()
  for i in range(19)
    tabnew
  endfor
  tabprevious
  tabprevious
  call s:assert.equals(lightline#tabs(), [[s:tab(1), s:tab(2), s:tab(3), '...', s:tab(15), s:tab(16), s:tab(17)], [s:tab(18, 1)], [s:tab(19), s:tab(20, 0, 1)]])
endfunction

function! s:suite.onetab()
  call s:assert.equals(lightline#onetab(1, 1), '1 [No Name]')
endfunction

function! s:suite.onetab_tabnew()
  tabnew
  call s:assert.equals(lightline#onetab(1, 0), '1 [No Name]')
  call s:assert.equals(lightline#onetab(2, 1), '2 [No Name]')
endfunction

function! s:suite.onetab_tabnew_tabnew()
  tabnew
  tabnew
  call s:assert.equals(lightline#onetab(1, 0), '1 [No Name]')
  call s:assert.equals(lightline#onetab(2, 0), '2 [No Name]')
  call s:assert.equals(lightline#onetab(3, 1), '3 [No Name]')
endfunction

function! s:suite.onetab_modified()
  call append(0, '')
  call s:assert.equals(lightline#onetab(1, 1), '1 [No Name] +')
  undo
endfunction

function! s:suite.onetab_filename()
  edit test
  call s:assert.equals(lightline#onetab(1, 1), '1 test')
  tabnew
  bunload test
endfunction

function! s:suite.onetab_filename_modified()
  edit test
  call append(0, '')
  call s:assert.equals(lightline#onetab(1, 1), '1 test +')
  tabnew
  bunload! test
endfunction

function! s:suite.onetab_active_inactive()
  let g:lightline = { 'tab': { 'active': [ 'tabnum', 'filename' ], 'inactive': [ 'filename' ] } }
  call lightline#init()
  edit test
  call append(0, '')
  call s:assert.equals(lightline#onetab(1, 1), '1 test')
  call s:assert.equals(lightline#onetab(1, 0), 'test')
  tabnew
  bunload! test
endfunction

function! s:suite.tab_component()
  let g:lightline = { 'tab': { 'active': [ 'custom' ] }, 'tab_component': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(lightline#onetab(1, 1), 'custom')
  call s:assert.equals(lightline#onetab(2, 1), 'custom')
endfunction

function! s:suite.tab_component_function()
  function! Custom(n)
    return 'custom: ' . a:n
  endfunction
  let g:lightline = { 'tab': { 'active': [ 'custom' ] }, 'tab_component_function': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(lightline#onetab(1, 1), 'custom: 1')
  call s:assert.equals(lightline#onetab(2, 1), 'custom: 2')
  delfunction Custom
endfunction

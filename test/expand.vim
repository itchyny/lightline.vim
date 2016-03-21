let s:suite = themis#suite('expand')
let s:assert = themis#helper('assert')

function! s:suite.expand()
  let g:lightline = {}
  call lightline#init()
  call s:assert.equals(SID('expand')([]),
        \ [[], [], [0]])
endfunction

function! s:suite.default()
  let g:lightline = {}
  call lightline#init()
  call s:assert.equals(SID('expand')([['mode', 'paste'], ['readonly', 'filename', 'modified']]),
        \ [[['mode', 'paste'], ['readonly', 'filename', 'modified']], [[0, 0], [0, 0, 0]], [0, 1, 2]])
endfunction

function! s:suite.custom()
  function! Custom()
    return [ ['left'], ['middle'], ['right'] ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left', 'middle', 'right'], ['modified']], [[0, 0], [1, 1, 1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', 'middle', 'right', 'modified']], [[0, 0, 1, 1, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type()
  function! Custom()
    return [ ['left'], ['middle'], ['right'] ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['middle'], ['right'], ['modified']], [[0, 0], [1], [1], [1], [0]], [0, 1, 'custom', 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left'], ['middle'], ['right', 'modified']], [[0, 0, 1], [1], [1, 0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.multiple()
  function! Custom()
    return [ ['x0', 'x1', 'x2'], ['y0', 'y1', 'y2'], ['z0', 'z1', 'z2'] ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['x0', 'x1', 'x2', 'y0', 'y1', 'y2', 'z0', 'z1', 'z2'], ['modified']], [[0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'x0', 'x1', 'x2', 'y0', 'y1', 'y2', 'z0', 'z1', 'z2', 'modified']], [[0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.multiple_type()
  function! Custom()
    return [ ['x0', 'x1', 'x2'], ['y0', 'y1', 'y2'], ['z0', 'z1', 'z2'] ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['x0', 'x1', 'x2'], ['y0', 'y1', 'y2'], ['z0', 'z1', 'z2'], ['modified']], [[0, 0], [1, 1, 1], [1, 1, 1], [1, 1, 1], [0]], [0, 1, 'custom', 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'x0', 'x1', 'x2'], ['y0', 'y1', 'y2'], ['z0', 'z1', 'z2', 'modified']], [[0, 0, 1, 1, 1], [1, 1, 1], [1, 1, 1, 0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.flatten()
  function! Custom()
    return [ 'left', 'middle', 'right' ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left', 'middle', 'right'], ['modified']], [[0, 0], [1, 1, 1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', 'middle', 'right', 'modified']], [[0, 0, 1, 1, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_flatten()
  function! Custom()
    return [ 'left', 'middle', 'right' ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['middle'], ['right'], ['modified']], [[0, 0], [1], [1], [1], [0]], [0, 1, 'custom', 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left'], ['middle'], ['right', 'modified']], [[0, 0, 1], [1], [1, 0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_string()
  function! Custom()
    return 'custom'
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'custom', 'modified']], [[0, 0, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_string()
  function! Custom()
    return 'custom'
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_void_string()
  function! Custom()
    return ''
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_void_string()
  function! Custom()
    return ''
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_number()
  function! Custom()
    return 24
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['24'], ['modified']], [[0, 0], [1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', '24', 'modified']], [[0, 0, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_number()
  function! Custom()
    return 24
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['24'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename'], ['24'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_void_string_array()
  function! Custom()
    return ['', '', '']
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_void_string_array()
  function! Custom()
    return ['', '', '']
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_void_string_array_2()
  function! Custom()
    return [[''], [''], ['']]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_void_string_array_2()
  function! Custom()
    return [[''], [''], ['']]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_void_string_array_3()
  function! Custom()
    return ['', 'custom', '']
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'custom', 'modified']], [[0, 0, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_void_string_array_3()
  function! Custom()
    return ['', 'custom', '']
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_void_string_array_4()
  function! Custom()
    return [[''], ['custom'], ['']]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'custom', 'modified']], [[0, 0, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_void_string_array_4()
  function! Custom()
    return [[''], ['custom'], ['']]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename'], ['custom'], ['modified']], [[0, 0], [1], [0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_one()
  function! Custom()
    return [ 'left' ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['modified']], [[0, 0], [1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', 'modified']], [[0, 0, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_one()
  function! Custom()
    return [ 'left' ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['modified']], [[0, 0], [1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', 'modified']], [[0, 0, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_two()
  function! Custom()
    return [ 'left', 'middle']
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left', 'middle'], ['modified']], [[0, 0], [1, 1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', 'middle', 'modified']], [[0, 0, 1, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_two()
  function! Custom()
    return [ 'left', 'middle' ]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['middle'], ['modified']], [[0, 0], [1], [1], [0]], [0, 1, 'custom', 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left'], ['middle'], ['modified']], [[0, 0, 1], [1], [0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_mixed()
  function! Custom()
    return ['left', { 'custom': 24 }, [function('tr')]]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left', '{''custom'': 24}', 'function(''tr'')'], ['modified']], [[0, 0], [1, 1, 1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', '{''custom'': 24}', 'function(''tr'')', 'modified']], [[0, 0, 1, 1, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_mixed()
  function! Custom()
    return ['left', { 'custom': 24 }, [function('tr')]]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['{''custom'': 24}'], ['function(''tr'')'], ['modified']], [[0, 0], [1], [1], [1], [0]], [0, 1, 'custom', 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left'], ['{''custom'': 24}'], ['function(''tr'')', 'modified']], [[0, 0, 1], [1], [1, 0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_mixed_2()
  function! Custom()
    return [['left', ''], ['', { 'custom': 24 }, ''], [[function('tr')], '']]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left', '{''custom'': 24}', '[function(''tr'')]'], ['modified']], [[0, 0], [1, 1, 1], [0]], [0, 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left', '{''custom'': 24}', '[function(''tr'')]', 'modified']], [[0, 0, 1, 1, 1, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_mixed_2()
  function! Custom()
    return [['left', ''], ['', { 'custom': 24 }, ''], [[function('tr')], '']]
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['left'], ['{''custom'': 24}'], ['[function(''tr'')]'], ['modified']], [[0, 0], [1], [1], [1], [0]], [0, 1, 'custom', 1, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'left'], ['{''custom'': 24}'], ['[function(''tr'')]', 'modified']], [[0, 0, 1], [1], [1, 0]], [0, 'custom', 0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_error()
  function! Custom()
    throw 'error'
    return 'custom'
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.custom_type_error()
  function! Custom()
    throw 'error'
    return 'custom'
  endfunction
  let g:lightline = { 'component_expand': { 'custom': 'Custom' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
  delfunction Custom
endfunction

function! s:suite.notfound()
  let g:lightline = { 'component_expand': { 'custom': 'NotFound' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
endfunction

function! s:suite.custom_type_notfound()
  let g:lightline = { 'component_expand': { 'custom': 'NotFound' }, 'component_type': { 'custom': 'custom' } }
  call lightline#init()
  call s:assert.equals(SID('expand')([['readonly', 'filename'], ['custom'], ['modified']]),
        \ [[['readonly', 'filename'], ['modified']], [[0, 0], [0]], [0, 2, 3]])
  call s:assert.equals(SID('expand')([['readonly', 'filename', 'custom', 'modified']]),
        \ [[['readonly', 'filename', 'modified']], [[0, 0, 0]], [0, 1]])
endfunction

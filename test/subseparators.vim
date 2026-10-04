let s:suite = themis#suite('subseparators')
let s:assert = themis#helper('assert')

function! s:subseparators(...)
  return map(call(SID('subseparators'), a:000), 'eval(substitute(v:val, "^%{\\(.*\\)}$", "\\1", ""))')
endfunction

function! s:suite.subseparators_component()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', '|'])
endfunction

function! s:suite.subseparators_component_visible_condition_1()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '1', 'custom2': '1', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', '|'])
endfunction

function! s:suite.subseparators_component_visible_condition_2()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '0', 'custom2': '1', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', '|'])
endfunction

function! s:suite.subseparators_component_visible_condition_3()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '1', 'custom2': '0', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
endfunction

function! s:suite.subseparators_component_visible_condition_4()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '1', 'custom2': '0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
endfunction

function! s:suite.subseparators_component_visible_condition_5()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '0', 'custom2': '0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
endfunction

function! s:suite.subseparators_component_visible_condition_6()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '1||0', 'custom2': '0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
endfunction

function! s:suite.subseparators_component_visible_condition_7()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' }, 'component_visible_condition': { 'custom1': '1||1', 'custom2': '0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
endfunction

function! s:suite.subseparators_component_function_1()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_2()
  function! Custom1()
    return 'custom1'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom1
endfunction

function! s:suite.subseparators_component_function_3()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
  delfunction Custom1
  delfunction Custom2
endfunction

function! s:suite.subseparators_component_function_4()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
  delfunction Custom1
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_5()
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', '|'])
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_6()
  function! Custom1()
    return ''
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_7()
  function! Custom1()
    return ''
  endfunction
  function! Custom2()
    return ''
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_8()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return ''
  endfunction
  function! Custom3()
    return ''
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_visible_condition_1()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '1', 'custom2': '1', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', '|'])
endfunction

function! s:suite.subseparators_component_function_visible_condition_2()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '0', 'custom2': '1', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', '|'])
endfunction

function! s:suite.subseparators_component_function_visible_condition_3()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '1', 'custom2': '0', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
endfunction

function! s:suite.subseparators_component_function_visible_condition_4()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '1', 'custom2': '0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
endfunction

function! s:suite.subseparators_component_function_visible_condition_5()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return ''
  endfunction
  function! Custom3()
    return ''
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
endfunction

function! s:suite.subseparators_component_function_visible_condition_6()
  function! Custom1()
    return ''
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom2': '1', 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', '|'])
endfunction

function! s:suite.subseparators_component_function_visible_condition_7()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return ''
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom3': '1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
endfunction

function! s:suite.subseparators_component_function_visible_condition_8()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '1||0', 'custom2': '0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_function_visible_condition_9()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_function_visible_condition': { 'custom1': '0', 'custom2': '1||0', 'custom3': '0' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_expand_1()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_expand': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [1, 1, 1]), ['|', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_expand_2()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_expand': { 'custom1': 'Custom1' }, 'component_function': { 'custom2': 'Custom2', 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [1, 0, 0]), ['|', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_expand_3()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_expand': { 'custom1': 'Custom1', 'custom2': 'Custom2' }, 'component_function': { 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [1, 1, 0]), ['|', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_expand_4()
  function! Custom1()
    return ''
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2' }, 'component_expand': { 'custom3': 'Custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 1]), ['', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_expand_raw()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  function! Custom3()
    return 'custom3'
  endfunction
  let g:lightline = { 'component_expand': { 'custom1': 'Custom1', 'custom2': 'Custom2', 'custom3': 'Custom3' }, 'component_raw': { 'custom1': 1, 'custom2': 1, 'custom3': 1 } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [2, 2, 2]), ['|', '|'])
  delfunction Custom1
  delfunction Custom2
  delfunction Custom3
endfunction

function! s:suite.subseparators_component_not_found_1()
  function! Custom1()
    return 'custom1'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom1
endfunction

function! s:suite.subseparators_component_not_found_2()
  function! Custom2()
    return 'custom2'
  endfunction
  let g:lightline = { 'component_function': { 'custom2': 'Custom2' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['', ''])
  delfunction Custom2
endfunction

function! s:suite.subseparators_component_not_found_3()
  function! Custom1()
    return 'custom1'
  endfunction
  function! Custom2()
    return 'custom2'
  endfunction
  let g:lightline = { 'component_function': { 'custom1': 'Custom1', 'custom2': 'Custom2' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
  delfunction Custom1
  delfunction Custom2
endfunction

function! s:suite.subseparators_component_not_found_4()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3'], '|', [0, 0, 0]), ['|', ''])
endfunction

function! s:suite.subseparators_component_not_found_5()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2', 'custom3': 'custom3' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2', 'custom3', 'custom4'], '|', [0, 0, 0, 0]), ['|', '|', ''])
endfunction

function! s:suite.subseparators_no_components()
  let g:lightline = { 'component': { 'custom1': 'custom1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators([], '|', []), [])
endfunction

function! s:suite.subseparators_one_component()
  let g:lightline = { 'component': { 'custom1': 'custom1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1'], '|', [0]), [])
endfunction

function! s:suite.subseparators_one_component_not_found()
  let g:lightline = { 'component': { 'custom1': 'custom1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom2'], '|', [0]), [])
endfunction

function! s:suite.subseparators_two_components()
  let g:lightline = { 'component': { 'custom1': 'custom1', 'custom2': 'custom2' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2'], '|', [0, 0]), ['|'])
endfunction

function! s:suite.subseparators_two_components_not_found()
  let g:lightline = { 'component': { 'custom1': 'custom1' } }
  call lightline#init()
  call s:assert.equals(s:subseparators(['custom1', 'custom2'], '|', [0, 0]), [''])
endfunction

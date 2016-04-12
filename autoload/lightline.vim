" =============================================================================
" Filename: autoload/lightline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2016/04/13 00:03:51.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

let s:_ = 1

function! lightline#update() abort
  if s:_
    call lightline#init()
    call lightline#colorscheme()
  endif
  if !s:lightline.enable.statusline
    return
  endif
  let w = winnr()
  let s = winnr('$') == 1 ? [lightline#statusline(0)] : [lightline#statusline(0), lightline#statusline(1)]
  for n in range(1, winnr('$'))
    call setwinvar(n, '&statusline', s[n!=w])
    call setwinvar(n, 'lightline', n!=w)
  endfor
endfunction

function! lightline#update_once() abort
  if !exists('w:lightline') || w:lightline
    call lightline#update()
  endif
endfunction

function! lightline#update_disable() abort
  if !s:lightline.enable.statusline
    return
  endif
  call setwinvar(0, '&statusline', '')
endfunction

function! lightline#enable() abort
  call lightline#colorscheme()
  call lightline#update()
  if s:lightline.enable.tabline
    set tabline=%!lightline#tabline()
  endif
  augroup lightline
    autocmd!
    autocmd WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * call lightline#update()
    autocmd ColorScheme,SessionLoadPost * call lightline#highlight()
    autocmd CursorMoved,BufUnload * call lightline#update_once()
  augroup END
  augroup lightline-disable
    autocmd!
  augroup END
  augroup! lightline-disable
endfunction

function! lightline#disable() abort
  let [&statusline, &tabline] = [get(s:, '_statusline', ''), get(s:, '_tabline', '')]
  for t in range(1, tabpagenr('$'))
    for n in range(1, tabpagewinnr(t, '$'))
      call settabwinvar(t, n, '&statusline', '')
    endfor
  endfor
  augroup lightline
    autocmd!
  augroup END
  augroup! lightline
  augroup lightline-disable
    autocmd!
    autocmd WinEnter * call lightline#update_disable()
  augroup END
endfunction

function! lightline#toggle() abort
  if exists('#lightline')
    call lightline#disable()
  else
    call lightline#enable()
  endif
endfunction

let s:_lightline = {
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'inactive': {
      \     'left': [ [ 'filename' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \   },
      \   'tabline': {
      \     'left': [ [ 'tabs' ] ],
      \     'right': [ [ 'close' ] ]
      \   },
      \   'tab': {
      \     'active': [ 'tabnum', 'filename', 'modified' ],
      \     'inactive': [ 'tabnum', 'filename', 'modified' ]
      \   },
      \   'component': {
      \     'mode': '%{lightline#mode()}',
      \     'absolutepath': '%F', 'relativepath': '%f', 'filename': '%t', 'modified': '%M', 'bufnum': '%n',
      \     'spell': '%{&spell?&spelllang:"no spell"}',
      \     'paste': '%{&paste?"PASTE":""}', 'readonly': '%R', 'charvalue': '%b', 'charvaluehex': '%B',
      \     'fileencoding': '%{strlen(&fenc)?&fenc:&enc}', 'fileformat': '%{&fileformat}',
      \     'filetype': '%{strlen(&filetype)?&filetype:"no ft"}', 'percent': '%3p%%', 'percentwin': '%P',
      \     'lineinfo': '%3l:%-2v', 'line': '%l', 'column': '%c', 'close': '%999X X '
      \   },
      \   'component_visible_condition': {
      \     'modified': '&modified||!&modifiable', 'readonly': '&readonly', 'paste': '&paste'
      \   },
      \   'component_function': {},
      \   'component_expand': {
      \     'tabs': 'lightline#tabs'
      \   },
      \   'component_type': {
      \     'tabs': 'tabsel', 'close': 'raw'
      \   },
      \   'tab_component': {},
      \   'tab_component_function': {
      \     'filename': 'lightline#tab#filename', 'modified': 'lightline#tab#modified',
      \     'readonly': 'lightline#tab#readonly', 'tabnum': 'lightline#tab#tabnum'
      \   },
      \   'colorscheme': 'default',
      \   'mode_map': {
      \     'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
      \     'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL', '?': ''
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '|', 'right': '|' },
      \   'tabline_separator': {},
      \   'tabline_subseparator': {},
      \   'enable': { 'statusline': 1, 'tabline': 1 },
      \   '_mode_': {
      \     'n': 'normal', 'i': 'insert', 'R': 'replace', 'v': 'visual', 'V': 'visual', "\<C-v>": 'visual',
      \     'c': 'command', 's': 'select', 'S': 'select', "\<C-s>": 'select', 't': 'terminal'
      \   },
      \   'mode_fallback': { 'replace': 'insert', 'terminal': 'insert', 'select': 'visual' },
      \   'palette': {},
      \   'winwidth': winwidth(0),
      \ }
function! lightline#init() abort
  let s:lightline = deepcopy(get(g:, 'lightline', {}))
  for [key, value] in items(s:_lightline)
    if type(value) == type({})
      if !has_key(s:lightline, key)
        let s:lightline[key] = {}
      endif
      call extend(s:lightline[key], value, 'keep')
    elseif !has_key(s:lightline, key)
      let s:lightline[key] = value
    endif
    unlet value
  endfor
  call extend(s:lightline.tabline_separator, s:lightline.separator, 'keep')
  call extend(s:lightline.tabline_subseparator, s:lightline.subseparator, 'keep')
  let s:lightline.tabline_configured = 0
  for components in deepcopy(s:lightline.tabline.left + s:lightline.tabline.right)
    if len(filter(components, 'v:val !=# "tabs" && v:val !=# "close"')) > 0
      let s:lightline.tabline_configured = 1
      break
    endif
  endfor
  if !exists('s:_statusline')
    let s:_statusline = &statusline
  endif
  if !exists('s:_tabline')
    let s:_tabline = &tabline
  endif
  if s:lightline.enable.tabline
    set tabline=%!lightline#tabline()
  else
    let &tabline = get(s:, '_tabline', '')
  endif
  for f in values(s:lightline.component_function)
    silent! call eval(f . '()')
  endfor
  for f in values(s:lightline.tab_component_function)
    silent! call eval(f . '(0)')
  endfor
  let s:mode = ''
endfunction

function! lightline#colorscheme() abort
  try
    let s:lightline.palette = g:lightline#colorscheme#{s:lightline.colorscheme}#palette
  catch
    call lightline#error('Could not load colorscheme ' . s:lightline.colorscheme . '.')
    let s:lightline.colorscheme = 'default'
    let s:lightline.palette = g:lightline#colorscheme#{s:lightline.colorscheme}#palette
  finally
    let s:highlight = {}
    call lightline#highlight('normal')
    call lightline#link()
    let s:_ = 0
  endtry
endfunction

function! lightline#palette() abort
  return s:lightline.palette
endfunction

function! lightline#mode() abort
  return get(s:lightline.mode_map, mode(), s:lightline.mode_map['?'])
endfunction

let s:mode = ''
function! lightline#link(...) abort
  let mode = get(s:lightline._mode_, a:0 ? a:1 : mode(), 'normal')
  if s:mode == mode
    return ''
  endif
  let s:mode = mode
  if !has_key(s:highlight, mode)
    call lightline#highlight(mode)
  endif
  let [left, right, types] = [s:lightline.active.left, s:lightline.active.right, values(s:lightline.component_type)]
  for i in range(len(left))
    exec printf('hi link LightLineLeft_active_%d LightLineLeft_%s_%d', i, mode, i)
    exec printf('hi link LightLineLeft_active_%d_%d LightLineLeft_%s_%d_%d', i, i + 1, mode, i, i + 1)
    for j in types
      exec printf('hi link LightLineLeft_active_%d_%s LightLineLeft_%s_%d_%s', i, j, mode, i, j)
      exec printf('hi link LightLineLeft_active_%s_%d LightLineLeft_%s_%s_%d', j, i, mode, j, i)
    endfor
  endfor
  exec printf('hi link LightLineMiddle_active LightLineMiddle_%s', mode)
  for i in range(len(right))
    exec printf('hi link LightLineRight_active_%d LightLineRight_%s_%d', i, mode, i)
    exec printf('hi link LightLineRight_active_%d_%d LightLineRight_%s_%d_%d', i, i + 1, mode, i, i + 1)
    for j in types
      exec printf('hi link LightLineRight_active_%d_%s LightLineRight_%s_%d_%s', i, j, mode, i, j)
      exec printf('hi link LightLineRight_active_%s_%d LightLineRight_%s_%s_%d', j, i, mode, j, i)
    endfor
  endfor
  for j in types
    exec printf('hi link LightLineLeft_active_%s LightLineLeft_%s_%s', j, mode, j)
    exec printf('hi link LightLineRight_active_%s LightLineRight_%s_%s', j, mode, j)
    exec printf('hi link LightLineLeft_active_%s_%d LightLineLeft_%s_%s_%d', j, len(left), mode, j, len(left))
    exec printf('hi link LightLineLeft_active_%d_%s LightLineLeft_%s_%d_%s', len(left), j, mode, len(left), j)
    exec printf('hi link LightLineRight_active_%s_%d LightLineRight_%s_%s_%d', j, len(right), mode, j, len(right))
    exec printf('hi link LightLineRight_active_%d_%s LightLineRight_%s_%d_%s', len(right), j, mode, len(right), j)
    for k in types
      exec printf('hi link LightLineLeft_active_%s_%s LightLineLeft_%s_%s_%s', j, k, mode, j, k)
      exec printf('hi link LightLineLeft_active_%s_%s LightLineLeft_%s_%s_%s', k, j, mode, k, j)
      exec printf('hi link LightLineRight_active_%s_%s LightLineRight_%s_%s_%s', j, k, mode, j, k)
      exec printf('hi link LightLineRight_active_%s_%s LightLineRight_%s_%s_%s', k, j, mode, k, j)
    endfor
  endfor
  return ''
endfunction

function! s:term(l) abort
  return len(a:l) == 5 && type(a:l[4]) == 1 && strlen(a:l[4]) ? 'term='.a:l[4].' cterm='.a:l[4].' gui='.a:l[4] : ''
endfunction

if exists('*uniq')
  function! s:uniq(xs) abort
    return uniq(a:xs)
  endfunction
else
  function! s:uniq(xs) abort
    let i = len(a:xs) - 1
    while i > 0
      if a:xs[i] ==# a:xs[i - 1]
        call remove(a:xs, i)
      endif
      let i -= 1
    endwhile
    return a:xs
  endfunction
endif

function! lightline#highlight(...) abort
  let [c, f, g] = [s:lightline.palette, s:lightline.mode_fallback, s:lightline.component_type]
  if has('win32') && !has('gui_running') && &t_Co < 256
    for u in values(c)
      for v in values(u)
        for _  in v
          let [_[2], _[3]] = [lightline#colortable#gui2cui(_[0], _[2]), lightline#colortable#gui2cui(_[1], _[3])]
        endfor
      endfor
    endfor
  endif
  let [s:lightline.llen, s:lightline.rlen] = [len(c.normal.left), len(c.normal.right)]
  let [s:lightline.tab_llen, s:lightline.tab_rlen] = [len(has_key(c,'tabline') && has_key(c.tabline, 'left') ? c.tabline.left : c.normal.left), len(has_key(c,'tabline') && has_key(c.tabline, 'right') ? c.tabline.right : c.normal.right)]
  let h = s:uniq(sort(filter(values(g), 'v:val !=# "raw"')))
  let modes = a:0 ? [a:1] : extend(['normal', 'insert', 'replace', 'visual', 'inactive', 'command', 'select', 'tabline'], has('nvim') ? ['terminal'] : [])
  for mode in modes
    let s:highlight[mode] = 1
    let d = has_key(c, mode) ? mode : has_key(f, mode) && has_key(c, f[mode]) ? f[mode] : 'normal'
    let left = d ==# 'tabline' ? s:lightline.tabline.left : d ==# 'inactive' ? s:lightline.inactive.left : s:lightline.active.left
    let right = d ==# 'tabline' ? s:lightline.tabline.right : d ==# 'inactive' ? s:lightline.inactive.right : s:lightline.active.right
    let l = has_key(c,d) && has_key(c[d],'left') ? c[d].left : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'left') ? c[f[d]].left : c.normal.left
    let r = has_key(c,d) && has_key(c[d],'right') ? c[d].right : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'right') ? c[f[d]].right : c.normal.right
    let m = has_key(c,d) && has_key(c[d],'middle') ? c[d].middle[0] : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'middle') ? c[f[d]].middle[0] : c.normal.middle[0]
    let [w, x, n] = [len(left), len(right), s:term(m)]
    for i in range(w)
      let [li, lj] = [i < len(l) ? l[i] : m, i + 1 < len(l) ? l[i + 1] : m]
      let p = s:term(li)
      exec printf('hi LightLineLeft_%s_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, i, li[0], li[1], li[2], li[3], p)
      exec printf('hi LightLineLeft_%s_%d_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s', mode,
            \ i, i+1, i>=len(l) ? m[i+1==w] : li[1], i==w-1 ? m[1] : lj[1], i>=len(l) ? m[2+(i+1==w)] : li[3], i==w-1 ? m[3] : lj[3])
      for j in h
        let s = has_key(c,d) && has_key(c[d],j) ? c[d][j][0] : has_key(c,'tabline') && has_key(c.tabline,j) ? c.tabline[j][0] : has_key(c.normal,j) ? c.normal[j][0] : l[0]
        exec printf('hi LightLineLeft_%s_%d_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, i, j, li[1], s[1], li[3], s[3], p)
        exec printf('hi LightLineLeft_%s_%s_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, i, s[1], li[1], s[3], li[3], p)
      endfor
    endfor
    exec printf('hi LightLineMiddle_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, m[0], m[1], m[2], m[3], n)
    for i in range(x)
      let [ri, rj] = [i < len(r) ? r[i] : m, i + 1 < len(r) ? r[i + 1] : m]
      let p = s:term(ri)
      exec printf('hi LightLineRight_%s_%d_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s', mode,
            \ i, i+1, i>=len(r) ? m[i+1==x] : ri[1], i==x-1 ? m[1] : rj[1], i>=len(r) ? m[2+(i+1==x)] : ri[3], i==x-1 ? m[3] : rj[3])
      exec printf('hi LightLineRight_%s_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, i, ri[0], ri[1], ri[2], ri[3], p)
      for j in h
        let s = has_key(c,d) && has_key(c[d],j) ? c[d][j][0] : has_key(c,'tabline') && has_key(c.tabline,j) ? c.tabline[j][0] : has_key(c.normal,j) ? c.normal[j][0] : l[0]
        exec printf('hi LightLineRight_%s_%d_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, i, j, ri[1], s[1], ri[3], s[3], p)
        exec printf('hi LightLineRight_%s_%s_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, i, s[1], ri[1], s[3], ri[3], p)
      endfor
    endfor
    for j in h
      let s = has_key(c,d) && has_key(c[d],j) ? c[d][j][0] : has_key(c,'tabline') && has_key(c.tabline,j) ? c.tabline[j][0] : has_key(c.normal,j) ? c.normal[j][0] : l[0]
      let p = s:term(s)
      exec printf('hi LightLineLeft_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, s[0], s[1], s[2], s[3], p)
      exec printf('hi LightLineRight_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, s[0], s[1], s[2], s[3], p)
      exec printf('hi LightLineLeft_%s_%s_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, w, s[1], m[1], s[3], m[3], p)
      exec printf('hi LightLineLeft_%s_%d_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, w, j, m[1], s[1], m[3], s[3], n)
      exec printf('hi LightLineRight_%s_%s_%d guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, x, s[1], m[1], s[3], m[3], p)
      exec printf('hi LightLineRight_%s_%d_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, x, j, m[1], s[1], m[3], s[3], n)
      for k in h
        let t = has_key(c,d) && has_key(c[d],k) ? c[d][k][0] : has_key(c,'tabline') && has_key(c.tabline,k) ? c.tabline[k][0] : has_key(c.normal,k) ? c.normal[k][0] : l[0]
        let q = s:term(t)
        exec printf('hi LightLineLeft_%s_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, k, s[1], t[1], s[3], t[3], p)
        exec printf('hi LightLineLeft_%s_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, k, j, t[1], s[1], t[3], s[3], q)
        exec printf('hi LightLineRight_%s_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, j, k, s[1], t[1], s[3], t[3], p)
        exec printf('hi LightLineRight_%s_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, k, j, t[1], s[1], t[3], s[3], q)
      endfor
    endfor
  endfor
endfunction

function! s:subseparator(components, subseparator, expanded) abort
  let [c, f, v] = [ s:lightline.component, s:lightline.component_function,  s:lightline.component_visible_condition ]
  let xs = s:map(a:components, 'a:expanded[v:key] ? "1" : has_key(f, v:val) ?
        \ (exists("*".f[v:val]) ? "(".f[v:val]."()!=#\"\")" : "(exists(\"*".f[v:val]."\")?".f[v:val]."()!=#\"\":0)") :
        \ get(v, v:val, has_key(c, v:val) ? "1" : "0")')
  return '%{' . xs[0] . '&&(' . join(xs[1:], '||') . ')?"' . a:subseparator . '":""}'
endfunction

function! lightline#concatenate(xs, right) abort
  let separator = a:right ? s:lightline.subseparator.right : s:lightline.subseparator.left
  return join(filter(copy(a:xs), 'v:val !=# ""'), ' ' . separator . ' ')
endfunction

function! lightline#statusline(inactive) abort
  if a:inactive && !has_key(s:highlight, 'inactive')
    call lightline#highlight('inactive')
  endif
  return s:line(0, a:inactive)
endfunction

function! s:normalize(result) abort
  if type(a:result) == 3
    return map(a:result, 'type(v:val) == 1 ? v:val : string(v:val)')
  elseif type(a:result) == 1
    return [a:result]
  else
    return [string(a:result)]
  endif
endfunction

function! s:evaluate_expand(component) abort
  try
    let result = eval(a:component . '()')
    if type(result) == type('') && result ==# ''
      return []
    endif
  catch
    return []
  endtry
  return map(type(result) == 3 ? (result + [[], [], []])[:2] : [[], [result], []], 'filter(s:normalize(v:val), "v:val !=# ''''")')
endfunction

function! s:convert(name, index) abort
  if has_key(s:lightline.component_expand, a:name)
    let type = get(s:lightline.component_type, a:name, a:index)
    return filter(s:map(s:evaluate_expand(s:lightline.component_expand[a:name]), '[v:val, 1, v:key == 1 ? "' . type . '" : "' . a:index . '"]'), 'v:val[0] != []')
  else
    return [[[a:name], 0, a:index]]
  endif
endfunction

function! s:flatten_twice(xss) abort
  let ys = []
  for xs in a:xss
    for x in xs
      let ys += x
    endfor
  endfor
  return ys
endfunction

if v:version > 702 || v:version == 702 && has('patch295')
  let s:map = function('map')
else
  function! s:map(xs, f) abort
    let ys = []
    for i in range(len(a:xs))
      call extend(ys, map(a:xs[(i):(i)], substitute(a:f, 'v:key', i, 'g')))
    endfor
    return ys
  endfunction
endif

function! s:expand(components) abort
  let components = []
  let expanded = []
  let indices = []
  let previndex = -1
  let xs = s:flatten_twice(s:map(deepcopy(a:components), 'map(v:val, "s:convert(v:val, ''" . v:key . "'')")'))
  for [component, expand, index] in xs
    if previndex != index
      call add(indices, index)
      call add(components, [])
      call add(expanded, [])
    endif
    call extend(components[-1], component)
    call extend(expanded[-1], repeat([expand], len(component)))
    let previndex = index
  endfor
  call add(indices, string(len(a:components)))
  return [components, expanded, indices]
endfunction

function! s:line(tabline, inactive) abort
  let _ = a:tabline ? '' : '%{lightline#link()}'
  if s:lightline.palette == {}
    call lightline#colorscheme()
  endif
  let [l, r] = a:tabline ? [s:lightline.tab_llen, s:lightline.tab_rlen] : [s:lightline.llen, s:lightline.rlen]
  let [p, s] = a:tabline ? [s:lightline.tabline_separator, s:lightline.tabline_subseparator] : [s:lightline.separator, s:lightline.subseparator]
  let [c, f, t] = [s:lightline.component, s:lightline.component_function, s:lightline.component_type]
  let mode = a:tabline ? 'tabline' : a:inactive ? 'inactive' : 'active'
  let l_ = has_key(s:lightline, mode) ? s:lightline[mode].left : s:lightline.active.left
  let [lt, lc, ll] = s:expand(copy(l_))
  let r_ = has_key(s:lightline, mode) ? s:lightline[mode].right : s:lightline.active.right
  let [rt, rc, rl] = s:expand(copy(r_))
  for i in range(len(lt))
    let _ .= printf('%%#LightLineLeft_%s_%s#', mode, ll[i])
    for j in range(len(lt[i]))
      let x = substitute('%( '.(lc[i][j] ? lt[i][j] : has_key(f,lt[i][j])?'%{exists("*'.f[lt[i][j]].'")?'.f[lt[i][j]].'():""}':get(c,lt[i][j],'')).' %)', '^%(  %)', '', '')
      let _ .= has_key(t,lt[i][j])&&t[lt[i][j]]==#'raw'&&strlen(x)>7 ? x[3:-4] : x
      if j < len(lt[i]) - 1
        let _ .= s:subseparator(lt[i][(j):], s.left, lc[i][(j):])
      endif
    endfor
    let _ .= printf('%%#LightLineLeft_%s_%s_%s#', mode, ll[i], ll[i + 1]) . (i < l + len(lt) - len(l_) && ll[i] < l || type(ll[i]) != type(ll[i + 1]) || type(ll[i]) && type(ll[i + 1]) && ll[i] != ll[i + 1] ? p.left : len(lt[i]) ? s.left : '')
  endfor
  let _ .= printf('%%#LightLineMiddle_%s#%%=', mode)
  for i in reverse(range(len(rt)))
    let _ .= printf('%%#LightLineRight_%s_%s_%s#', mode, rl[i], rl[i + 1]) . (i < r + len(rt) - len(r_) && rl[i] < r || type(rl[i]) != type(rl[i + 1]) || type(rl[i]) && type(rl[i + 1]) && rl[i] != rl[i + 1] ? p.right : len(rt[i]) ? s.right : '')
    let _ .= printf('%%#LightLineRight_%s_%s#', mode, rl[i])
    for j in range(len(rt[i]))
      let x = substitute('%( '.(rc[i][j] ? rt[i][j] : has_key(f,rt[i][j])?'%{exists("*'.f[rt[i][j]].'")?'.f[rt[i][j]].'():""}':get(c,rt[i][j],'')).' %)', '^%(  %)', '', '')
      let _ .= has_key(t,rt[i][j])&&t[rt[i][j]]==#'raw'&&strlen(x)>7 ? x[3:-4] : x
      if j < len(rt[i]) - 1
        let _ .= s:subseparator(rt[i][(j):], s.right, rc[i][(j):])
      endif
    endfor
  endfor
  return _
endfunction

let s:tabnr = -1
let s:tabcnt = -1
let s:tabline = ''
function! lightline#tabline() abort
  if !has_key(s:highlight, 'tabline')
    call lightline#highlight('tabline')
  endif
  if s:lightline.tabline_configured || s:tabnr != tabpagenr() || s:tabcnt != tabpagenr('$')
    let s:tabnr = tabpagenr()
    let s:tabcnt = tabpagenr('$')
    let s:tabline = s:line(1, 0)
  endif
  return s:tabline
endfunction

function! lightline#tabs() abort
  let [x, y, z] = [[], [], []]
  let nr = tabpagenr()
  let cnt = tabpagenr('$')
  for i in range(1, cnt)
    call add(i < nr ? x : i == nr ? y : z, '%'. i . 'T%{lightline#onetab(' . i . ',' . (i == nr) . ')}' . (i == cnt ? '%T' : ''))
  endfor
  let abbr = '...'
  let n = min([max([s:lightline.winwidth / 40, 2]), 8])
  if len(x) > n && len(z) > n
    let x = extend(add(x[:n/2-1], abbr), x[-(n+1)/2:])
    let z = extend(add(z[:(n+1)/2-1], abbr), z[-n/2:])
  elseif len(x) + len(z) > 2 * n
    if len(x) > n
      let x = extend(add(x[:(2*n-len(z))/2-1], abbr), x[-(2*n-len(z)+1)/2:])
    elseif len(z) > n
      let z = extend(add(z[:(2*n-len(x)+1)/2-1], abbr), z[-(2*n-len(x))/2:])
    endif
  endif
  return [x, y, z]
endfunction

function! lightline#onetab(n, active) abort
  let _ = []
  for name in a:active ? s:lightline.tab.active : s:lightline.tab.inactive
    if has_key(s:lightline.tab_component_function, name)
      call add(_, call(s:lightline.tab_component_function[name], [a:n]))
    else
      call add(_, get(s:lightline.tab_component, name, ''))
    endif
  endfor
  return join(filter(_, 'v:val !=# ""'), ' ')
endfunction

function! lightline#error(msg) abort
  echohl ErrorMsg
  echomsg 'lightline.vim: '.a:msg
  echohl None
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

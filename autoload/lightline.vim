" =============================================================================
" Filename: autoload/lightline.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/29 20:09:38.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

let s:_ = 1

function! lightline#update()
  if s:_ | call lightline#init() | call lightline#colorscheme() | endif
  if !s:lightline.enable.statusline | return | endif
  let s = [lightline#statusline(0), lightline#statusline(1)]
  let w = winnr()
  for n in range(1, winnr('$'))
    call setwinvar(n, '&statusline', s[n!=w])
    call setwinvar(n, 'lightline', n!=w)
  endfor
endfunction

function! lightline#update_once()
  if !exists('w:lightline') || w:lightline | call lightline#update() | endif
endfunction

function! lightline#init()
  let s:lightline = deepcopy(get(g:, 'lightline', {}))
  for k in ['active', 'inactive', 'tabline', 'tab', 'mode_map', 'mode_fallback', 'enable',
        \ 'component', 'component_visible_condition', 'component_function', 'component_expand', 'component_type',
        \ 'tab_component', 'tab_component_function', 'separator', 'subseparator', 'tabline_separator', 'tabline_subseparator' ]
    if !has_key(s:lightline, k) | let s:lightline[k] = {} | endif
  endfor
  call extend(s:lightline.active, {
        \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ] }, 'keep')
  call extend(s:lightline.inactive, {
        \ 'left': [ [ 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ], [ 'percent' ] ] }, 'keep')
  call extend(s:lightline.tabline, {
        \ 'left': [ [ 'tabs' ] ],
        \ 'right': [ [ 'close' ] ] }, 'keep')
  call extend(s:lightline.tab, {
        \ 'active': [ 'tabnum', 'filename', 'modified' ],
        \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }, 'keep')
  call extend(s:lightline.mode_map, {
        \ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL',
        \ 'V': 'V-LINE', 'c': 'COMMAND', "\<C-v>": 'V-BLOCK', 's': 'SELECT',
        \ 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', '?': '      ' }, 'keep')
  let s:lightline._mode_ = {
        \ 'n': 'normal', 'i': 'insert', 'R': 'replace', 'v': 'visual', 'V': 'visual',
        \ 'c': 'command', "\<C-v>": 'visual', 's': 'select', 'S': 'select', "\<C-s>": 'select' }
  call extend(s:lightline.mode_fallback, { 'replace': 'insert', 'select': 'visual' })
  call extend(s:lightline.component, {
        \ 'mode': '%{lightline#mode()}',
        \ 'absolutepath': '%F', 'relativepath': '%f', 'filename': '%t', 'modified': '%M', 'bufnum': '%n',
        \ 'paste': '%{&paste?"PASTE":""}', 'readonly': '%R', 'charvalue': '%b', 'charvaluehex': '%B',
        \ 'fileencoding': '%{strlen(&fenc)?&fenc:&enc}', 'fileformat': '%{&fileformat}',
        \ 'filetype': '%{strlen(&filetype)?&filetype:"no ft"}', 'percent': '%3p%%', 'percentwin': '%P',
        \ 'lineinfo': '%3l:%-2v', 'line': '%l', 'column': '%c', 'close': '%999X X ' }, 'keep')
  call extend(s:lightline.component_visible_condition, {
        \ 'modified': '&modified||!&modifiable', 'readonly': '&readonly', 'paste': '&paste' }, 'keep')
  call extend(s:lightline.component_expand, { 'tabs': 'lightline#tabs' }, 'keep')
  call extend(s:lightline.component_type, { 'tabs': 'tabsel', 'close': 'raw' }, 'keep')
  call extend(s:lightline.tab_component_function, {
        \ 'filename': 'lightline#tab#filename', 'modified': 'lightline#tab#modified',
        \ 'readonly': 'lightline#tab#readonly', 'tabnum': 'lightline#tab#tabnum' }, 'keep')
  call extend(s:lightline.separator, { 'left': '', 'right': '' }, 'keep')
  call extend(s:lightline.subseparator, { 'left': '|', 'right': '|' }, 'keep')
  call extend(s:lightline.tabline_separator, s:lightline.separator, 'keep')
  call extend(s:lightline.tabline_subseparator, s:lightline.subseparator, 'keep')
  call extend(s:lightline, { 'palette': {}, 'colorscheme': 'default' }, 'keep')
  call extend(s:lightline.enable, { 'statusline': 1, 'tabline': 1 }, 'keep')
  if s:lightline.enable.tabline | set tabline=%!lightline#tabline() | endif
endfunction

function! lightline#colorscheme()
  try
    let s:lightline.palette = g:lightline#colorscheme#{s:lightline.colorscheme}#palette
  catch
    call lightline#error('Could not load colorscheme ' . s:lightline.colorscheme . '.')
    let s:lightline.colorscheme = 'default'
    let s:lightline.palette = g:lightline#colorscheme#{s:lightline.colorscheme}#palette
  finally
    call lightline#highlight()
    let s:_ = 0
  endtry
endfunction

function! lightline#mode()
  return get(s:lightline.mode_map, mode(), s:lightline.mode_map['?'])
endfunction

let s:mode = ''
function! lightline#link(...)
  let mode = get(s:lightline._mode_, a:0 ? a:1 : mode(), 'normal')
  if s:mode == mode | return '' | endif
  let s:mode = mode
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

function! s:term(l)
  return len(a:l) == 5 && type(a:l[4]) == 1 && strlen(a:l[4]) ? 'term='.a:l[4].' cterm='.a:l[4].' gui='.a:l[4] : ''
endfunction

function! lightline#highlight()
  let [c, f, g] = [s:lightline.palette, s:lightline.mode_fallback, s:lightline.component_type]
  if (has('win32') || has('win64')) && !has('gui_running')
    for u in values(c)
      for v in values(u)
        for _  in v | let [_[2], _[3]] = [lightline#colortable#gui2cui(_[0], _[2]), lightline#colortable#gui2cui(_[1], _[3])] | endfor
      endfor
    endfor
  endif
  let [s:lightline.llen, s:lightline.rlen] = [len(c.normal.left), len(c.normal.right)]
  let [s:lightline.tab_llen, s:lightline.tab_rlen] = [len(has_key(c,'tabline') ? c.tabline.left : c.normal.left), len(has_key(c,'tabline') ? c.tabline.right : c.normal.right)]
  for mode in ['normal', 'insert', 'replace', 'visual', 'inactive', 'command', 'select', 'tabline']
  let d = has_key(c, mode) ? mode : has_key(f, mode) && has_key(c, f[mode]) ? f[mode] : 'normal'
  let left = d == 'tabline' ? s:lightline.tabline.left : d == 'inactive' ? s:lightline.inactive.left : s:lightline.active.left
  let right = d == 'tabline' ? s:lightline.tabline.right : d == 'inactive' ? s:lightline.inactive.right : s:lightline.active.right
  let l = has_key(c,d) && has_key(c[d],'left') ? c[d].left : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'left') ? c[f[d]].left : c.normal.left
  let r = has_key(c,d) && has_key(c[d],'right') ? c[d].right : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'right') ? c[f[d]].right : c.normal.right
  let m = has_key(c,d) && has_key(c[d],'middle') ? c[d].middle[0] : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'middle') ? c[f[d]].middle[0] : c.normal.middle[0]
  for i in range(len(left))
    let [li, lj] = [i < len(l) ? l[i] : m, i + 1 < len(l) ? l[i + 1] : m]
    exec printf('hi LightLineLeft_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, i, li[0], li[1], li[2], li[3], s:term(li))
    exec printf('hi LightLineLeft_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', mode,
          \ i, i+1, i>=len(l) ? m[i+1==len(left)] : li[1], i==len(left)-1 ? m[1] : lj[1], i>=len(l) ? m[2+(i+1==len(left))] : li[3], i==len(left)-1 ? m[3] : lj[3])
    for j in values(g)
      let s = has_key(c,d) && has_key(c[d],j) ? c[d][j][0] : has_key(c,'tabline') && has_key(c.tabline,j) ? c.tabline[j][0] : has_key(c.normal,j) ? c.normal[j][0] : l[0]
      exec printf('hi LightLineLeft_%s_%d_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, i, j, li[1], s[1], li[3], s[3], s:term(li))
      exec printf('hi LightLineLeft_%s_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, i, s[1], li[1], s[3], li[3], s:term(li))
    endfor
  endfor
  exec printf('hi LightLineMiddle_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, m[0], m[1], m[2], m[3], s:term(m))
  for i in range(len(right))
    let [ri, rj] = [i < len(r) ? r[i] : m, i + 1 < len(r) ? r[i + 1] : m]
    exec printf('hi LightLineRight_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', mode,
          \ i, i+1, i>=len(r) ? m[i+1==len(right)] : ri[1], i==len(right)-1 ? m[1] : rj[1], i>=len(r) ? m[2+(i+1==len(right))] : ri[3], i==len(right)-1 ? m[3] : rj[3])
    exec printf('hi LightLineRight_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, i, ri[0], ri[1], ri[2], ri[3], s:term(ri))
    for j in values(g)
      let s = has_key(c,d) && has_key(c[d],j) ? c[d][j][0] : has_key(c,'tabline') && has_key(c.tabline,j) ? c.tabline[j][0] : has_key(c.normal,j) ? c.normal[j][0] : l[0]
      exec printf('hi LightLineRight_%s_%d_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, i, j, ri[1], s[1], ri[3], s[3], s:term(ri))
      exec printf('hi LightLineRight_%s_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, i, s[1], ri[1], s[3], ri[3], s:term(ri))
    endfor
  endfor
  for j in values(g)
    let s = has_key(c,d) && has_key(c[d],j) ? c[d][j][0] : has_key(c,'tabline') && has_key(c.tabline,j) ? c.tabline[j][0] : has_key(c.normal,j) ? c.normal[j][0] : l[0]
    exec printf('hi LightLineLeft_%s_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, s[0], s[1], s[2], s[3], s:term(s))
    exec printf('hi LightLineRight_%s_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, s[0], s[1], s[2], s[3], s:term(s))
    exec printf('hi LightLineLeft_%s_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, len(left), s[1], m[1], s[3], m[3], s:term(s))
    exec printf('hi LightLineLeft_%s_%d_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, len(left), j, m[1], s[1], m[3], s[3], s:term(m))
    exec printf('hi LightLineRight_%s_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, len(right), s[1], m[1], s[3], m[3], s:term(s))
    exec printf('hi LightLineRight_%s_%d_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, len(right), j, m[1], s[1], m[3], s[3], s:term(m))
    for k in values(g)
      let t = has_key(c,d) && has_key(c[d],k) ? c[d][k][0] : has_key(c,'tabline') && has_key(c.tabline,k) ? c.tabline[k][0] : has_key(c.normal,k) ? c.normal[k][0] : l[0]
      exec printf('hi LightLineLeft_%s_%s_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, k, s[1], t[1], s[3], t[3], s:term(s))
      exec printf('hi LightLineLeft_%s_%s_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, k, j, t[1], s[1], t[3], s[3], s:term(t))
      exec printf('hi LightLineRight_%s_%s_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, j, k, s[1], t[1], s[3], t[3], s:term(s))
      exec printf('hi LightLineRight_%s_%s_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, k, j, t[1], s[1], t[3], s[3], s:term(t))
    endfor
  endfor
  endfor
endfunction

function! s:subseparator(x, y, s, a, b)
  let [c, f, v] = [ s:lightline.component, s:lightline.component_function,  s:lightline.component_visible_condition ]
  return '%{('.(a:a?"1":has_key(f,a:x)?'!!strlen(exists("*'.f[a:x].'")?'.f[a:x].'():"")':get(v,a:x,has_key(c,a:x)?"1":"0")).')*(('.join(map(range(len(a:y)),
        \'(a:b[v:val]?"1":has_key(f,a:y[v:val])?"!!strlen(exists(\"*".f[a:y[v:val]]."\")?".f[a:y[v:val]]."():\"\")":get(v,a:y[v:val],has_key(c,a:y[v:val])?"1":"0"))'),')+(')."))?('".a:s."'):''}"
endfunction

function! lightline#concatenate(x, s)
  let [_, k, s] = ['', 0, ' ' . [s:lightline.subseparator.left, s:lightline.subseparator.right][!!a:s] . ' ']
  for i in range(len(a:x))
    let [_, k] = [_ . a:x[i], k || len(a:x[i])]
    if k && i + 1 < len(a:x) && len(a:x[i + 1]) | let _ .= s | endif
  endfor
  return _
endfunction

function! lightline#statusline(inactive)
  return s:line(0, a:inactive)
endfunction

function! s:expand(x)
  let [e, t, d, f] = [ s:lightline.component_expand, s:lightline.component_type, s:lightline.component, s:lightline.component_function ]
  let [a, c, _] = [[], [], []]
  for i in range(len(a:x))
    if !len(_) || len(_[-1]) | call add(_, []) | call add(c, []) | endif
    for j in range(len(a:x[i]))
      if has_key(e, a:x[i][j])
        try
          unlet! r
          let r = exists('*'.e[a:x[i][j]]) ? eval(e[a:x[i][j]] . '()') : ''
          if type(r) == 1 && r == '' | continue | endif
          let s = type(r) == 3 ? (len(r) < 3 ? r + [[], [], []] : r) : [[], [r], []]
        catch
          continue
        endtry
        for k in [0, 1, 2]
          let sk = filter(type(s[k])==3?map(s[k],"type(v:val)==1?(v:val):string(v:val)"):type(s[k])==1?[s[k]]:[string(s[k])],"strlen(v:val)")
          if len(sk)
            unlet! m
            let m = k == 1 && has_key(t, a:x[i][j]) ? t[a:x[i][j]] : i
            if !len(a) || type(a[-1]) != type(m) || a[-1] != m
              if len(_[-1])
                call add(_, sk) | call add(c, repeat([1], len(sk)))
              else
                call extend(_[-1], sk) | call extend(c[-1], repeat([1], len(sk)))
              endif
              call add(a, m)
            else
              if len(_) > 1 && !len(_[-1]) | call remove(_, -1) | call remove(c, -1) | endif
              call extend(_[-1], sk) | call extend(c[-1], repeat([1], len(sk)))
            endif
          endif
        endfor
      elseif has_key(d, a:x[i][j]) || has_key(f, a:x[i][j])
        if !len(a) || type(a[-1]) != type(i) || a[-1] != i
          call add(a, i)
          if len(_) && len(_[-1]) | call add(_, []) | call add(c, []) | endif
        endif
        call add(_[-1], a:x[i][j]) | call add(c[-1], 0)
      endif
    endfor
  endfor
  call add(a, len(a:x))
  while len(_) && !len(_[-1]) | call remove(_, -1) | call remove(c, -1) | endwhile
  return [a, c, _]
endfunction

function! s:line(tabline, inactive)
  let _ = a:tabline ? '' : '%{lightline#link()}'
  let [l, r] = a:tabline ? [s:lightline.tab_llen, s:lightline.tab_rlen] : [s:lightline.llen, s:lightline.rlen]
  let [p, s] = a:tabline ? [s:lightline.tabline_separator, s:lightline.tabline_subseparator] : [s:lightline.separator, s:lightline.subseparator]
  let [c, f, t] = [s:lightline.component, s:lightline.component_function, s:lightline.component_type]
  let mode = a:tabline ? 'tabline' : a:inactive ? 'inactive' : 'active'
  let l_ = has_key(s:lightline, mode) ? s:lightline[mode].left : s:lightline.active.left
  let [ll, lc, lt] = s:expand(copy(l_))
  let r_ = has_key(s:lightline, mode) ? s:lightline[mode].right : s:lightline.active.right
  let [rl, rc, rt] = s:expand(copy(r_))
  for i in range(len(lt))
    let _ .= printf('%%#LightLineLeft_%s_%s#', mode, ll[i])
    for j in range(len(lt[i]))
      let x = substitute('%( '.(lc[i][j] ? lt[i][j] : has_key(f,lt[i][j])?'%{exists("*'.f[lt[i][j]].'")?'.f[lt[i][j]].'():""}':get(c,lt[i][j],'')).' %)', '^%(  %)', '', '')
      let _ .= has_key(t,lt[i][j])&&t[lt[i][j]]=='raw'&&strlen(x)>7 ? x[3:-2] : x
      if j < len(lt[i]) - 1 | let _ .= s:subseparator(lt[i][j], lt[i][j+1:], s.left, lc[i][j], lc[i][j+1:]) | endif
    endfor
    let _ .= printf('%%#LightLineLeft_%s_%s_%s#', mode, ll[i], ll[i + 1]) . (i < l + len(lt) - len(l_) && ll[i] < l || type(ll[i]) != type(ll[i + 1]) || type(ll[i]) && type(ll[i + 1]) && ll[i] != ll[i + 1] ? p.left : len(lt[i]) ? s.left : '')
  endfor
  let _ .= printf('%%#LightLineMiddle_%s#%%=', mode)
  for i in reverse(range(len(rt)))
    let _ .= printf('%%#LightLineRight_%s_%s_%s#', mode, rl[i], rl[i + 1]) . (i < r + len(rt) - len(r_) && rl[i] < r || type(rl[i]) != type(rl[i + 1]) || type(rl[i]) && type(rl[i + 1]) && rl[i] != rl[i + 1] ? p.right : len(rt[i]) ? s.right : '')
    let _ .= printf('%%#LightLineRight_%s_%s#', mode, rl[i])
    for j in range(len(rt[i]))
      if j | let _ .= s:subseparator(rt[i][j], rt[i][:j-1], s.right, rc[i][j], rc[i][:j-1]) | endif
      let x = substitute('%( '.(rc[i][j] ? rt[i][j] : has_key(f,rt[i][j])?'%{exists("*'.f[rt[i][j]].'")?'.f[rt[i][j]].'():""}':get(c,rt[i][j],'')).' %)', '^%(  %)', '', '')
      let _ .= has_key(t,rt[i][j])&&t[rt[i][j]]=='raw'&&strlen(x)>7 ? x[3:-4] : x
    endfor
  endfor
  return _
endfunction

function! lightline#tabline()
  return s:line(1, 0)
endfunction

function! lightline#tabs()
  let [t, l, x, y, z, u, d] = [tabpagenr(), tabpagenr('$'), [], [], [], '...', min([max([winwidth(0) / 40, 2]), 8])]
  for i in range(1, l)
    call add(i<t?(x):i==t?(y):z, '%'.i.'T%{lightline#onetab('.i.','.(i==t).')}'.(i==l?'%T':''))
  endfor
  let [a, b, c] = [len(x), len(z), d * 2]
  return [a>d&&b>d ? extend(add(x[:d/2-1],u),x[-(d+1)/2:]) : a+b<=c||a<=d ? x : extend(add(x[:(c-b)/2-1],u),x[-(c-b+1)/2:]), y,
        \ a>d&&b>d ? extend(add(z[:(d+1)/2-1],u),z[-d/2:]) : a+b<=c||b<=d ? z : extend(add(z[:(c-a+1)/2-1],u),z[-(c-a)/2:])]
endfunction

function! lightline#onetab(n, active)
  let [_, a] = ['', s:lightline.tab[a:active ? 'active' : 'inactive']]
  let [c, f] = [s:lightline.tab_component, s:lightline.tab_component_function ]
  for i in range(len(a))
    let s = has_key(f,a[i]) ? eval(f[a[i]].'('.a:n.')') : get(c,a[i],'')
    if strlen(s) | let _ .= (len(_) ? ' ' : '') . s | endif
  endfor
  return _
endfunction

function! lightline#error(msg)
  echohl ErrorMsg | echomsg 'lightline.vim: '.a:msg | echohl None
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

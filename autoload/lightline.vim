" =============================================================================
" Filename: autoload/lightline.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/23 23:45:17.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

let s:_ = 1
let s:is_win32term = (has('win32') || has('win64')) && !has('gui_running')

function! lightline#update()
  if s:_ | call lightline#init() | endif
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
  let g:lightline = get(g:, 'lightline', {})
  let g:lightline.active = get(g:lightline, 'active', {})
  call extend(g:lightline.active, {
        \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ] }, 'keep')
  let g:lightline.inactive = get(g:lightline, 'inactive', {})
  call extend(g:lightline.inactive, {
        \ 'left': [ [ 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ], [ 'percent' ] ] }, 'keep')
  let g:lightline.mode_map = get(g:lightline, 'mode_map', {})
  call extend(g:lightline.mode_map, {
        \ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL',
        \ 'V': 'V-LINE', 'c': 'COMMAND', '': 'V-BLOCK', 's': 'SELECT',
        \ 'S': 'S-LINE', '': 'S-BLOCK', '?': '      ' }, 'keep')
  let g:lightline._mode_ = {
        \ 'n': 'normal', 'i': 'insert', 'R': 'replace', 'v': 'visual', 'V': 'visual',
        \ 'c': 'command', '': 'visual', 's': 'select', 'S': 'select', '': 'select' }
  let g:lightline.mode_fallback = get(g:lightline, 'mode_fallback', {})
  call extend(g:lightline.mode_fallback, { 'replace': 'insert', 'select': 'visual' })
  let g:lightline.component = get(g:lightline, 'component', {})
  call extend(g:lightline.component, {
        \ 'mode': '%{lightline#mode()}',
        \ 'filename': '%t',
        \ 'modified': '%M',
        \ 'paste': '%{&paste?"PASTE":""}',
        \ 'readonly': '%R',
        \ 'fileencoding': '%{strlen(&fenc)?&fenc:&enc}',
        \ 'fileformat': '%{&fileformat}',
        \ 'filetype': '%{strlen(&filetype)?&filetype:"no ft"}',
        \ 'percent': '%3p%%',
        \ 'lineinfo': '%3l:%-2v' }, 'keep')
  let g:lightline.component_visible_condition = get(g:lightline, 'component_visible_condition', {})
  call extend(g:lightline.component_visible_condition, {
        \ 'modified': '(&modified||!&modifiable)',
        \ 'readonly': '(&readonly)',
        \ 'paste': '(&paste)' }, 'keep')
  let g:lightline.component_function = get(g:lightline, 'component_function', {})
  let g:lightline.separator = get(g:lightline, 'separator', {})
  call extend(g:lightline.separator, { 'left': '', 'right': '' }, 'keep')
  let g:lightline.subseparator = get(g:lightline, 'subseparator', {})
  call extend(g:lightline.subseparator, { 'left': '|', 'right': '|' }, 'keep')
  call extend(g:lightline, { 'palette': {}, 'colorscheme': 'default' }, 'keep')
  try
    let g:lightline.palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
  catch
    call lightline#error('Colorscheme ' . g:lightline.colorscheme . ' could not loaded.')
    let g:lightline.colorscheme = 'default'
    let g:lightline.palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
  finally
    call lightline#highlight()
    let s:_ = 0
  endtry
endfunction

function! lightline#mode()
  return get(g:lightline.mode_map, mode(), g:lightline.mode_map['?'])
endfunction

function! lightline#link()
  let mode = get(g:lightline._mode_, mode(), 'normal')
  for i in range(len(g:lightline.active.left))
    exec printf('hi link LightLineLeft_active_%d LightLineLeft_%s_%d', i, mode, i)
    exec printf('hi link LightLineLeft_active_%d_%d LightLineLeft_%s_%d_%d', i, i + 1, mode, i, i + 1)
  endfor
  exec printf('hi link LightLineMiddle_active LightLineMiddle_%s', mode)
  for i in range(len(g:lightline.active.right))
    exec printf('hi link LightLineRight_active_%d LightLineRight_%s_%d', i, mode, i)
    exec printf('hi link LightLineRight_active_%d_%d LightLineRight_%s_%d_%d', i, i + 1, mode, i, i + 1)
  endfor
  return ''
endfunction

function! s:term(l)
  return len(a:l) == 5 && type(a:l[4]) == 1 ? 'term='.a:l[4].' cterm='.a:l[4] : ''
endfunction

function! s:gui2cui(rgb, fallback)
  let rgb = map(matchlist(a:rgb, '#\(..\)\(..\)\(..\)')[1:3], '0 + ("0x".v:val)')
  if len(rgb) == 0
    let rgb = lightline#colortable#name_to_rgb(a:rgb)
    if len(rgb) == 0
    throw a:rgb
      return a:fallback % 128
    endif
  endif
  let rgb = [rgb[0] > 127 ? 4 : 0, rgb[1] > 127 ? 2 : 0, rgb[2] > 127 ? 1 : 0]
  return rgb[0] + rgb[1] + rgb[2]
endfunction

function! lightline#highlight()
  for mode in ['normal', 'insert', 'replace', 'visual', 'inactive', 'command', 'select']
  let [c, f] = [g:lightline.palette, g:lightline.mode_fallback]
  let d = has_key(c, mode) ? mode : has_key(f, mode) && has_key(c, f[mode]) ? f[mode] : 'normal'
  let left = d == 'inactive' ? g:lightline.inactive.left : g:lightline.active.left
  let right = d == 'inactive' ? g:lightline.inactive.right : g:lightline.active.right
  let l = has_key(c,d) && has_key(c[d],'left') ? c[d].left : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'left') ? c[f[d]].left : c.normal.left
  let r = has_key(c,d) && has_key(c[d],'right') ? c[d].right : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'right') ? c[f[d]].right : c.normal.right
  let m = has_key(c,d) && has_key(c[d],'middle') ? c[d].middle[0] : has_key(f,d) && has_key(c,f[d]) && has_key(c[f[d]],'middle') ? c[f[d]].middle[0] : c.normal.middle[0]
  if s:is_win32term
    " patching color values for windows console
    for _  in l
      let [_[2], _[3]] = [s:gui2cui(_[0], _[2]), s:gui2cui(_[1], _[3])]
    endfor
    for _  in r
      let [_[2], _[3]] = [s:gui2cui(_[0], _[2]), s:gui2cui(_[1], _[3])]
    endfor
    let [m[2], m[3]] = [s:gui2cui(m[0], m[2]), s:gui2cui(_[1], m[3])]
  endif
  for i in range(len(left))
    let [li, lj] = [i < len(l) ? l[i] : l[-1], i + 1 < len(l) ? l[i + 1] : l[-1]]
    exec printf('hi LightLineLeft_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, i, li[0], li[1], li[2], li[3], s:term(li))
    exec printf('hi LightLineLeft_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', mode,
          \ i, i + 1, li[1], i == len(left) - 1 ? m[1] : lj[1], li[3], i == len(left) - 1 ? m[3] : lj[3])
  endfor
  exec printf('hi LightLineMiddle_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, m[0], m[1], m[2], m[3], s:term(m))
  for i in reverse(range(len(right)))
    let [ri, rj] = [i < len(r) ? r[i] : r[-1], i + 1 < len(r) ? r[i + 1] : r[-1]]
    exec printf('hi LightLineRight_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', mode,
          \ i, i + 1, ri[1], i == len(right) - 1 ? m[1] : rj[1], ri[3], i == len(right) - 1 ? m[3] : rj[3])
    exec printf('hi LightLineRight_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', mode, i, ri[0], ri[1], ri[2], ri[3], s:term(ri))
  endfor
  endfor
endfunction

function! lightline#subseparator(x, y, s)
  let [c, f, v] = [ g:lightline.component, g:lightline.component_function,  g:lightline.component_visible_condition ]
  return '%{('.(has_key(f,a:x)?'!!strlen('.(f[a:x]).'())':get(v,a:x,"1")).')*(('.join(map(copy(a:y),
        \'(has_key(f,v:val)?"!!strlen(".f[v:val]."())":get(v,v:val,has_key(c,v:val)?"1":"0"))'),')+(')."))?('".a:s."'):''}"
endfunction

function! lightline#statusline(inactive)
  let [_, c, f] = [ '%{lightline#link()}', g:lightline.component, g:lightline.component_function ]
  let mode = a:inactive ? 'inactive' : 'active'
  let left = has_key(g:lightline, mode) ? g:lightline[mode].left : g:lightline.active.left
  let right = has_key(g:lightline, mode) ? g:lightline[mode].right : g:lightline.active.right
  for i in range(len(left))
    let _ .= printf('%%#LightLineLeft_%s_%d#', mode, i)
    for j in range(len(left[i]))
      let _ .= '%( '.(has_key(f,left[i][j])?'%{'.f[left[i][j]].'()}':get(c,left[i][j],'')).' %)'
      if j < len(left[i]) - 1
        let _ .= lightline#subseparator(left[i][j], left[i][j+1:], g:lightline.subseparator.left)
      endif
    endfor
    let _ .= printf('%%#LightLineLeft_%s_%d_%d#', mode, i, i + 1) . g:lightline.separator.left
  endfor
  let _ .= printf('%%#LightLineMiddle_%s#%%=', mode)
  for i in reverse(range(len(right)))
    let _ .= printf('%%#LightLineRight_%s_%d_%d#', mode, i, i + 1) . g:lightline.separator.right
    let _ .= printf('%%#LightLineRight_%s_%d#', mode, i)
    for j in range(len(right[i]))
      if j
        let _ .= lightline#subseparator(right[i][j], right[i][:j-1], g:lightline.subseparator.right)
      endif
      let _ .= '%( '.(has_key(f,right[i][j])?'%{'.f[right[i][j]].'()}':get(c,right[i][j],'')).' %)'
    endfor
  endfor
  return _
endfunction

function! lightline#error(msg)
  echohl ErrorMsg | echomsg 'lightline.vim: '.a:msg | echohl None
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

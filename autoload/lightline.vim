" =============================================================================
" Filename: autoload/lightline.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 22-Aug-2013.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

let s:_ = 1

let s:is_win32term = (has('win32') || has('win64')) && !has('gui_running')

function! lightline#update(...)
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
  let g:lightline.inactive = get(g:lightline, 'inactive', {})
  let g:lightline.active.left = get(g:lightline.active, 'left', [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ])
  let g:lightline.inactive.left = get(g:lightline.inactive, 'left', [ [ 'filename' ] ])
  let g:lightline.active.right = get(g:lightline.active, 'right', [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ])
  let g:lightline.inactive.right = get(g:lightline.inactive, 'right', [ [ 'lineinfo' ], [ 'percent' ] ])
  let g:lightline._mode_map = {
        \ 'n' : 'NORMAL', 'i' : 'INSERT', 'R' : 'REPLACE', 'v' : 'VISUAL', 'V' : 'V-LINE',
        \ 'c' : 'COMMAND', '': 'V-BLOCK', 's' : 'SELECT', 'S' : 'S-LINE', '': 'S-BLOCK', '?': '      ' }
  let g:lightline.mode_map = get(g:lightline, 'mode_map', {})
  for [k, v] in items(g:lightline._mode_map)
    let g:lightline.mode_map[k] = get(g:lightline.mode_map, k, v)
  endfor
  let g:lightline._mode_ = {
        \ 'n' : 'normal', 'i' : 'insert', 'R' : 'replace', 'v' : 'visual', 'V' : 'visual',
        \ 'c' : 'command', '': 'visual', 's' : 'select', 'S' : 'select', '': 'select', }
  let g:lightline._component = {
        \ 'mode': '%{lightline#mode()}',
        \ 'filename': '%t',
        \ 'modified': '%M',
        \ 'paste': '%{&paste?"PASTE":""}',
        \ 'readonly': '%R',
        \ 'fileencoding': '%{strlen(&fenc)?&fenc:&enc}',
        \ 'fileformat': '%{&fileformat}',
        \ 'filetype': '%{strlen(&filetype)?&filetype:"no ft"}',
        \ 'percent': '%3p%%',
        \ 'lineinfo': '%3l:%-2v',
        \ 'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}' }
  let g:lightline.component = get(g:lightline, 'component', {})
  for [k, v] in items(g:lightline._component)
    let g:lightline.component[k] = get(g:lightline.component, k, v)
  endfor
  let g:lightline._component_flag = {
        \ 'modified': '(&modified||!&modifiable)',
        \ 'readonly': '(&readonly)',
        \ 'paste': '(&paste)',
        \ 'fugitive': '(exists("*fugitive#head")&&strlen(fugitive#head()))' }
  let g:lightline.component_flag = get(g:lightline, 'component_flag', {})
  for [k, v] in items(g:lightline._component_flag)
    let g:lightline.component_flag[k] = get(g:lightline.component_flag, k, v)
  endfor
  let g:lightline.component_func = get(g:lightline, 'component_func', {})
  let g:lightline.separator = get(g:lightline, 'separator', {})
  let g:lightline.separator.left = get(g:lightline.separator, 'left', '')
  let g:lightline.separator.right = get(g:lightline.separator, 'right', '')
  let g:lightline.subseparator = get(g:lightline, 'subseparator', {})
  let g:lightline.subseparator.left = get(g:lightline.subseparator, 'left', '|')
  let g:lightline.subseparator.right = get(g:lightline.subseparator, 'right', '|')
  let g:lightline.palette = get(g:lightline, 'palette', {})
  let g:lightline.colorscheme = get(g:lightline, 'colorscheme', 'default')
  for m in ['normal', 'insert', 'replace', 'visual', 'inactive']
    let g:lightline.palette[m] = get(g:lightline.palette, m, {})
  endfor
  try
    let g:lightline.palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
  catch
    call lightline#error('Colorscheme ' . g:lightline.colorscheme . ' could not loaded.')
    let g:lightline.colorscheme = 'default'
    let g:lightline.palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
  finally
    for m in ['normal', 'insert', 'replace', 'visual', 'inactive', 'command']
      call lightline#highlight(m)
    endfor
    let s:_ = 0
  endtry
endfunction

function! lightline#mode()
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
  return get(g:lightline.mode_map, mode(), g:lightline.mode_map['?'])
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

function! lightline#highlight(mode)
  let d = has_key(g:lightline.palette, a:mode) ? a:mode : 'normal'
  let c = g:lightline.palette
  let left = d == 'inactive' ? g:lightline.inactive.left : g:lightline.active.left
  let right = d == 'inactive' ? g:lightline.inactive.right : g:lightline.active.right
  let l = has_key(c, d) && has_key(c[d], 'left') ? c[d].left : c.normal.left
  let r = has_key(c, d) && has_key(c[d], 'right') ? c[d].right : c.normal.right
  let m = has_key(c, d) && has_key(c[d], 'middle') ? c[d].middle[0] : c.normal.middle[0]
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
    exec printf('hi LightLineLeft_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', a:mode, i, l[i][0], l[i][1], l[i][2], l[i][3], s:term(l[i]))
    exec printf('hi LightLineLeft_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode,
          \ i, i + 1, l[i][1], i == len(left) - 1 ? m[1] : l[i + 1][1], l[i][3], i == len(left) - 1 ? m[3] : l[i + 1][3])
  endfor
  exec printf('hi LightLineMiddle_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', a:mode, m[0], m[1], m[2], m[3], s:term(m))
  for i in reverse(range(len(right)))
    exec printf('hi LightLineRight_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode,
          \ i, i + 1, r[i][1], i == len(right) - 1 ? m[1] : r[i + 1][1], r[i][3], i == len(right) - 1 ? m[3] : r[i + 1][3])
    exec printf('hi LightLineRight_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d %s', a:mode, i, r[i][0], r[i][1], r[i][2], r[i][3], s:term(r[i]))
  endfor
endfunction

function! lightline#subseparator(x, y, s)
  return '%{('.get(g:lightline.component_flag,a:x,has_key(g:lightline.component_func,a:x)?'!!strlen('.g:lightline.component_func[a:x].'())':"1").')*('.
        \join(map(copy(a:y),'get(g:lightline.component_flag,v:val,has_key(g:lightline.component_func,v:val)?'.
        \'"!!strlen(".g:lightline.component_func[v:val]."())":has_key(g:lightline.component,v:val)?"1":"0")'),'+').")?('".a:s."'):''}"
endfunction

function! lightline#statusline(inactive)
  let _ = ''
  let mode = a:inactive ? 'inactive' : 'active'
  let left = has_key(g:lightline, mode) ? g:lightline[mode].left : g:lightline.active.left
  let right = has_key(g:lightline, mode) ? g:lightline[mode].right : g:lightline.active.right
  for i in range(len(left))
    let _ .= printf('%%#LightLineLeft_%s_%d#', mode, i)
    for j in range(len(left[i]))
      let _ .= '%( '.get(g:lightline.component,left[i][j],has_key(g:lightline.component_func,left[i][j])?'%{'.g:lightline.component_func[left[i][j]].'()}':'').' %)'
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
      let _ .= '%( '.get(g:lightline.component,right[i][j],has_key(g:lightline.component_func,right[i][j])?'%{'.g:lightline.component_func[right[i][j]].'()}':'').' %)'
    endfor
  endfor
  return _
endfunction

function! lightline#error(msg)
  echohl ErrorMsg | echomsg 'lightline.vim: '.a:msg | echohl None
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

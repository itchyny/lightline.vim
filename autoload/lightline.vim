let s:save_cpo = &cpo
set cpo&vim

let s:_ = 1

function! lightline#update(...)
  if s:_ | call lightline#init() | endif
  let s = lightline#statusline(0)
  for nr in filter(range(1, winnr('$')), 'v:val != winnr()')
    call setwinvar(nr, '&statusline', s)
  endfor
  let s = lightline#statusline(1)
  call setwinvar(winnr(), '&statusline', s)
endfunction

function! lightline#init()
  let g:lightline = get(g:, 'lightline', {})
  let g:lightline.active = get(g:lightline, 'active', {})
  let g:lightline.inactive = get(g:lightline, 'inactive', {})
  let g:lightline.active.left = get(g:lightline.active, 'left', [ [ 'mode' ], [ 'filename', 'modified' ] ])
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
  let g:lightline.component = get(g:lightline, 'component', {
        \ 'mode': '%{lightline#mode()}',
        \ 'filename': '%t',
        \ 'modified': '%M',
        \ 'fileencoding': '%{strlen(&fenc)?&fenc:&enc}',
        \ 'fileformat': '%{&fileformat}',
        \ 'filetype': '%{strlen(&filetype)?&filetype:"no ft"}',
        \ 'percent': '%3p%%',
        \ 'lineinfo': '%3l:%-2v',
        \ 'fugitive': '%{fugitive#head()}' })
  let g:lightline.component_length = get(g:lightline, 'component_length', {
        \ 'modified': '(&modified||!&modifiable)',
        \ 'fugitive': 'strlen(fugitive#head())' })
  let g:lightline.separator = get(g:lightline, 'separator', {})
  let g:lightline.separator.left = get(g:lightline.separator, 'left', '')
  let g:lightline.separator.right = get(g:lightline.separator, 'right', '')
  let g:lightline.subseparator = get(g:lightline, 'subseparator', {})
  let g:lightline.subseparator.left = get(g:lightline.subseparator, 'left', '')
  let g:lightline.subseparator.right = get(g:lightline.subseparator, 'right', '')
  let g:lightline.color = get(g:lightline, 'color', {})
  let g:lightline.colorscheme = get(g:lightline, 'colorscheme', 'default')
  for m in ['normal', 'insert', 'replace', 'visual', 'inactive']
    let g:lightline.color[m] = get(g:lightline.color, m, {})
  endfor
  try
    exec 'call lightline#colorscheme#' . g:lightline.colorscheme . '#init()'
    for m in ['normal', 'insert', 'replace', 'visual', 'inactive', 'command']
      call lightline#highlight(m)
    endfor
    let s:_ = 0
  catch
    call lightline#error('Colorscheme ' . g:lightline.colorscheme . ' not found.')
    let g:lightline.colorscheme = 'default'
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

function! lightline#highlight(mode)
  let d = has_key(g:lightline.color, a:mode) ? a:mode : 'normal'
  let c = g:lightline.color
  let left = d == 'inactive' ? g:lightline.inactive.left : g:lightline.active.left
  let right = d == 'inactive' ? g:lightline.inactive.right : g:lightline.active.right
  let l = has_key(c, d) && has_key(c[d], 'left') ? c[d].left : c.normal.left
  let r = has_key(c, d) && has_key(c[d], 'right') ? c[d].right : c.normal.right
  let m = has_key(c, d) && has_key(c[d], 'middle') ? c[d].middle : c.normal.middle
  for i in range(len(left))
    exec printf('hi LightLineLeft_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode, i, l[i][0], l[i][1], l[i][2], l[i][3])
    exec printf('hi LightLineLeft_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode, i, i + 1, l[i][1], i == len(left) - 1 ? m[1] : l[i + 1][1], l[i][3], i == len(left) - 1 ? m[3] : l[i + 1][3])
  endfor
  exec printf('hi LightLineMiddle_%s guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode, m[0], m[1], m[2], m[3])
  for i in reverse(range(len(right)))
    exec printf('hi LightLineRight_%s_%d_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode, i, i + 1, r[i][1], i == len(right) - 1 ? m[1] : r[i + 1][1], r[i][3], i == len(right) - 1 ? m[3] : r[i + 1][3])
    exec printf('hi LightLineRight_%s_%d guifg=%s guibg=%s ctermfg=%d ctermbg=%d', a:mode, i, r[i][0], r[i][1], r[i][2], r[i][3])
  endfor
endfunction

function! lightline#subseparator(x, y, s)
  if has_key(g:lightline.component_length, a:x)
    if has_key(g:lightline.component_length, a:y)
      return '%{'.g:lightline.component_length[a:x].'*'.g:lightline.component_length[a:y]."?(g:lightline.subseparator.left):''}"
    else
      return '%{'.g:lightline.component_length[a:x]."?(g:lightline.subseparator.left):''}"
    endif
  elseif has_key(g:lightline.component_length, a:y)
    return '%{'.g:lightline.component_length[a:y]."?(g:lightline.subseparator.left):''}"
  else
    return a:s
  endif
endfunction

function! lightline#statusline(active)
  let _ = ''
  let mode = a:active ? 'active' : 'inactive'
  let left = has_key(g:lightline, mode) ? g:lightline[mode].left : g:lightline.active.left
  let right = has_key(g:lightline, mode) ? g:lightline[mode].right : g:lightline.active.right
  for i in range(len(left))
    let _ .= printf('%%#LightLineLeft_%s_%d#', mode, i)
    for j in range(len(left[i]))
      let _ .= '%( '.g:lightline.component[left[i][j]].' %)'
      if j < len(left[i]) - 1
        let _ .= lightline#subseparator(left[i][j], left[i][j+1], g:lightline.subseparator.left)
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
        let _ .= lightline#subseparator(right[i][j], right[i][j-1], g:lightline.subseparator.right)
      endif
      let _ .= '%( '.g:lightline.component[right[i][j]].' %)'
    endfor
  endfor
  return _
endfunction

function! lightline#error(msg)
  echohl ErrorMsg
  echomsg 'lightline.vim: '.a:msg
  echohl None
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

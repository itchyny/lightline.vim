" =============================================================================
" Filename: autoload/colorscheme/colortable.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/28 10:07:13.
" =============================================================================

function! s:load()
  let rgbfile = $VIMRUNTIME . '/rgb.txt'
  let table = {}
  if filereadable(rgbfile)
    for _ in map(filter(readfile(rgbfile), 'v:val !~ "^!"'), 'matchlist(v:val, "^\\s*\\(\\d\\+\\)\\s\\+\\(\\d\\+\\)\\s\\+\\(\\d\\+\\)\\s\\+\\(.*\\)")[1:4]')
      let table[tolower(_[3])] = _[0:2]
    endfor
  endif
  return table
endfunction

let s:table = s:load()

function! lightline#colortable#name_to_rgb(name)
  let name = tolower(a:name)
  return has_key(s:table, name) ? s:table[name] : []
endfunction

function! lightline#colortable#gui2cui(rgb, fallback)
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

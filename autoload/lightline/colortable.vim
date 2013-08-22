" =============================================================================
" Filename: autoload/colorscheme/colortable.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/22 21:12:21.
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

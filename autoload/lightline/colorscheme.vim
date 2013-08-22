" =============================================================================
" Filename: autoload/colorscheme/colorscheme.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/22 21:12:07.
" =============================================================================

let s:cuicolor = {
      \ 'black'          : 16,
      \ 'white'          : 231,
      \
      \ 'darkestgreen'   : 22,
      \ 'darkgreen'      : 28,
      \ 'mediumgreen'    : 70,
      \ 'brightgreen'    : 148,
      \
      \ 'darkestcyan'    : 23,
      \ 'mediumcyan'     : 117,
      \
      \ 'darkestblue'    : 24,
      \ 'darkblue'       : 31,
      \
      \ 'darkestred'     : 52,
      \ 'darkred'        : 88,
      \ 'mediumred'      : 124,
      \ 'brightred'      : 160,
      \ 'brightestred'   : 196,
      \
      \ 'darkestpurple'  : 55,
      \ 'mediumpurple'   : 98,
      \ 'brightpurple'   : 189,
      \
      \ 'brightorange'   : 208,
      \ 'brightestorange': 214,
      \
      \ 'gray0'          : 233,
      \ 'gray1'          : 235,
      \ 'gray2'          : 236,
      \ 'gray3'          : 239,
      \ 'gray4'          : 240,
      \ 'gray5'          : 241,
      \ 'gray6'          : 244,
      \ 'gray7'          : 245,
      \ 'gray8'          : 247,
      \ 'gray9'          : 250,
      \ 'gray10'         : 252,
      \
      \ 'yellow'         : 136,
      \ 'orange'         : 166,
      \ 'red'            : 160,
      \ 'magenta'        : 125,
      \ 'violet'         : 61,
      \ 'blue'           : 33,
      \ 'cyan'           : 37,
      \ 'green'          : 64,
      \ }

let s:guicolor = {
      \ 'black'          : '#000000',
      \ 'white'          : '#ffffff',
      \
      \ 'darkestgreen'   : '#005f00',
      \ 'darkgreen'      : '#008700',
      \ 'mediumgreen'    : '#5faf00',
      \ 'brightgreen'    : '#afdf00',
      \
      \ 'darkestcyan'    : '#005f5f',
      \ 'mediumcyan'     : '#87dfff',
      \
      \ 'darkestblue'    : '#005f87',
      \ 'darkblue'       : '#0087af',
      \
      \ 'darkestred'     : '#5f0000',
      \ 'darkred'        : '#870000',
      \ 'mediumred'      : '#af0000',
      \ 'brightred'      : '#df0000',
      \ 'brightestred'   : '#ff0000',
      \
      \ 'darkestpurple'  : '#5f00af',
      \ 'mediumpurple'   : '#875fdf',
      \ 'brightpurple'   : '#dfdfff',
      \
      \ 'brightorange'   : '#ff8700',
      \ 'brightestorange': '#ffaf00',
      \
      \ 'gray0'          : '#121212',
      \ 'gray1'          : '#262626',
      \ 'gray2'          : '#303030',
      \ 'gray3'          : '#4e4e4e',
      \ 'gray4'          : '#585858',
      \ 'gray5'          : '#606060',
      \ 'gray6'          : '#808080',
      \ 'gray7'          : '#8a8a8a',
      \ 'gray8'          : '#9e9e9e',
      \ 'gray9'          : '#bcbcbc',
      \ 'gray10'         : '#d0d0d0',
      \
      \ 'yellow'         : '#b58900',
      \ 'orange'         : '#cb4b16',
      \ 'red'            : '#dc322f',
      \ 'magenta'        : '#d33682',
      \ 'violet'         : '#6c71c4',
      \ 'blue'           : '#268bd2',
      \ 'cyan'           : '#2aa198',
      \ 'green'          : '#859900',
      \ }

function! s:convert(rgb)
  let rgb = map(matchlist(a:rgb, '#\(..\)\(..\)\(..\)')[1:3], '0 + ("0x".v:val)')
  if len(rgb) == 0
    return 0
  endif
  if rgb[0] == 0xc0 && rgb[1] == 0xc0 && rgb[2] == 0xc0
    return 7
  elseif rgb[0] == 0x80 && rgb[1] == 0x80 && rgb[2] == 0x80
    return 8
  elseif (rgb[0] == 0x80 || rgb[0] == 0x00) && (rgb[1] == 0x80 || rgb[1] == 0x00) && (rgb[2] == 0x80 || rgb[2] == 0x00)
    return (rgb[0] / 0x80) + (rgb[1] / 0x80) * 2 + (rgb[1] / 0x80) * 4
  elseif abs(rgb[0]-rgb[1]) < 3 && abs(rgb[1]-rgb[2]) < 3 && abs(rgb[2]-rgb[0]) < 3
    return s:black((rgb[0] + rgb[1] + rgb[2]) / 3)
  else
    return 16 + ((s:nr(rgb[0]) * 6) + s:nr(rgb[1])) * 6 + s:nr(rgb[2])
  endif
endfunction

function! s:black(x)
  if a:x < 0x04
    return 16
  elseif a:x > 0xf4
    return 231
  elseif index([0x00, 0x5f, 0x87, 0xaf, 0xdf, 0xff], a:x) >= 0
    let l = a:x / 0x30
    return ((l * 6) + l) * 6 + l + 16
  else
    return 232 + (a:x < 8 ? 0 : a:x < 0x60 ? (a:x-8)/10 : a:x < 0x76 ? (a:x-0x60)/6+9 : (a:x-8)/10)
  endif
endfunction

function! s:nr(x)
  return a:x < 0x2f ? 0 : a:x < 0x73 ? 1 : a:x < 0x9b ? 2 : a:x < 0xc7 ? 3 : a:x < 0xef ? 4 : 5
endfunction

function! lightline#colorscheme#fill(p)
  for k in values(a:p)
    for l in values(k)
      for m in l
        if len(m) < 4 && type(m[0]) == 1 && type(m[1]) == 1
          call insert(m, get(s:cuicolor, m[0], s:convert(m[0])), 2)
          call insert(m, get(s:cuicolor, m[1], s:convert(m[1])), 3)
          let m[0] = get(s:guicolor, m[0], m[0])
          let m[1] = get(s:guicolor, m[1], m[1])
        endif
      endfor
    endfor
  endfor
  return a:p
endfunction


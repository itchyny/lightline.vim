" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015/07/28 07:12:52.
" =============================================================================

function! s:grey_number(x) 
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let n = (a:x - 8) / 10
      let m = (a:x - 8) % 10
      if m < 5
        return n
      else
        return n + 1
      endif
    endif
  endif
endfunction

" Returns the actual grey level represented by the grey index
function! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfunction

" Returns the palette index for the given grey index
function! s:grey_color(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfunction

" Returns an approximate color index for the given color level
function! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let n = (a:x - 55) / 40
      let m = (a:x - 55) % 40
      if m < 20
        return n
      else
        return n + 1
      endif
    endif
  endif
endfunction

" Returns the actual color level for the given color index
function! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfunction

" Returns the palette index for the given R/G/B color indices
function! s:rgb_color(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfunction

" Returns the palette index to approximate the given R/G/B color levels
function! s:color(r, g, b)
  " Get the closest grey
  let gx = s:grey_number(a:r)
  let gy = s:grey_number(a:g)
  let gz = s:grey_number(a:b)

  " Get the closest color
  let x = s:rgb_number(a:r)
  let y = s:rgb_number(a:g)
  let z = s:rgb_number(a:b)

  if gx == gy && gy == gz
    " There are two possibilities
    let dgr = s:grey_level(gx) - a:r
    let dgg = s:grey_level(gy) - a:g
    let dgb = s:grey_level(gz) - a:b
    let dgrey = (dgr * dgr) + (dgg * dgg) + (dgb * dgb)
    let dr = s:rgb_level(gx) - a:r
    let dg = s:rgb_level(gy) - a:g
    let db = s:rgb_level(gz) - a:b
    let drgb = (dr * dr) + (dg * dg) + (db * db)
    if dgrey < drgb
      " Use the grey
      return s:grey_color(gx)
    else
      " Use the color
      return s:rgb_color(x, y, z)
    endif
  else
    " Only one possibility
    return s:rgb_color(x, y, z)
  endif
endfunction

" Returns the palette index to approximate the '#rrggbb' hex string
function! s:rgb(rgb)
  let r = ("0x" . strpart(a:rgb, 1, 2)) + 0
  let g = ("0x" . strpart(a:rgb, 3, 2)) + 0
  let b = ("0x" . strpart(a:rgb, 5, 2)) + 0
  return s:color(r, g, b)
endfunction

function! lightline#colorscheme#PaperColor#color(color)
  return [a:color, s:rgb(a:color)]
endfunction

if &background ==# 'light'
  let g:lightline#colorscheme#PaperColor#palette = g:lightline#colorscheme#PaperColor_light#palette
else
  let g:lightline#colorscheme#PaperColor#palette = g:lightline#colorscheme#PaperColor_dark#palette
endif

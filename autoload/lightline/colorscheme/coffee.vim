" =============================================================================
" Filename: autoload/lightline/colorscheme/coffee.vim
" Author: Ari Archer <ari@mail.ari-web.xyz> (based on pt307's apprentice)
" License: MIT License
" Last Change: 2022/02/05 15:20.
" =============================================================================

let s:black = [ '#262220', '235' ]
let s:red = [ '#af5f5f', '131' ]
let s:white = [ '#ddd0c0', '187' ]
let s:yellow = [ '#e4995c', '173' ]
let s:grey1 = [ '#6c6c6c', '242' ]
let s:grey2 = [ '#585858', '240' ]
let s:grey3 = [ '#303030', '236' ]
let s:grey4 = [ '#3a3a3a', '237' ]
let s:green = [ '#87af87', '108' ]
let s:babyblue = [ '#87afaf', '109' ]
let s:darkblue = [ '#666c7f', '60 ' ]

let s:__0 = s:black
let s:__1 = s:red
let s:__2 = s:white
let s:__3 = s:__2
let s:__4 = s:__2
let s:__5 = s:__2
let s:__6 = s:grey1
let s:__7 = s:grey1
let s:__8 = s:grey2
let s:__9 = s:babyblue
let s:_10 = s:green
let s:_11 = s:yellow
let s:_12 = s:babyblue
let s:_13 = s:darkblue
let s:_14 = s:darkblue
let s:_15 = s:__2
let s:_bg = s:black
let s:_fg = s:__2
let s:bg2 = s:grey3
let s:bg3 = s:grey4

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

func! s:fg_bg(fg, bg)
return [ a:fg[0], a:bg[0], a:fg[1], a:bg[1] ]
endfunc

let s:p.inactive.left = [ s:fg_bg( s:_bg, s:__8 ) ]
let s:p.inactive.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:p.inactive.right = [ s:fg_bg( s:_bg, s:__8 ) ]
let s:p.insert.left = [ s:fg_bg( s:_bg, s:_10 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.insert.middle = s:p.inactive.middle
let s:p.insert.right = [ s:fg_bg( s:_bg, s:__3 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.normal.error = [ s:fg_bg( s:__0, s:__1 ) ]
let s:p.normal.left = [ s:fg_bg( s:_bg, s:__2 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.normal.middle = s:p.inactive.middle
let s:p.normal.right = [ s:fg_bg( s:_bg, s:__3 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.normal.warning = [ s:fg_bg( s:__0, s:_11 ) ]
let s:p.replace.left = [ s:fg_bg( s:_bg, s:__1 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.replace.middle = s:p.inactive.middle
let s:p.replace.right = [ s:fg_bg( s:_bg, s:__1 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.tabline.left = [ s:fg_bg( s:_bg, s:__8 ) ]
let s:p.tabline.middle = s:p.inactive.middle
let s:p.tabline.right = [ s:fg_bg( s:_bg, s:__8 ) ]
let s:p.tabline.tabsel = [ s:fg_bg( s:_bg, s:__3 ) ]
let s:p.visual.left = [ s:fg_bg( s:_bg, s:__9 ), s:fg_bg( s:_bg, s:__8 ) ]
let s:p.visual.right = [ s:fg_bg( s:_bg, s:__3 ), s:fg_bg( s:_bg, s:__8 ) ]

let g:lightline#colorscheme#coffee#palette = s:p

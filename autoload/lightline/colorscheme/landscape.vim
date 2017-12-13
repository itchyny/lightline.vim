" =============================================================================
" Filename: autoload/lightline/colorscheme/landscape.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/11/26 21:49:44.
" =============================================================================

let s:white = [ '#ffffff', 255 ]
let s:grey0 = [ '#121212', 233 ]
let s:grey1 = [ '#606060', 241 ]
let s:grey2 = [ '#3a3a3a', 237 ]
let s:grey3 = [ '#262626', 235 ]
let s:grey4 = [ '#303030', 236 ]
let s:grey5 = [ '#666666', 242 ]
let s:grey6 = [ '#d0d0d0', 252 ]
let s:grey7 = [ '#8a8a8a', 245 ]
let s:grey8 = [ '#bcbcbc', 250 ]
let s:grey9 = [ '#585858', 240 ]
let s:grey10 = [ '#dadada', 255 ]

let s:blue = [ '#0000ff', 21 ]
let s:green = [ '#005f00', 22 ]
let s:red = [ '#ff0000', 196 ]
let s:yellow = [ '#ffff00', 226 ]
let s:purple = [ '#5f00ff', 57 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:blue, s:white, 'bold' ], [ s:white, s:blue ] ]
let s:p.normal.right = [ [ s:grey4, s:grey6 ], [ s:grey4, s:grey7 ], [ s:grey8, s:grey9 ] ]
let s:p.inactive.right = [ [ s:grey0, s:grey1 ], [ s:grey0, s:grey2 ], [ s:grey0, s:grey3 ] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left =  [ [ s:green, s:white, 'bold' ], [ s:white, s:green ] ]
let s:p.replace.left = [ [ s:red, s:white, 'bold' ], [ s:white, s:red ] ]
let s:p.visual.left = [ [ s:purple, s:white, 'bold' ], [ s:white, s:purple ] ]
let s:p.normal.middle = [ [ s:grey7, s:grey4 ] ]
let s:p.inactive.middle = [ [ s:grey4, s:grey0 ] ]
let s:p.tabline.left = [ [ s:grey6, s:grey5 ] ]
let s:p.tabline.tabsel = [ [ s:grey10, s:grey0 ] ]
let s:p.tabline.middle = [ [ s:grey7, s:grey2 ] ]
let s:p.tabline.right = [ [ s:grey6, s:grey5 ] ]
let s:p.normal.error = [ [ s:grey6, s:red ] ]
let s:p.normal.warning = [ [ s:grey3, s:yellow ] ]

let g:lightline#colorscheme#landscape#palette = lightline#colorscheme#flatten(s:p)

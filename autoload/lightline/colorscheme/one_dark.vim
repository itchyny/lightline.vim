" =============================================================================
" Filename: autoload/lightline/colorscheme/one_dark.vim
" Author: Zoltan Dalmadi
" License: MIT License
" Last Change: 2016/11/2 14:56:23.
" =============================================================================

let s:bg     = '#282c34'
let s:gray1  = '#5c6370'
let s:gray2  = '#2c323d'
let s:gray3  = '#3e4452'
let s:fg     = '#abb2bf'
let s:blue   = '#61afef'
let s:green  = '#98c379'
let s:purple = '#c678dd'
let s:red1   = '#e06c75'
let s:red2   = '#be5046'
let s:yellow = '#e5c07b'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left    = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle  = [ [ s:fg, s:gray2 ] ]
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:bg, s:green, 'bold' ] ]
let s:p.normal.error   = [ [ s:red2,   s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]

let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray1, s:bg ] ]
let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
let s:p.inactive.right  = [ [ s:gray1, s:bg ], [ s:gray1, s:bg ] ]

let s:p.insert.left  = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.insert.right = [ [ s:bg, s:blue, 'bold' ], [ s:bg, s:blue, 'bold' ] ]

let s:p.replace.left  = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right = [ [ s:bg, s:red1, 'bold' ], [ s:bg, s:red1, 'bold' ] ]

let s:p.visual.left  = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right = [ [ s:bg, s:purple, 'bold' ], [ s:bg, s:purple, 'bold' ] ]

let s:p.tabline.left   = [ [ s:bg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#one_dark#palette = lightline#colorscheme#fill(s:p)

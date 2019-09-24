" =============================================================================
" Filename: autoload/lightline/colorscheme/functional.vim
" Author: L0stLink
" License: MIT License
" Last Change: 2019/06/29 19:00:00
" Description: An opinionated theme based on the dracula color palette.
" =============================================================================

let s:fg     = [ '#abb2bf', 142 ]
let s:blue   = [ '#61afef', 75  ]
let s:green  = [ '#50fa7b', 76  ]
let s:purple = [ '#bd93f9', 176 ]
let s:red    = [ '#ff5555', 168 ]
let s:pink   = [ '#ff79c6', 168 ]
let s:orange = [ '#ffb86c', 168 ]
let s:yellow = [ '#f1fa8c', 180 ]
let s:bg     = [ '#282c34', 235 ]
let s:gray1  = [ '#5c6370', 241 ]
let s:gray2  = [ '#2c323d', 235 ]
let s:gray3  = [ '#3e4452', 240 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:green,  s:gray2, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.right    = [ [ s:green,  s:gray2, 'bold' ], [ s:fg, s:gray3 ], [ s:green,  s:bg ] ]
let s:p.normal.error    = [ [ s:red,    s:bg,    'bold' ] ]
let s:p.normal.warning  = [ [ s:orange, s:bg    ] ]
let s:p.normal.info     = [ [ s:yellow, s:bg    ] ]
let s:p.normal.middle   = [ [ s:fg,     s:bg    ] ]
let s:p.normal.inactive = [ [ s:gray1,  s:bg    ] ]
let s:p.normal.active   = [ [ s:blue,   s:gray2 ] ]
let s:p.insert.left     = [ [ s:blue,   s:gray2, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.insert.right    = [ [ s:blue,   s:gray2, 'bold' ], [ s:fg, s:gray3 ], [ s:blue,   s:bg ] ]
let s:p.replace.left    = [ [ s:orange, s:gray2, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right   = [ [ s:orange, s:gray2, 'bold' ], [ s:fg, s:gray3 ], [ s:orange, s:bg ] ]
let s:p.visual.left     = [ [ s:purple, s:gray2, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right    = [ [ s:purple, s:gray2, 'bold' ], [ s:fg, s:gray3 ], [ s:purple, s:bg ] ]
let s:p.inactive.left   = [ [ s:gray1,  s:bg    ] ]
let s:p.inactive.middle = [ [ s:gray1,  s:bg    ] ]
let s:p.inactive.right  = [ [ s:gray1,  s:bg    ] ]

let g:lightline#colorscheme#functional#palette = lightline#colorscheme#flatten(s:p)

" =============================================================================
" Filename: autoload/lightline/colorscheme/simpleblack.vim
" Author: lucasprag
" License: MIT License
" Last Change: 2019/06/19 10:00:01.
" =============================================================================
let s:black = [ '#000000', 'black' ]
let s:black2 = [ '#121212', '233' ]

let s:gray = [ '#262626', '235' ]
let s:gray2 = [ '#3a3a3a', '237' ]
let s:gray3 = [ '#4e4e4e', '239' ]
let s:gray4 = [ '#626262', '241' ]

let s:violet = [ '#CF73E6', '170' ]

let s:blue = [ '#5f87af', '67' ]
let s:blue2 = [ '#91AADF', '110' ]

let s:green = [ '#57BA37', '71' ]
let s:gold = [ '#F0D50C', '220' ]
let s:red = [ '#821A1A', '1' ]
let s:none = [ 'NONE', 'NONE' ]


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:blue ], [ s:gray4, s:black2 ] ]
let s:p.normal.right = [ [ s:black, s:gray2 ], [ s:gray3, s:black2 ] ]
let s:p.inactive.right = [ [ s:black, s:black2 ], [ s:gray, s:black ] ]
let s:p.inactive.left =  [ [ s:gray, s:black ], [ s:black2, s:black ] ]
let s:p.insert.left = [ [ s:black, s:green ], [ s:gray4, s:black2 ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:gray4, s:black2 ] ]
let s:p.visual.left = [ [ s:black, s:violet ], [ s:gray4, s:black2 ] ]
let s:p.normal.middle = [ [ s:gray, s:black ] ]
let s:p.inactive.middle = [ [ s:black2, s:black ] ]
let s:p.tabline.left = [ [ s:gray4, s:black ] ]
let s:p.tabline.tabsel = [ [ s:blue, s:black ] ]
let s:p.tabline.middle = [ [ s:black2, s:black ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:gold, s:black2 ] ]

let g:lightline#colorscheme#simpleblack#palette = lightline#colorscheme#flatten(s:p)

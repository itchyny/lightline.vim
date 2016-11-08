" =============================================================================
" Filename: autoload/lightline/colorscheme/molokai.vim
" Author: challsted
" License: MIT License
" =============================================================================
"
let s:black = [ '#232526', 199 ]
let s:gray = [ '#808080', 244 ]
let s:white = [ '#f8f8f2', 234 ]
let s:cyan = [ '#66d9ef', 81 ]
let s:green = [ '#a6e22e', 118 ]
let s:orange = [ '#ef5939', 166 ]
let s:pink = [ '#f92672', 161 ]
let s:red = [ '#ff0000', 52 ]
let s:yellow = [ '#e6db74', 229 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.insert.left = [ [ s:black, s:green ], [ s:cyan, s:black ] ]
let s:p.visual.left = [ [ s:black, s:orange ], [ s:black, s:cyan ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:black, s:orange ] ]
let s:p.normal.left = [ [ s:black, s:pink ], [ s:orange, s:black ] ]
let s:p.normal.middle = [ [ s:pink, s:black ] ]
let s:p.normal.right = [ [ s:white, s:gray ], [ s:white, s:gray ] ]
let s:p.normal.error = [ [ s:pink, s:black ] ]
let s:p.normal.warning = [ [ s:yellow, s:black ] ]
let s:p.inactive.right = [ [ s:black, s:gray ], [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:white, s:gray ] ]
let s:p.inactive.left =  [ [ s:yellow, s:black ], [ s:white, s:black ] ]
let s:p.tabline.left = [ [ s:pink, s:black ] ]
let s:p.tabline.tabsel = [ [ s:black, s:pink ] ]
let s:p.tabline.middle = [ [ s:pink, s:black] ]
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#molokai#palette = lightline#colorscheme#flatten(s:p)

" =============================================================================
" Filename: autoload/lightline/colorscheme/everforest_light.vim
" Author: olorton
" License: MIT License
" =============================================================================

" https://github.com/sainnhe/everforest/blob/master/palette.md

let s:bg_1       = ['#ecebd4', 0]
let s:bg_2       = ['#f4f0d9', 8]
let s:dim_0      = ['#eodcc7', 7]
let s:red        = ['#f85552', 1]
let s:green      = ['#8da101', 2]
let s:yellow     = ['#dfa000', 3]
let s:blue       = ['#3a94c5', 4]
let s:magenta    = ['#df69ba', 5]
let s:cyan       = ['#35a77c', 6]
let s:brred      = ['#e66868', 9]
let s:brgreen    = ['#93b259', 10]
let s:brinactive = ['#708089', 12]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.right = [[ s:bg_1, s:blue ], [ s:blue, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.normal.left = [[ s:bg_1, s:blue ], [ s:blue, s:bg_2 ]]
let s:p.normal.middle = [[ s:dim_0, s:bg_1 ]]
let s:p.normal.error = [[ s:bg_1, s:red ]]
let s:p.normal.warning = [[ s:bg_1, s:yellow ]]

let s:p.insert.right = [[ s:bg_1, s:green ], [ s:green, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.insert.left = [[ s:bg_1, s:green ], [ s:green, s:bg_2 ]]

let s:p.visual.right = [[ s:bg_1, s:magenta ], [ s:magenta, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.visual.left = [[ s:bg_1, s:magenta ], [ s:magenta, s:bg_2 ]]

let s:p.inactive.left = [[ s:brinactive, s:bg_2 ], [ s:yellow, s:bg_2 ]]
let s:p.inactive.right = [[ s:brinactive, s:bg_2 ], [ s:yellow, s:bg_2 ]]

let s:p.replace.right = [[ s:bg_1, s:red ], [ s:red, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.replace.left = [[ s:bg_1, s:red ], [ s:red, s:bg_2 ]]

let s:p.tabline.right = [[ s:bg_1, s:red ]]
let s:p.tabline.left = [[ s:cyan, s:bg_2 ]]
let s:p.tabline.tabsel = [[ s:bg_1, s:blue ]]

let g:lightline#colorscheme#everforest_light#palette = lightline#colorscheme#flatten(s:p)

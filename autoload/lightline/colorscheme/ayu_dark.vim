" =============================================================================
" Filename: autoload/lightline/colorscheme/ayu_dark.vim
" Author: danielpeng2
" License: MIT License
" Last Change: 2020/04/15 20:35:50.
" =============================================================================
let s:base0 = [ '#e6e1cf', 244 ]
let s:base1 = [ '#e6e1cf', 247 ]
let s:base2 = [ '#3e4b59', 248 ]
let s:base3 = [ '#e6e1cf', 252 ]
let s:base00 = [ '#14191f', 242  ]
let s:base01 = [ '#14191f', 240 ]
let s:base02 = [ '#0f1419', 238 ]
let s:base023 = [ '#0f1419', 236 ]
let s:base03 = [ '#e6b673', 235 ]
let s:yellow = [ '#e6b673', 180 ]
let s:orange = [ '#ff7733', 173 ]
let s:red = [ '#f07178', 203 ]
let s:magenta = [ '#ffee99', 216 ]
let s:blue = [ '#36a3d9', 117 ]
let s:cyan = s:blue
let s:green = [ '#b8cc52', 119 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base01 ], [ s:base3, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.inactive.right = [ [ s:base1, s:base01 ], [ s:base2, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base02, s:base03 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]
let g:lightline#colorscheme#ayu_dark#palette = lightline#colorscheme#flatten(s:p)

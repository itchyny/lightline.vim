" =============================================================================
" Filename: autoload/lightline/colorscheme/seoul256_light.vim
" Author: shinchu <shinchu@outlook.com>
" License: MIT License
" Last Change: 2021/07/09 21:34:30.
" =============================================================================
let s:mono0 = '#e1e1e1'
let s:mono1 = '#d9d9d9'
let s:mono2 = '#d1d0d1'
let s:mono3 = '#c8c8c8'
let s:mono4 = '#bfbfbf'
let s:mono5 = '#757575'
let s:c_mono0 = 253
let s:c_mono1 = 252
let s:c_mono2 = 251
let s:c_mono3 = 250
let s:c_mono4 = 249
let s:c_mono5 = 241

let s:red = '#be7572'
let s:green = '#999872'
let s:blue = '#719899'
let s:orange = '#e19972'
let s:c_red = 131
let s:c_green = 101
let s:c_blue = 66
let s:c_orange = 173

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.middle = [ [s:mono4, s:mono1, s:c_mono4, s:c_mono1] ]
let s:p.normal.left = [ [s:mono0, s:green, s:c_mono0, s:c_green], [s:mono5, s:mono3, s:c_mono5, s:c_mono3] ]
let s:p.normal.right = [ [s:mono0, s:mono4, s:c_mono0, s:c_mono4], [s:mono0, s:mono4, s:c_mono0, s:c_mono4] ]
let s:p.inactive.middle = [ [s:mono4, s:mono2, s:c_mono4, s:c_mono2] ]
let s:p.inactive.right = [ s:p.inactive.middle[0], s:p.inactive.middle[0] ]
let s:p.inactive.left =  [ s:p.inactive.middle[0], s:p.inactive.middle[0] ]
let s:p.insert.left = [ [s:mono0, s:blue, s:c_mono0, s:c_blue], s:p.normal.left[1] ]
let s:p.replace.left = [ [s:mono0, s:red, s:c_mono0, s:c_red], s:p.normal.left[1] ]
let s:p.visual.left = [ [s:mono0, s:orange, s:c_mono0, s:c_orange], s:p.normal.left[1] ]
let s:p.tabline.middle = [ [s:mono0, s:mono4, s:c_mono0, s:c_mono4] ]
let s:p.tabline.right = [ [s:mono4, s:mono1, s:c_mono4, s:c_mono1], [s:mono0, s:mono4, s:c_mono0, s:c_mono4] ]
let s:p.tabline.left = [ [s:mono4, s:mono1, s:c_mono4, s:c_mono1] ]
let s:p.tabline.tabsel = [ [s:mono5, s:mono0, s:c_mono5, s:c_mono0] ]

let g:lightline#colorscheme#seoul256_light#palette = lightline#colorscheme#fill(s:p)

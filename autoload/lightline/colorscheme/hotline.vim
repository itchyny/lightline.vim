" =============================================================================
" Filename: autoload/lightline/colorscheme/hotline.vim
" Author: Jason Stewart <support@eggplantsd.com>
" License: MIT License
" =============================================================================

let s:black  = [ '#002b36', 234 ]
let s:gray   = [ '#323232', 236 ]
let s:lgray  = [ '#d0d0d0', 252 ]
let s:white  = [ '#ffffff', 255 ]
let s:blue   = [ '#5fafff', 75 ]
let s:green  = [ '#00ffaf', 49 ]
let s:purple = [ '#9300ad', 93 ]
let s:red    = [ '#ff0087', 198 ]
let s:yellow = [ '#fce94f', 11 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.inactive.left   = [ [ s:gray, s:lgray ], [ s:lgray, s:gray ] ]
let s:p.inactive.middle = [ [ s:lgray, s:gray ] ]
let s:p.inactive.right  = [ [ s:gray, s:lgray ], [ s:lgray, s:gray ] ]
let s:p.insert.left     = [ [ s:black, s:green ], [ s:green, s:gray ] ]
let s:p.insert.right    = [ [ s:black, s:green ], [ s:green, s:gray ] ]
let s:p.normal.error    = [ [ s:red, s:black ] ]
let s:p.normal.left     = [ [ s:white, s:purple ], [ s:purple, s:gray ] ]
let s:p.normal.middle   = [ [ s:white, s:gray ] ]
let s:p.normal.right    = [ [ s:white, s:purple ], [ s:purple, s:gray ] ]
let s:p.normal.warning  = [ [ s:yellow, s:black ] ]
let s:p.replace.left    = [ [ s:black, s:red ], [ s:red, s:gray ] ]
let s:p.replace.right   = [ [ s:black, s:red ], [ s:red, s:gray ] ]
let s:p.tabline.left    = [ [ s:blue, s:gray ] ]
let s:p.tabline.middle  = [ [ s:blue, s:gray ] ]
let s:p.tabline.right   = [ [ s:black, s:blue ] ]
let s:p.tabline.tabsel  = [ [ s:black, s:blue ] ]
let s:p.visual.left     = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
let s:p.visual.right    = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]

let g:lightline#colorscheme#hotline#palette = lightline#colorscheme#flatten(s:p)

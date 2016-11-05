" =============================================================================
" Filename: autoload/lightline/colorscheme/molokai.vim
" Author: challsted
" License: MIT License
" =============================================================================
"
let s:black = '#1A1A1A'
let s:gray = '#44475a'
let s:white = '#f8f8f2'
let s:darkblue = '#1B388D'
let s:cyan = '#66D9EF'
let s:green = '#37E42E'
let s:orange = '#FF8000'
let s:pink = '#FB26BF'
let s:purple = '#8000FF'
let s:red = '#FF0000'
let s:yellow = '#E6DB74'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.insert.left = [ [ s:black, s:green ], [ s:black, s:darkblue ] ]
let s:p.visual.left = [ [ s:black, s:orange ], [ s:darkblue, s:black ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:orange, s:black ] ]
let s:p.normal.left = [ [ s:black, s:pink ], [ s:black, s:orange ] ]
let s:p.normal.middle = [ [ s:pink, s:black ] ]
let s:p.normal.right = [ [ s:white, s:gray ], [ s:white, s:gray ] ]
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:yellow, s:black ] ]
let s:p.inactive.right = [ [ s:black, s:gray ], [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:white, s:gray ] ]
let s:p.inactive.left =  [ [ s:yellow, s:black ], [ s:white, s:black ] ]
let s:p.tabline.left = [ [ s:pink, s:black ] ]
let s:p.tabline.tabsel = [ [ s:black, s:pink ] ]
let s:p.tabline.middle = [ [ s:pink, s:black] ]
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#molokai#palette = lightline#colorscheme#fill(s:p)

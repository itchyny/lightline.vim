" =============================================================================
" Filename: autoload/lightline/colorscheme/lighthaus.vim
" Author: Adhiraj Sirohi, Vasundhara Sharma
" License: MIT
" Last Change: 2020/10/05
" =============================================================================

let s:lighthaus_vim_v='1.0.0'


let s:lh01 = ['#21252D', '234']
let s:lh02 = ['#00BFA4', '43']
let s:lh03 = ['#FFFADE', '230']
let s:lh04 = ['#090B26', '233']
let s:lh05 = ['#50C16E', '71']
let s:lh06 = ['#ED722E', '208']
let s:lh07 = ['#FF5050', '203']
let s:lh08 = ['#CCCCCC', '188']
let s:lh09 = ['#FC2929', '196']
let s:lh10 = ['#FF4D00', '202']


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}


let s:p.normal.left = [ [ s:lh01, s:lh02 ], [ s:lh02, s:lh01 ] ]
let s:p.normal.middle = [ [ s:lh02, s:lh01 ] ]
let s:p.normal.right = [ [ s:lh01, s:lh02 ], [ s:lh01, s:lh02 ] ]
let s:p.normal.warning = [ [ s:lh07, s:lh01 ] ]
let s:p.normal.error = [ [ s:lh09, s:lh01 ] ]

let s:p.inactive.left =  [ [ s:lh01, s:lh08 ], [ s:lh05, s:lh01 ] ]
let s:p.inactive.middle = [ [ s:lh05, s:lh01 ] ]
let s:p.inactive.right = [ [ s:lh05, s:lh01 ], [ s:lh05, s:lh01 ] ]

let s:p.insert.left = [ [ s:lh01, s:lh05 ], [ s:lh05, s:lh01 ] ]
let s:p.insert.middle = [ [ s:lh05, s:lh01 ], [ s:lh05, s:lh01 ] ]
let s:p.insert.right = [ [ s:lh01, s:lh05 ], [ s:lh05, s:lh01 ] ]

let s:p.replace.left = [ [ s:lh01, s:lh07 ], [ s:lh07, s:lh01 ] ]
let s:p.replace.middle = [ [ s:lh07, s:lh01 ], [ s:lh07, s:lh01 ] ]
let s:p.replace.right = [ [ s:lh01, s:lh07 ], [ s:lh07, s:lh01 ] ]

let s:p.visual.left = [ [ s:lh01, s:lh06 ], [ s:lh06, s:lh01 ] ]
let s:p.visual.middle = [ [ s:lh06, s:lh01 ], [ s:lh06, s:lh01 ] ]
let s:p.visual.right = [ [ s:lh01, s:lh06 ], [ s:lh06, s:lh01 ] ]

let s:p.tabline.left = [ [ s:lh08, s:lh01 ] ]
let s:p.tabline.middle = [ [ s:lh08, s:lh01 ] ]
let s:p.tabline.right = [ [ s:lh09, s:lh01 ] ]
let s:p.tabline.tabsel = [ [ s:lh10, s:lh04 ] ]

let g:lightline#colorscheme#lighthaus#palette = lightline#colorscheme#flatten(s:p)

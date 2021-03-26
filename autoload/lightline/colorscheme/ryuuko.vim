" =============================================================================
" Filename: autoload/lightline/colorscheme/ryuuko.vim
" Author: Deep6
" License: MIT
" Last Change: 2021/03/25 20:07:00
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:ryuuko0 = ["#2E3440", "NONE"]
let s:ryuuko1 = ["#F0F0F0", 0]
let s:ryuuko2 = ["#434C5E", "NONE"]
let s:ryuuko3 = ["#99BFBA", 8]
let s:ryuuko4 = ["#D8DEE9", "NONE"]
let s:ryuuko5 = ["#7C9FA6", 7]
let s:ryuuko6 = ["#BFB7A1", 15]
let s:ryuuko7 = ["#BF9C86", 14]
let s:ryuuko8 = ["#78A090", 6]
let s:ryuuko9 = ["#81A1C1", 4]
let s:ryuuko10 = ["#232C33", 12]
let s:ryuuko11 = ["#99736E", 1]
let s:ryuuko12 = ["#D08770", 11]
let s:ryuuko13 = ["#70838C", 3]
let s:ryuuko14 = ["#A3BE8C", 2]
let s:ryuuko15 = ["#B48EAD", 5]

let s:p.normal.left = [ [ s:ryuuko1, s:ryuuko8 ], [ s:ryuuko10, s:ryuuko1 ] ]
let s:p.normal.middle = [ [ s:ryuuko5, s:ryuuko13 ] ]
let s:p.normal.right = [ [ s:ryuuko5, s:ryuuko1 ], [ s:ryuuko10, s:ryuuko1 ] ]
let s:p.normal.warning = [ [ s:ryuuko1, s:ryuuko13 ] ]
let s:p.normal.error = [ [ s:ryuuko1, s:ryuuko11 ] ]

let s:p.inactive.left =  [ [ s:ryuuko1, s:ryuuko8 ], [ s:ryuuko5, s:ryuuko1 ] ]
let s:p.inactive.middle = [ [ s:ryuuko5, s:ryuuko1 ] ]
let s:p.inactive.right = [ [ s:ryuuko5, s:ryuuko1 ], [ s:ryuuko5, s:ryuuko1 ] ]

let s:p.insert.left = [ [ s:ryuuko1, s:ryuuko5 ], [ s:ryuuko5, s:ryuuko1 ] ]
let s:p.replace.left = [ [ s:ryuuko1, s:ryuuko6 ], [ s:ryuuko6, s:ryuuko1 ] ]
let s:p.visual.left = [ [ s:ryuuko1, s:ryuuko3 ], [ s:ryuuko3, s:ryuuko1 ] ]

let s:p.tabline.left = [ [ s:ryuuko5, s:ryuuko13 ] ]
let s:p.tabline.middle = [ [ s:ryuuko5, s:ryuuko13 ] ]
let s:p.tabline.right = [ [ s:ryuuko5, s:ryuuko13 ] ]
let s:p.tabline.tabsel = [ [ s:ryuuko1, s:ryuuko8 ] ]

let g:lightline#colorscheme#ryuuko#palette = lightline#colorscheme#flatten(s:p)

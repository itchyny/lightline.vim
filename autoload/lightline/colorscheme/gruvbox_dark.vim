" =============================================================================
" Filename: autoload/lightline/colorscheme/gruvbox_dark.vim
" Author: Andis Sprinkis
" License: MIT License
" Last Change: 2021/09/20 20:47:00.
" =============================================================================
let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

let s:base03            = [ '#282828', 235 ]
let s:base02            = [ '#3c3836', 237 ]
let s:base01            = [ '#504945', 239 ]
let s:base00            = [ '#665c54', 241 ]
let s:base0             = [ '#7c6f64', 243 ]
let s:base1             = [ '#928374', 245 ]
let s:base2             = [ '#a89984', 246 ]
let s:base3             = [ '#ebdbb2', 223 ]
let s:yellow            = [ '#d79921', 172 ]
let s:orange            = [ '#d65d0e', 166 ]
let s:red               = [ '#fb3934', 124 ]
let s:magenta           = [ '#b16286', 132 ]
let s:peach             = [ '#d3869b', 175 ]
let s:blue              = [ '#458588', 66  ]
let s:cyan              = [ '#83a598', 109 ]
let s:green             = [ '#b8bb26', 142 ]
let s:white             = [ '#ebdbb2', 223 ]
 
let s:p.normal.left     = [ [ s:base03, s:cyan ], [ s:base3, s:base01 ] ]
let s:p.insert.left     = [ [ s:base03, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left    = [ [ s:base03, s:yellow ], [ s:base3, s:base01 ] ]
let s:p.visual.left     = [ [ s:base03, s:peach ], [ s:base3, s:base01 ] ]
let s:p.inactive.left   = [ [ s:base1, s:base02 ], [ s:base0, s:base02 ] ]
let s:p.normal.middle   = [ [ s:base1, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
let s:p.normal.right    = [ [ s:base03, s:base0 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right  = [ [ s:base03, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]
let s:p.normal.error    = [ [ s:red, s:base02 ] ]

let s:p.tabline.left    = [ [ s:base2, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base02, s:base03 ] ]
let s:p.tabline.right   = [ [ s:base2, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:base3, s:base00 ] ]

let g:lightline#colorscheme#gruvboxdark#palette = lightline#colorscheme#flatten(s:p)

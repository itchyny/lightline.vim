" =============================================================================
" Filename: autoload/lightline/colorscheme/selenized_dark.vim
" Author: Charles Hall
" License: MIT License
" Last Change: 2020/05/02 16:53:17.
" =============================================================================

" https://github.com/jan-warchol/selenized/blob/master/the-values.md#selenized-dark
let s:bg_1      = '#184956'
let s:bg_2      = '#2d5b69'
let s:dim_0     = '#72898f'
let s:red       = '#fa5750'
let s:green     = '#75b938'
let s:yellow    = '#dbb32d'
let s:blue      = '#4695f7'
let s:magenta   = '#f275be'
let s:cyan      = '#41c7b9'
let s:brred     = '#ff665c'
let s:brgreen   = '#84c747'
let s:bryellow  = '#ebc13d'
let s:brblue    = '#58a3ff'
let s:brmagenta = '#ff84cd'
let s:brcyan    = '#53d6c7'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.right = [[ s:bg_1, s:blue ], [ s:cyan, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.normal.left = [[ s:bg_1, s:blue ], [ s:cyan, s:bg_2 ]]
let s:p.normal.middle = [[ s:bg_1, s:bg_1 ]]
let s:p.normal.error = [[ s:bg_1, s:red ]]
let s:p.normal.warning = [[ s:bg_1, s:yellow ]]

let s:p.insert.right = [[ s:bg_1, s:green ], [ s:cyan, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.insert.left = [[ s:bg_1, s:green ], [ s:cyan, s:bg_2 ]]

let s:p.visual.right = [[ s:bg_1, s:magenta ], [ s:cyan, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.visual.left = [[ s:bg_1, s:magenta ], [ s:cyan, s:bg_2 ]]

let s:p.inactive.left = [[ s:brblue, s:bg_2 ], [ s:cyan, s:bg_2 ]]
let s:p.inactive.right = [[ s:brblue, s:bg_2 ], [ s:cyan, s:bg_2 ]]

let s:p.replace.right = [[ s:bg_1, s:red ], [ s:cyan, s:bg_2 ], [ s:dim_0, s:bg_1 ]]
let s:p.replace.left = [[ s:bg_1, s:red ], [ s:cyan, s:bg_2 ]]

let s:p.tabline.right = [[ s:bg_1, s:red ]]
let s:p.tabline.left = [[ s:cyan, s:bg_2 ]]
let s:p.tabline.tabsel = [[ s:bg_1, s:blue ]]

let g:lightline#colorscheme#selenized_dark#palette = lightline#colorscheme#fill(s:p)

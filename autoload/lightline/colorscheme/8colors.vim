" ====================================================================
" Filename: 8colors.vim 
" Author: scrouthtv 
" License: GPL3 License 
" Last Change: 2021/05/13 
" ====================================================================
let s:gray = '8'
let s:red = '1'
let s:yellow = '3'
let s:green = '2'
let s:cyan = '6'
let s:blue = '4'
let s:magenta = '5'
let s:white = '7'

" transparent:
let s:t = 'NONE'

let s:guigray = '#777777'
let s:guired = '#ff0000'
let s:guiyellow = '#ffff00'
let s:guigreen = '#00ff00'
let s:guicyan = '#00ffff'
let s:guiblue = '#0000ff'
let s:guimagenta = '#ff00ff'
let s:guiwhite = '#ffffff'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:guicyan, s:t, s:cyan, s:t, 'bold' ], [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.normal.right = [ [ s:guicyan, s:t, s:cyan, s:t ], [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.normal.middle = [ [ s:guiwhite, s:t, s:white, s:t ] ]

let s:p.normal.error = [ [ s:red, s:white ] ]
let s:p.normal.warning = [ [ s:yellow, s:white ] ]

let s:p.inactive.left = [ [ s:guigray, s:t, s:gray, s:t ], [ s:guigray, s:t, s:gray, s:t ] ]
let s:p.inactive.middle = [ [ s:guigray, s:t, s:gray, s:t ] ]
let s:p.inactive.right = [ [ s:guigray, s:t, s:gray, s:t ], [ s:guigray, s:t, s:gray, s:t ] ]

let s:p.insert.left = [ [ s:guigreen, s:t, s:green, s:t, 'bold' ], [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.replace.left = [ [ s:guired, s:t, s:red, s:t, 'bold' ], [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.visual.left = [ [ s:guiyellow, s:t, s:yellow, s:t, 'bold' ], [ s:guiwhite, s:t, s:white, s:t ] ]

let s:p.insert.right = [ [ s:guigreen, s:t, s:green, s:t ], [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.replace.right = [ [ s:guired, s:t, s:red, s:t ], [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.visual.right = [ [ s:guiyellow, s:t, s:yellow, s:t ], [ s:guiwhite, s:t, s:white, s:t ] ]

let s:p.tabline.left = [ [ s:guigray, s:t, s:gray, s:t ] ]
let s:p.tabline.tabsel = [ [ s:guiwhite, s:t, s:white, s:t ] ]
let s:p.tabline.midsel = [ [ s:guigray, s:t, s:gray, s:t ] ]
let s:p.tabline.right = [ [ s:guigray, s:t, s:gray, s:t ] ]

let g:lightline#colorscheme#8colors#palette = lightline#colorscheme#fill(s:p)

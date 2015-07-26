" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_dark.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015-07-27 06:01
" =============================================================================

let s:red     = lightline#colorscheme#PaperColor#X("#df0000")
let s:green   = lightline#colorscheme#PaperColor#X("#008700")
let s:blue    = lightline#colorscheme#PaperColor#X("#00afaf")

let s:pink    = lightline#colorscheme#PaperColor#X("#afdf00")
let s:olive   = lightline#colorscheme#PaperColor#X("#dfaf5f")
let s:navy    = lightline#colorscheme#PaperColor#X("#df875f")

let s:orange  = lightline#colorscheme#PaperColor#X("#d75f00")
let s:purple  = lightline#colorscheme#PaperColor#X("#8959a8")
let s:aqua    = lightline#colorscheme#PaperColor#X("#3e999f")

" Basics:
let s:foreground   = lightline#colorscheme#PaperColor#X("#d0d0d0")
let s:background   = lightline#colorscheme#PaperColor#X("#444444")
let s:window       = lightline#colorscheme#PaperColor#X("#efefef")
let s:status       = lightline#colorscheme#PaperColor#X("#c6c6c6")
let s:error        = lightline#colorscheme#PaperColor#X("#5f0000")

" Tabline:
let s:tabline_bg          = lightline#colorscheme#PaperColor#X("#3a3a3a")
let s:tabline_active_fg   = lightline#colorscheme#PaperColor#X("#1c1c1c")
let s:tabline_active_bg   = lightline#colorscheme#PaperColor#X("#00afaf")
let s:tabline_inactive_fg = lightline#colorscheme#PaperColor#X("#c6c6c6")
let s:tabline_inactive_bg = lightline#colorscheme#PaperColor#X("#585858")

" Statusline:
let s:statusline_active_fg   = lightline#colorscheme#PaperColor#X("#1c1c1c")
let s:statusline_active_bg   = lightline#colorscheme#PaperColor#X("#5f8787")
let s:statusline_inactive_fg = lightline#colorscheme#PaperColor#X("#c6c6c6")
let s:statusline_inactive_bg = lightline#colorscheme#PaperColor#X("#444444")

" Visual:
let s:visual_fg = lightline#colorscheme#PaperColor#X("#000000")
let s:visual_bg = lightline#colorscheme#PaperColor#X("#8787af")

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right    = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle   = [ [ s:statusline_active_fg, s:statusline_active_bg ]]
let s:p.inactive.right  = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left   = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:foreground, s:background ], ]
let s:p.insert.left     = [ [ s:background, s:blue], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.replace.left    = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left     = [ [ s:visual_fg, s:visual_bg ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ]  ]
let s:p.tabline.left    = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel  = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle  = [ [s:tabline_bg, s:tabline_bg]]
let s:p.tabline.right   = copy(s:p.normal.right)
let s:p.normal.error    = [ [ s:background, s:error ] ]

let g:lightline#colorscheme#PaperColor_dark#palette = lightline#colorscheme#flatten(s:p)

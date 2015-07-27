" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_light.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015/07/28 07:12:26.
" =============================================================================

let s:red     = lightline#colorscheme#PaperColor#color("#df0000")       "Include/Exception
let s:green   = lightline#colorscheme#PaperColor#color("#008700")       "Boolean/Special
let s:blue    = lightline#colorscheme#PaperColor#color("#4271ae")       "Keyword
let s:pink    = lightline#colorscheme#PaperColor#color("#d7005f")       "Type
let s:olive   = lightline#colorscheme#PaperColor#color("#718c00")       "String
let s:navy    = lightline#colorscheme#PaperColor#color("#005f87")       "StorageClass
let s:orange  = lightline#colorscheme#PaperColor#color("#d75f00")       "Number
let s:purple  = lightline#colorscheme#PaperColor#color("#8959a8")       "Repeat/Conditional
let s:aqua    = lightline#colorscheme#PaperColor#color("#3e999f")       "Operator/Delimiter


" Basics:
let s:foreground   = lightline#colorscheme#PaperColor#color("#4d4d4c")
let s:background   = lightline#colorscheme#PaperColor#color("#F5F5F5")
let s:window       = lightline#colorscheme#PaperColor#color("#efefef")
let s:status       = s:aqua
let s:error        = lightline#colorscheme#PaperColor#color("#ffafdf")

" Tabline:
let s:tabline_bg          = s:navy
let s:tabline_active_fg   = s:foreground
let s:tabline_active_bg   = s:window
let s:tabline_inactive_fg = s:background
let s:tabline_inactive_bg = s:aqua

" Statusline:
let s:statusline_active_fg   = s:window
let s:statusline_active_bg   = s:navy
let s:statusline_inactive_fg = s:foreground
let s:statusline_inactive_bg = lightline#colorscheme#PaperColor#color("#dadada")

" Visual:
let s:visual_fg = s:background
let s:visual_bg = s:blue

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right    = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle   = [ [ s:statusline_active_fg, s:statusline_active_bg ]]
let s:p.inactive.right  = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left   = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:foreground, s:background ], ]
let s:p.insert.left     = [ [ s:blue, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.replace.left    = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left     = [ [ s:background, s:blue ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ]  ]
let s:p.tabline.left    = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel  = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle  = [ [s:tabline_bg, s:tabline_bg]]
let s:p.tabline.right   = copy(s:p.normal.right)
let s:p.normal.error    = [ [ s:background, s:error ] ]
let s:p.normal.warning  = [ [ s:background, s:olive ] ]

let g:lightline#colorscheme#PaperColor_light#palette = lightline#colorscheme#flatten(s:p)

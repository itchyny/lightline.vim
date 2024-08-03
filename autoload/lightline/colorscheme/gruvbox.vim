" =============================================================================
" Filename: autoload/lightline/colorscheme/gruvbox.vim
" Author: carlostobon (Based on the original Gruvbox theme.)
" License: MIT License
" Last Change: Sat Aug 3 2024
" =============================================================================

let s:blue = '#83a598'
let s:aqua = '#8ec07c'
let s:light_blue = '#106576'
let s:light_red = '#ad3b14'
let s:light_green = '#b8bb26'
let s:bg0 = '#282828'
let s:bg1 = '#3c3836'
let s:bg2 = '#504945'
let s:bg3 = '#665c54'
let s:bg4 = '#7c6f64'
let s:gray = '#928374'
let s:fg0 = '#fbf1c7'
let s:fg1 = '#ebdbb2'
let s:fg2 = '#d5c4a1'
let s:fg3 = '#bdae93'
let s:fg4 = '#a89984'
let s:orange = '#fe8019'


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:fg0, s:bg4 ], [ s:bg4, s:fg2 ] ]
let s:p.normal.right = [ [ s:fg0, s:bg4 ], [ s:bg4, s:fg2 ] ]
let s:p.normal.middle = [ [ s:bg3, s:fg1 ] ]
let s:p.insert.left = [ [ s:fg0, s:light_blue ], [ s:bg4, s:fg2 ] ]
let s:p.insert.right = [ [ s:fg0, s:light_blue ], [ s:bg4, s:fg2 ] ]
let s:p.insert.middle = [ [ s:bg4, s:fg2 ] ]
let s:p.visual.left = [ [ s:fg0, s:light_red ], [ s:bg4, s:fg2 ] ]
let s:p.visual.right = [ [ s:fg0, s:light_red ], [ s:bg4, s:fg2 ] ]
let s:p.visual.middle = [ [ s:fg0, s:gray ] ]
let s:p.replace.left = [ [ s:fg0, s:light_green ], [ s:bg1, s:fg2 ] ]
let s:p.replace.right = [ [ s:fg0, s:light_green ] ]
let s:p.tabline.left = [ [ s:bg4, s:fg2 ] ]
let s:p.tabline.right = [ [ s:bg4, s:fg2 ] ]
let s:p.tabline.middle = [ [ s:bg4, s:fg2 ] ]
let s:p.tabline.tabsel = [ [ s:fg0, s:bg4 ] ]
let s:p.inactive.left = [ [ s:fg0, s:bg4 ], [ s:bg4, s:fg2 ] ]
let s:p.inactive.right = [ [ s:fg0, s:bg4 ], [ s:bg4, s:fg2 ] ]
let s:p.inactive.middle = [ [ s:bg3, s:fg1 ] ]
let s:p.normal.error = [ [ s:light_red, s:fg0 ] ]
let s:p.normal.warning = [ [ s:orange, s:fg0 ] ]

if lightline#colorscheme#background() ==# 'dark'
  let s:p.normal.left = [ [ s:bg0, s:fg4 ], [ s:fg3, s:bg2 ] ]
  let s:p.normal.right = [ [ s:bg0, s:fg4 ], [ s:fg3, s:bg2 ] ]
  let s:p.normal.middle = [ [ s:fg4, s:bg1 ] ]
  let s:p.insert.left = [ [ s:bg0, s:blue ], [ s:fg3, s:bg2 ] ]
  let s:p.insert.right = [ [ s:bg0, s:blue ], [ s:fg3, s:bg2 ] ]
  let s:p.insert.middle = [ [ s:fg3, s:bg2 ] ]
  let s:p.visual.left = [ [ s:bg0, s:orange ], [ s:fg3, s:bg2 ] ]
  let s:p.visual.right = [ [ s:bg0, s:orange ], [ s:fg3, s:bg2 ] ]
  let s:p.visual.middle = [ [ s:bg0, s:bg4 ] ]
  let s:p.replace.left = [ [ s:bg0, s:aqua ], [ s:fg3, s:bg2 ] ]
  let s:p.replace.right = [ [ s:bg0, s:aqua ] ]
  let s:p.inactive.left = [ [ s:bg0, s:fg4 ], [ s:fg3, s:bg2 ] ]
  let s:p.inactive.right = [ [ s:bg0, s:fg4 ], [ s:fg3, s:bg2 ] ]
  let s:p.inactive.middle = [ [ s:fg4, s:bg1 ] ]
  let s:p.tabline.left = [ [ s:fg3, s:bg2 ] ]
  let s:p.tabline.right = [ [ s:fg3, s:bg2 ] ]
  let s:p.tabline.middle = [ [ s:fg3, s:bg2 ] ]
  let s:p.tabline.tabsel = [ [ s:bg0, s:fg4 ] ]
  let s:p.normal.error = [ [ s:light_red, s:bg0 ] ]
  let s:p.normal.warning = [ [ s:orange, s:bg0 ] ]
endif

let g:lightline#colorscheme#gruvbox#palette = lightline#colorscheme#fill(s:p)

" =============================================================================
" Filename: autoload/lightline/colorscheme/lucius.vim
" Author: smaugfm
" License: MIT License
" =============================================================================

function! s:Color(fg, bg)
    return [ synIDattr(synIDtrans(hlID(a:fg)), 'fg#'), synIDattr(synIDtrans(hlID(a:bg)), 'bg#') ]
endfunction

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ s:Color('Normal', 'CursorColumn'), s:Color('Normal', 'Visual') ]
let s:p.normal.middle = [ s:Color('Cursor', 'Cursor') ]
let s:p.normal.right = [ s:Color('Normal', 'CursorColumn'), s:Color('Normal', 'Visual') ]
let s:p.normal.error = [ s:Color('ErrorMsg', 'CursorColumn') ]
let s:p.normal.warning = [ s:Color('WarningMsg', 'CursorColumn') ]

let s:p.tabline.left = [ s:Color('Normal', 'CursorColumn'), s:Color('Normal', 'Visual') ]
let s:p.tabline.middle = [ s:Color('Cursor', 'Cursor') ]
let s:p.tabline.tabsel = [ s:Color('TabLineSel', 'TabLineSel') ]
let s:p.tabline.right = [ s:Color('Normal', 'CursorColumn'), s:Color('Normal', 'Visual') ]

let s:p.inactive.right = [ s:Color('PmenuThumb', 'PmenuThumb'), s:Color('TabLineFill', 'TabLineFill') ]
let s:p.inactive.middle = [ s:Color('PmenuSbar','PmenuSbar') ]
let s:p.inactive.left = [ s:Color('PmenuThumb', 'PmenuThumb'), s:Color('TabLineFill', 'TabLineFill') ]

let s:p.insert.left = [ s:Color('DiffAdd','DiffAdd'), s:Color('Normal', 'Visual') ]
let s:p.replace.left = [ s:Color('DiffDelete','DiffDelete'), s:Color('Normal', 'Visual') ]
let s:p.visual.left = [ s:Color('DiffChange', 'DiffChange'), s:Color('Normal', 'Visual') ]

let g:lightline#colorscheme#lucius#palette = lightline#colorscheme#fill(s:p)

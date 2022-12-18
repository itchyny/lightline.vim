" ------------------------------------------------------------------------------------------------------------
" File: retrobox.vim
" Description: Retro groove color scheme similar to gruvbox originally designed by morhetz <morhetz@gmail.com>
" Author: Prateek Tade <prateek.tade@gmail.com>, ported from gruvbox8 of Lifepillar <lifepillar@lifepillar.me>
" Source: https://github.com/itchyny/lightline.vim
" Last Modified: 18 Dec 2022
" ------------------------------------------------------------------------------------------------------------

if &background ==# 'dark'
    let s:bg0 =    ['#1c1c1c', 234]
    let s:bg1 =    ['#3c3836', 237]
    let s:bg2 =    ['#504945', 239]
    let s:bg4 =    ['#7c6f64', 243]
    let s:fg1 =    ['#ebdbb2', 187]
    let s:fg4 =    ['#a89984', 137]
    let s:yellow = ['#fabd2f', 214]
    let s:blue =   ['#82a598', 109]
    let s:aqua =   ['#8ec07c', 107]
    let s:orange = ['#fe8019', 208]
    let s:green =  ['#b8bb26', 142]
else
    let s:bg0 =    ['#fbf1c7', 230]
    let s:bg1 =    ['#ebdbb2', 187]
    let s:bg2 =    ['#e5d4b1', 188]
    let s:bg4 =    ['#a89984', 137]
    let s:fg1 =    ['#3c3836', 237]
    let s:fg4 =    ['#7c6f64', 243]
    let s:yellow = ['#b57614', 172]
    let s:blue =   ['#076678',  23]
    let s:aqua =   ['#427b58',  29]
    let s:orange = ['#ff5f00', 202]
    let s:green =  ['#79740e',  64]
endif

if exists('g:lightline')

    let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
    let s:p.normal.left = [ [ s:bg0, s:fg4, 'bold' ], [ s:fg4, s:bg2 ] ]
    let s:p.normal.right = [ [ s:bg0, s:fg4 ], [ s:fg4, s:bg2 ] ]
    let s:p.normal.middle = [ [ s:fg4, s:bg1 ] ]
    let s:p.inactive.right = [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
    let s:p.inactive.left =  [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
    let s:p.inactive.middle = [ [ s:bg4, s:bg1 ] ]
    let s:p.insert.left = [ [ s:bg0, s:blue, 'bold' ], [ s:fg1, s:bg2 ] ]
    let s:p.insert.right = [ [ s:bg0, s:blue ], [ s:fg1, s:bg2 ] ]
    let s:p.insert.middle = [ [ s:fg4, s:bg2 ] ]
    let s:p.terminal.left = [ [ s:bg0, s:green, 'bold' ], [ s:fg1, s:bg2 ] ]
    let s:p.terminal.right = [ [ s:bg0, s:green ], [ s:fg1, s:bg2 ] ]
    let s:p.terminal.middle = [ [ s:fg4, s:bg2 ] ]
    let s:p.replace.left = [ [ s:bg0, s:aqua, 'bold' ], [ s:fg1, s:bg2 ] ]
    let s:p.replace.right = [ [ s:bg0, s:aqua ], [ s:fg1, s:bg2 ] ]
    let s:p.replace.middle = [ [ s:fg4, s:bg2 ] ]
    let s:p.visual.left = [ [ s:bg0, s:orange, 'bold' ], [ s:bg0, s:bg4 ] ]
    let s:p.visual.right = [ [ s:bg0, s:orange ], [ s:bg0, s:bg4 ] ]
    let s:p.visual.middle = [ [ s:fg4, s:bg1 ] ]
    let s:p.tabline.left = [ [ s:fg4, s:bg2 ] ]
    let s:p.tabline.tabsel = [ [ s:bg0, s:fg4 ] ]
    let s:p.tabline.middle = [ [ s:bg0, s:bg0 ] ]
    let s:p.tabline.right = [ [ s:bg0, s:orange ] ]
    let s:p.normal.error = [ [ s:bg0, s:orange ] ]
    let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]

    let g:lightline#colorscheme#retrobox#palette = lightline#colorscheme#flatten(s:p)
endif

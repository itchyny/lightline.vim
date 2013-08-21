let s:c = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}}
let s:c.normal.left = [ ['#0000ff', '#ffffff', 21, 231 ], [ '#ffffff', '#0000ff', 231, 21 ], [ '#ffffff', '#0000ff', 231, 21 ] ]
let s:c.normal.right = [ [ '#303030', '#d0d0d0', 236, 252 ], [ '#303030', '#8a8a8a', 236, 245 ], [ '#bcbcbc', '#585858', 250, 240 ] ]
let s:c.inactive.right = [ [ '#121212', '#606060', 233, 241 ], [ '#121212', '#3a3a3a', 233, 237 ], [ '#121212', '#262626', 233, 235 ], [ '#121212', '#262626', 233, 235 ] ]
let s:c.inactive.left = s:c.inactive.right[1:]
let s:c.insert.left =  [ ['#005f00', '#ffffff', 22, 231 ], [ '#ffffff', '#005f00', 231, 22 ], [ '#ffffff', '#005f00', 231, 22 ] ]
let s:c.replace.left = [ [ '#af0000', '#ffffff', 124, 231 ], [ '#ffffff', '#af0000', 231, 124 ], [ '#ffffff', '#af0000', 231, 124 ] ]
let s:c.visual.left = [ [ '#5f00ff', '#ffffff', 57, 231 ], [ '#ffffff', '#5f00ff', 231, 57 ], [ '#ffffff', '#5f00ff', 231, 57 ] ]
let s:c.normal.middle = [ '#ffffff', '#303030', 231, 236 ]
let s:c.inactive.middle = [ '#303030', '#121212', 236, 233 ]

let g:lightline#colorscheme#default#color = s:c

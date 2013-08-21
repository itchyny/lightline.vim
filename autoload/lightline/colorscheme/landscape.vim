
function! lightline#colorscheme#landscape#init()
  let c = g:lightline.color
  let c.normal.left = [ ['#0000ff', '#ffffff', 21, 231 ], [ '#ffffff', '#0000ff', 231, 21 ], [ '#ffffff', '#0000ff', 231, 21 ] ]
  let c.normal.right = [ [ '#303030', '#d0d0d0', 236, 252 ], [ '#303030', '#8a8a8a', 236, 245 ], [ '#bcbcbc', '#585858', 250, 240 ] ]
  let c.inactive.right = [ [ '#121212', '#606060', 233, 241 ], [ '#121212', '#3a3a3a', 233, 237 ], [ '#121212', '#262626', 233, 235 ], [ '#121212', '#262626', 233, 235 ] ]
  let c.inactive.left = g:lightline.color.inactive.right[1:]
  let c.insert.left =  [ ['#005f00', '#ffffff', 22, 231 ], [ '#ffffff', '#005f00', 231, 22 ], [ '#ffffff', '#005f00', 231, 22 ] ]
  let c.replace.left = [ [ '#af0000', '#ffffff', 124, 231 ], [ '#ffffff', '#af0000', 231, 124 ], [ '#ffffff', '#af0000', 231, 124 ] ]
  let c.visual.left = [ [ '#5f00ff', '#ffffff', 57, 231 ], [ '#ffffff', '#5f00ff', 231, 57 ], [ '#ffffff', '#5f00ff', 231, 57 ] ]
  let c.normal.middle = [ '#ffffff', '#303030', 231, 236 ]
  let c.inactive.middle = [ '#303030', '#121212', 236, 233 ]
endfunction


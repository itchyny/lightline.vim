
function! lightline#colorscheme#default#init()
  let g:lightline.color.normal.left = [ [ 21, 231 ], [ 231, 21 ], [ 231, 21 ] ]
  let g:lightline.color.normal.right = [ [ 236, 252 ], [ 236, 245 ], [ 250, 240 ] ]
  let g:lightline.color.inactive.right = [ [ 233, 241 ], [ 233, 237 ], [ 233, 235 ], [ 233, 235 ] ]
  let g:lightline.color.inactive.left = g:lightline.color.inactive.right[1:]
  let g:lightline.color.insert.left = [ [ 22, 231 ], [ 231, 22 ], [ 231, 22 ] ]
  let g:lightline.color.replace.left = [ [ 124, 231 ], [ 231, 124 ], [ 231, 124 ] ]
  let g:lightline.color.visual.left = [ [ 57, 231 ], [ 231, 57 ], [ 231, 57 ] ]
  let g:lightline.color.normal.middle = [ 231, 236 ]
  let g:lightline.color.inactive.middle = [ 236, 233 ]
endfunction


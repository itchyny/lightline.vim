" =============================================================================
" Filename: autoload/lightline/colorscheme/papercolor.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015-07-26 20:34
" =============================================================================
if &background ==# 'light'
  let g:lightline#colorscheme#papercolor#palette = g:lightline#colorscheme#papercolor_light#palette
else
  let g:lightline#colorscheme#papercolor#palette = g:lightline#colorscheme#papercolor_dark#palette
endif

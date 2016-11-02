" =============================================================================
" Filename: autoload/lightline/colorscheme/one.vim
" Author: Zoltan Dalmadi
" License: MIT License
" Last Change: 2016/11/2 14:56:14.
" =============================================================================

if &background ==# 'light'
	let g:lightline#colorscheme#one#palette = g:lightline#colorscheme#one_light#palette
else
	let g:lightline#colorscheme#one#palette = g:lightline#colorscheme#one_dark#palette
endif

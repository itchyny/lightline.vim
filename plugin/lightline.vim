" =============================================================================
" Filename: plugin/lightline.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/24 18:22:31.
" =============================================================================

if exists('g:loaded_lightline') && g:loaded_lightline
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

augroup LightLine
  autocmd!
  autocmd ColorScheme * call lightline#update(1)
  autocmd WinEnter,BufWinEnter,FileType * call lightline#update(0)
  autocmd CursorMoved,BufUnload * call lightline#update_once()
augroup END

let g:loaded_lightline = 1

let &cpo = s:save_cpo
unlet s:save_cpo

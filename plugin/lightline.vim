" =============================================================================
" Filename: plugin/lightline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2014/12/14 14:27:59.
" =============================================================================

if exists('g:loaded_lightline') || v:version < 700
  finish
endif
let g:loaded_lightline = 1

let s:save_cpo = &cpo
set cpo&vim

augroup LightLine
  autocmd!
  autocmd WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * call lightline#update()
  autocmd ColorScheme,SessionLoadPost * call lightline#highlight()
  autocmd CursorMoved,BufUnload * call lightline#update_once()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

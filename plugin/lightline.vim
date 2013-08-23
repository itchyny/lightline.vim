" =============================================================================
" Filename: plugin/lightline.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/23 14:19:14.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

augroup LightLine
  autocmd!
  autocmd ColorScheme * call lightline#highlight()
  autocmd WinEnter,BufWinEnter * call lightline#update()
  autocmd CursorMoved,FileType,BufUnload * call lightline#update_once()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

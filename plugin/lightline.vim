" =============================================================================
" Filename: plugin/lightline.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/22 19:06:29.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

augroup LightLine
  autocmd!
  autocmd ColorScheme * call lightline#highlight()
  autocmd WinEnter,BufWinEnter * call lightline#update()
  autocmd CursorMoved,FileType * call lightline#update_once()
  autocmd InsertLeave * call lightline#update(1)
  autocmd InsertEnter * call lightline#update(0)
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

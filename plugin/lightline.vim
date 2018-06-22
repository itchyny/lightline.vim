" =============================================================================
" Filename: plugin/lightline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2018/06/22 08:49:00.
" =============================================================================

if exists('g:loaded_lightline') || v:version < 700
  finish
endif
let g:loaded_lightline = 1

let s:save_cpo = &cpo
set cpo&vim

call lightline#augroup()

let &cpo = s:save_cpo
unlet s:save_cpo

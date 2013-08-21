let s:save_cpo = &cpo
set cpo&vim

augroup LightLine
  autocmd!
  autocmd WinEnter,BufWinEnter * call lightline#update()
  autocmd CursorMoved,FileType * call lightline#update_once()
  autocmd InsertLeave * call lightline#update(1)
  autocmd InsertEnter * call lightline#update(0)
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

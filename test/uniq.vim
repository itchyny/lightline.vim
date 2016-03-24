let s:suite = themis#suite('uniq')
let s:assert = themis#helper('assert')

function! s:uniq(...)
  return call(SID('uniq'), a:000)
endfunction

function! s:suite.nil()
  call s:assert.equals(s:uniq([]), [])
endfunction

function! s:suite.one()
  call s:assert.equals(s:uniq(['foo']), ['foo'])
endfunction

function! s:suite.two()
  call s:assert.equals(s:uniq(['foo', 'bar']), ['bar', 'foo'])
endfunction

function! s:suite.three()
  call s:assert.equals(s:uniq(['foo', 'bar', 'baz']), ['bar', 'baz', 'foo'])
endfunction

function! s:suite.two_duplicated()
  call s:assert.equals(s:uniq(['foo', 'foo']), ['foo'])
endfunction

function! s:suite.three_duplicated()
  call s:assert.equals(s:uniq(['foo', 'bar', 'foo']), ['bar', 'foo'])
endfunction

function! s:suite.many()
  call s:assert.equals(s:uniq(['foo', 'bar', 'foo', 'baz', 'baz', 'qux', 'foo']), ['bar', 'baz', 'foo', 'qux'])
endfunction

let s:suite = themis#suite('unique')
let s:assert = themis#helper('assert')

function! s:unique(...)
  return call(SID('unique'), a:000)
endfunction

function! s:suite.nil()
  call s:assert.equals(s:unique([]), [])
endfunction

function! s:suite.one()
  call s:assert.equals(s:unique(['foo']), ['foo'])
endfunction

function! s:suite.two()
  call s:assert.equals(s:unique(['foo', 'bar']), ['bar', 'foo'])
endfunction

function! s:suite.three()
  call s:assert.equals(s:unique(['foo', 'bar', 'baz']), ['bar', 'baz', 'foo'])
endfunction

function! s:suite.two_duplicated()
  call s:assert.equals(s:unique(['foo', 'foo']), ['foo'])
endfunction

function! s:suite.three_duplicated()
  call s:assert.equals(s:unique(['foo', 'bar', 'foo']), ['bar', 'foo'])
endfunction

function! s:suite.many()
  call s:assert.equals(s:unique(['foo', 'bar', 'foo', 'baz', 'baz', 'qux', 'foo']), ['bar', 'baz', 'foo', 'qux'])
endfunction

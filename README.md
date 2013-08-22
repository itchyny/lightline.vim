# lightline.vim
A light and configurable statusline for Vim

### powerline theme (default)
![lightline.vim - powerline - normal](https://raw.github.com/itchyny/lightline.vim/master/image/powerline/1.png)
![lightline.vim - powerline - insert](https://raw.github.com/itchyny/lightline.vim/master/image/powerline/2.png)
![lightline.vim - powerline - visual](https://raw.github.com/itchyny/lightline.vim/master/image/powerline/3.png)
![lightline.vim - powerline - replace](https://raw.github.com/itchyny/lightline.vim/master/image/powerline/4.png)

### wombat (with patched font)

![lightline.vim - wombat - normal](https://raw.github.com/itchyny/lightline.vim/master/image/wombat/1.png)
![lightline.vim - wombat - insert](https://raw.github.com/itchyny/lightline.vim/master/image/wombat/2.png)
![lightline.vim - wombat - visual](https://raw.github.com/itchyny/lightline.vim/master/image/wombat/3.png)
![lightline.vim - wombat - replace](https://raw.github.com/itchyny/lightline.vim/master/image/wombat/4.png)

### jellybeans (with patched font)

![lightline.vim - jellybeans - normal](https://raw.github.com/itchyny/lightline.vim/master/image/jellybeans/1.png)
![lightline.vim - jellybeans - insert](https://raw.github.com/itchyny/lightline.vim/master/image/jellybeans/2.png)
![lightline.vim - jellybeans - visual](https://raw.github.com/itchyny/lightline.vim/master/image/jellybeans/3.png)
![lightline.vim - jellybeans - replace](https://raw.github.com/itchyny/lightline.vim/master/image/jellybeans/4.png)

### solarized theme (dark)

![lightline.vim - solarized_dark - normal](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_dark/1.png)
![lightline.vim - solarized_dark - insert](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_dark/2.png)
![lightline.vim - solarized_dark - visual](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_dark/3.png)
![lightline.vim - solarized_dark - replace](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_dark/4.png)

### solarized theme (light)

![lightline.vim - solarized_light - normal](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_light/1.png)
![lightline.vim - solarized_light - insert](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_light/2.png)
![lightline.vim - solarized_light - visual](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_light/3.png)
![lightline.vim - solarized_light - replace](https://raw.github.com/itchyny/lightline.vim/master/image/solarized_light/4.png)


### landscape theme (with patched font)

![lightline.vim - landscape - normal](https://raw.github.com/itchyny/lightline.vim/master/image/landscape/1.png)
![lightline.vim - landscape - insert](https://raw.github.com/itchyny/lightline.vim/master/image/landscape/2.png)
![lightline.vim - landscape - visual](https://raw.github.com/itchyny/lightline.vim/master/image/landscape/3.png)
![lightline.vim - landscape - replace](https://raw.github.com/itchyny/lightline.vim/master/image/landscape/4.png)
With branch name, readonly mark and modified mark.
![lightline.vim - landscape - fugitive](https://raw.github.com/itchyny/lightline.vim/master/image/landscape/5.png)

## Why yet another clone for powerline?
+ vim-powerline is a nice plugin, but deprecated.
+ vim-airline is a nice plugin, but not configurable. Also, it does *too much* for other plugins, which should be done by users in .vimrc.

## Author
itchyny (https://github.com/itchyny)

## License
MIT License

## Installation
### Manually
1. Put all files under $VIM.

### Vundle (https://github.com/gmarik/vundle)
1. Add the following configuration to your .vimrc.

        Bundle 'itchyny/lightline.vim'

2. Install with `:BundleInstall`.

### NeoBundle (https://github.com/Shougo/neobundle.vim)
1. Add the following configuration to your .vimrc.

        NeoBundle 'itchyny/lightline.vim'

2. Install with `:NeoBundleInstall`.

## Configuration tutorial
In default, the statusline looks like:
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/1.png)
If you want a wombat colorscheme, add the folowing setting to your .vimrc (or \_vimrc in Windows):
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ }
```
to get:
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/2.png)

If you have installed vim-fugitive, the branch status is automatically available:
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/3.png)
but you find it annoying! So you add to your .vimrc:
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ] }
        \ }
```
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/4.png)
OK. The branch section has been removed.
The `g:lightline.active.left` stands for the components which appears on the left hand side, for the active window.

You find the read-only mark is not cool:
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/5.png)
So you add the component setting (the following setting is effective with the patched font for vim-powerline):
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ] },
        \ 'component': {
        \   'readonly': '%{&readonly?"⭤":""}'
        \ }
        \ }
```
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/6.png)
How nice!

But the boundaries are quadrilateral. You may miss the powerline.
You have installed a cool font for powerlines, so you can use it.
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ] },
        \ 'component': {
        \   'readonly': '%{&readonly?"⭤":""}'
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
```
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/7.png)
Hurrah! Cool!


Now, you look into a help file to find the marks annoying.
Help files are read-only and no-modifiable? We know, of cource!
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/8.png)
OK, so you again edit your .vimrc.
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ] },
        \ 'component': {
        \   'readonly': '%{&filetype!="help"&& &readonly?"⭤":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
```
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/9.png)
Huh? Weird!
The component does not collapse even if it has no information!
In order to avoid this, you set expressions to component\_flag, which becomes 1 only when the corresponding components have information.
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ] },
        \ 'component': {
        \   'readonly': '%{&filetype!="help"&& &readonly?"⭤":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
        \ },
        \ 'component_flag': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
```
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/10.png)
Okay. Works nice.


However, you may wonder we cannot gather these settings?
Or, if you want to do something more complicated?


In fact, the components can be created using functions.
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ] },
        \ 'component_func': {
        \   'readonly': 'MyReadonly',
        \   'modified': 'MyModified'
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
  function! MyModified()
    if &filetype == "help"
      return ""
    elseif &modified
      return "+"
    elseif &modifiable
      return ""
    else
      return ""
    endif
  endfunction
  function! MyReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "⭤"
    else
      return ""
    endif
  endfunction
```
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/11.png)
Fine and readable! 


Finally, you come up with concatenating the three components:
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/12.png)
Now you may know what to do.
```vim
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'filename' ] ] },
        \ 'component_func': {
        \   'filename': 'MyFilename',
        \   'readonly': 'MyReadonly',
        \   'modified': 'MyModified'
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
  function! MyModified()
    if &filetype == "help"
      return ""
    elseif &modified
      return "+"
    elseif &modifiable
      return ""
    else
      return ""
    endif
  endfunction
  function! MyReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "⭤"
    else
      return ""
    endif
  endfunction
  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
         \ ('' != expand('%t') ? expand('%t') : '[No Name]') .
         \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction
```
Define your own filename component. It has priority over the component lightline has.
![lightline.vim - tutorial](https://raw.github.com/itchyny/lightline.vim/master/image/tutorial/13.png)
Looks nice.

Of cource, you can name your component as you wish.
```vim
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'my_filename' ] ] },
        \ 'component_func': {
        \   'my_filename': 'MyFilename', ...
```

This is the end of the tutorial. Good luck with your nice statusline.

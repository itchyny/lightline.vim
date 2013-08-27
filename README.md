# lightline.vim
A light and configurable statusline for Vim

https://github.com/itchyny/lightline.vim

### powerline theme (default)

![lightline.vim - powerline - normal](https://raw.github.com/wiki/itchyny/lightline.vim/image/powerline/1.png)
![lightline.vim - powerline - insert](https://raw.github.com/wiki/itchyny/lightline.vim/image/powerline/2.png)
![lightline.vim - powerline - visual](https://raw.github.com/wiki/itchyny/lightline.vim/image/powerline/3.png)
![lightline.vim - powerline - replace](https://raw.github.com/wiki/itchyny/lightline.vim/image/powerline/4.png)

### wombat (with the patched font)

![lightline.vim - wombat - normal](https://raw.github.com/wiki/itchyny/lightline.vim/image/wombat/1.png)
![lightline.vim - wombat - insert](https://raw.github.com/wiki/itchyny/lightline.vim/image/wombat/2.png)
![lightline.vim - wombat - visual](https://raw.github.com/wiki/itchyny/lightline.vim/image/wombat/3.png)
![lightline.vim - wombat - replace](https://raw.github.com/wiki/itchyny/lightline.vim/image/wombat/4.png)

### jellybeans (with the patched font)

![lightline.vim - jellybeans - normal](https://raw.github.com/wiki/itchyny/lightline.vim/image/jellybeans/1.png)
![lightline.vim - jellybeans - insert](https://raw.github.com/wiki/itchyny/lightline.vim/image/jellybeans/2.png)
![lightline.vim - jellybeans - visual](https://raw.github.com/wiki/itchyny/lightline.vim/image/jellybeans/3.png)
![lightline.vim - jellybeans - replace](https://raw.github.com/wiki/itchyny/lightline.vim/image/jellybeans/4.png)

### solarized theme (dark)

![lightline.vim - solarized_dark - normal](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_dark/1.png)
![lightline.vim - solarized_dark - insert](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_dark/2.png)
![lightline.vim - solarized_dark - visual](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_dark/3.png)
![lightline.vim - solarized_dark - replace](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_dark/4.png)

### solarized theme (light)

![lightline.vim - solarized_light - normal](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_light/1.png)
![lightline.vim - solarized_light - insert](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_light/2.png)
![lightline.vim - solarized_light - visual](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_light/3.png)
![lightline.vim - solarized_light - replace](https://raw.github.com/wiki/itchyny/lightline.vim/image/solarized_light/4.png)


### landscape theme (with the patched font)

![lightline.vim - landscape - normal](https://raw.github.com/wiki/itchyny/lightline.vim/image/landscape/1.png)
![lightline.vim - landscape - insert](https://raw.github.com/wiki/itchyny/lightline.vim/image/landscape/2.png)
![lightline.vim - landscape - visual](https://raw.github.com/wiki/itchyny/lightline.vim/image/landscape/3.png)
![lightline.vim - landscape - replace](https://raw.github.com/wiki/itchyny/lightline.vim/image/landscape/4.png)

With branch name, read-only mark and modified mark.
![lightline.vim - landscape - fugitive](https://raw.github.com/wiki/itchyny/lightline.vim/image/landscape/5.png)

landscape is my colorscheme, which is a high-contrast cui-supported colorscheme, available at https://github.com/itchyny/landscape.vim

## Why yet another clone of powerline?
+ [vim-powerline](https://github.com/Lokaltog/vim-powerline) is a nice plugin, but deprecated.
+ [powerline](https://github.com/Lokaltog/powerline) is a nice plugin, but difficult to configure.
+ [vim-airline](https://github.com/bling/vim-airline) is a nice plugin, but not configurable. Also, it does *too much* for other plugins, which should be done by users in `.vimrc`.

## Spirit of this plugin
+ Minimalism. The core script is very small.
+ Configurability. You can create your own component and easily add to the statusline.
+ Orthogonality. Any plugin should not change the settings of another plugin. Such plugin-crossing settings should be written by users in `.vimrc`.

## Author
itchyny (https://github.com/itchyny)

## License
MIT License

## Installation
### Manually
1. Put all files under $VIM.

### Pathogen
1. Install with the following command.

        git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim

### Vundle (https://github.com/gmarik/vundle)
1. Add the following configuration to your `.vimrc`.

        Bundle 'itchyny/lightline.vim'

2. Install with `:BundleInstall`.

### NeoBundle (https://github.com/Shougo/neobundle.vim)
1. Add the following configuration to your `.vimrc`.

        NeoBundle 'itchyny/lightline.vim'

2. Install with `:NeoBundleInstall`.

## Configuration tutorial
By default, the statusline looks like:
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/1.png)

If you use the wombat colorscheme, add the following settings to your `.vimrc` (or \_vimrc on Windows):
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
```
to get:
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/2.png)


If your statusline looks like
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/21.png)

and the cool statuslines appear only on `:vsp`, add
```vim
set laststatus=2
```
to your `.vimrc`.


If you have problem like
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/20.png)

then add
```sh
export TERM=xterm-256color
```
to your `.*shrc` and add
```vim
if !has('gui_running')
  set t_Co=256
endif
```
to your `.vimrc`.


Colors appear correctly? Now let's see how to change the appearance.


You may think that the default read-only mark is not so cool:
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/3.png)

Then edit the read-only component.
The lightline components are stored in `g:lightline.component`.
So you add the settings of `g:lightline.component.readonly` in your `.vimrc`. (the following settings are effective with the patched font for vim-powerline):
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/4.png)

How nice!

But the boundaries are quadrilateral. You may miss the powerline.
You have installed a cool font for powerlines, so you can use it.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/5.png)

Hurrah! Cool!


If your statusline looks like:
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/16.png)

the patched font is not installed.

There are two kinds of patched fonts:

+ The patched fonts for [vim-powerline](https://github.com/Lokaltog/vim-powerline): see https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
+ The patched fonts for [powerline](https://github.com/Lokaltog/powerline): see https://github.com/Lokaltog/powerline-fonts

Create or download a font and install it.
And add the `guifont` setting to your `.vimrc` (see `:help 'guifont'` for more detail).
If you are using the vim in a terminal, the font cannot be controlled in `.vimrc`.
Open the setting of the terminal and select the patched font.

This tutorial is based on the former, the font for vim-powerline (Inconsolata for Powerline).
If you have installed the patched font for powerline, use the following settings instead.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/19.png)

If you have installed the font for powerline and your statusline looks like
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/18.png)

remove
```vim
set ambiwidth=double
```
from your `.vimrc`. If you want to keep this setting, use the patched font for vim-powerline.
+ https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher


If you will not install a patched font, use ascii characters like:
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/17.png)



Almost all of things go well with the patched font but if the triangle looks weird:
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/22.png)

If you are using iTerm2, change the following settings of iTerm2:
+ set `Profiles>Colors>Minimum contrast` to the Lowest.
+ set `Profiles>Window>Transparency` to the Opaquest.

For other terminals, this weird-triangle problem will be resolved by disabling transparency or contrast adjustment.



Now, let us get back to the tutorial (with the patched font for vim-powerline).
You look into a help file to find the marks annoying.
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/6.png)

Help files are read-only and no-modifiable? We know that!
OK, so you again edit the components.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/7.png)

Huh? Weird!
The components do not collapse even if they have no information!
In order to avoid this situation, you set expressions to `g:lightline.component_visible_condition`, which should become 1 only when the corresponding components have information.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/8.png)

Okay. It works nice.



How does lightline decide the components to show in the statusline?
It's very simple.
The variables to select components are `g:lightline.active.left` and `g:lightline.active.left`.
For example, you add the `g:lightline.active.left` in `.vimrc`.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
```
If the plugin arranges all the components (in a situation you `set paste` and the file `.vimrc` is read-only, try to modify):
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/9.png)

The mode component, the paste component, read-only component, filename component and modified component in a row.
Normally, the paste component does not show up.
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/10.png)

If the file is not read-only (more common cases), the read-only component does not show up.
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/11.png)


Again look into `g:lightline.active.left`.
```vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ] ...
```
And the screen shot of all the components.
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/9.png)

The mode and paste component are displayed in the same group.
The read-only, filename and modified component are in the second group.
It corresponds to the structure of `g:lightline.active.left`.
You can configure the components in the statusline by the following four variables:
+ `g:lightline.active.left`
+ `g:lightline.active.right`
+ `g:lightline.inactive.left`
+ `g:lightline.inactive.right`

Of course, your settings in `.vimrc` have priority over the default settings in lightline.



GitHub branch is important for us.
And it is a default component in [powerline](https://github.com/Lokaltog/powerline) and [vim-powerline](https://github.com/Lokaltog/vim-powerline).
However, lightline does not provide the branch feature by default.

In order to show the branch in the statusline, you firstly install the [vim-fugitive](https://github.com/tpope/vim-fugitive) plugin.
Then edit the `g:lightline` in your `.vimrc`.
+ Add your fugitive component to `g:lightline.component`.
+ Add the condition when the fugitive component has information to `g:lightline.component_visible_condition`.
+ Add the component by inserting `'fugitive'` to `g:lightline.active.left`.

```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/12.png)

Okay, the branch component is added!



Now, you might get tired of setting both `'component'` and `'component_visible_condition'`.
Or if you want to do something more complicated?


In fact, the components can be created using functions.
Add your function names for components to `g:lightline.component_function`.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
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

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/13.png)

Fine and readable! 


Finally, you come up with concatenating the three components: the read-only mark, the filename and the modified mark.
Now you may know what to do.
```vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
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

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%t') ? expand('%t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/14.png)

Oops! We forgot the cool mark for the branch component! (work with the patched font for vim-powerline)
```vim
function! MyFugitive()
  return exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction
```
![lightline.vim - tutorial](https://raw.github.com/wiki/itchyny/lightline.vim/image/tutorial/15.png)

How cool!!!

Of course, you can name your component as you wish.
```vim
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'my_component' ] ] },
    \ 'component_function': {
    \   'my_component': 'MyComponent', ...
```

This is the end of the tutorial. For more information, see `:help lightline`. Good luck with your nice statuslines.

### My settings
I show my settings. I use the patched font for vim-powerline.
```vim
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') : 
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
```
When the current window width is narrow, the mode component and the file information component collapse.
For example, the [gundo](https://github.com/sjl/gundo.vim) buffer is narrow.

Before:
![lightline.vim - gundo](https://raw.github.com/wiki/itchyny/lightline.vim/image/gundo0.png)

After:
![lightline.vim - gundo](https://raw.github.com/wiki/itchyny/lightline.vim/image/gundo1.png)

Nice looking, isn't it?

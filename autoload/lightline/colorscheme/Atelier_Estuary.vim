" Filename: Atelier_Estuary.vim (https://github.com/atelierbram/vim-colors_atelier-schemes/blob/master/autoload/lightline/colorscheme/Atelier_Estuary.vim)
" Scheme: Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/estuary)
" License: MIT License

let s:cuicolors = {
      \ 'base03': [ '8', '235   ', 'DarkGray' ],
      \ 'base02': [ '0', '236   ', 'Black' ],
      \ 'base01': [ '10', '240   ', 'LightGreen' ],
      \ 'base00': [ '11', '242   ', 'LightYellow' ],
      \ 'base0':  [ '12', '245   ', 'LightBlue' ],
      \ 'base1':  [ '14', '246   ', 'LightCyan' ],
      \ 'base2': [ '7', '254   ', 'LightGray' ],
      \ 'base3': [ '15', '231   ', 'White' ],
      \ 'yellow': [ '3', '142   ', 'DarkYellow' ],
      \ 'orange': [ '9', '137   ', 'LightRed' ],
      \ 'red': [ '1', '235   ', 'DarkRed' ],
      \ 'magenta': [ '5', '132   ', 'DarkMagenta' ],
      \ 'violet': [ '13', '66    ', 'LightMagenta' ],
      \ 'blue': [ '4', '36    ', 'DarkBlue' ],
      \ 'cyan': [ '6', '71    ', 'DarkCyan' ],
      \ 'green': [ '2', '100   ', 'DarkGreen' ],
      \ }

" The following condition only applies for the console and is the same
" condition vim-colors-Atelier_Estuary uses to determine which set of colors
" to use.
let s:Atelier_Estuary_termcolors = get(g:, 'Atelier_Estuary_termcolors', 256)
if s:Atelier_Estuary_termcolors != 256 && &t_Co >= 16
  let s:cuiindex = 0
elseif s:Atelier_Estuary_termcolors == 256
  let s:cuiindex = 1
else
  let s:cuiindex = 2
endif

let s:base03 = [ '#22221b', s:cuicolors.base03[s:cuiindex] ]
let s:base02 = [ '#302f27', s:cuicolors.base02[s:cuiindex] ]
let s:base01 = [ '#5f5e4e', s:cuicolors.base01[s:cuiindex] ]
let s:base00 = [ '#6c6b5a', s:cuicolors.base00[s:cuiindex] ]
let s:base0 = [ '#878573', s:cuicolors.base0[s:cuiindex] ]
let s:base1 = [ '#929181', s:cuicolors.base1[s:cuiindex] ]
let s:base2 = [ '#e7e6df', s:cuicolors.base2[s:cuiindex] ]
let s:base3 = [ '#f4f3ec', s:cuicolors.base3[s:cuiindex] ]
let s:yellow = [ '#a5980d', s:cuicolors.yellow[s:cuiindex] ]
let s:orange = [ '#ae7313', s:cuicolors.orange[s:cuiindex] ]
let s:red = [ '#ba6236', s:cuicolors.red[s:cuiindex] ]
let s:magenta = [ '#9d6c7c', s:cuicolors.magenta[s:cuiindex] ]
let s:violet = [ '#5f9182', s:cuicolors.violet[s:cuiindex] ]
let s:blue = [ '#36a166', s:cuicolors.blue[s:cuiindex] ]
let s:cyan = [ '#5b9d48', s:cuicolors.cyan[s:cuiindex] ]
let s:green = [ '#7d9726', s:cuicolors.green[s:cuiindex] ]

if lightline#colorscheme#background() ==# 'light'
  let [ s:base03, s:base3 ] = [ s:base3, s:base03 ]
  let [ s:base02, s:base2 ] = [ s:base2, s:base02 ]
  let [ s:base01, s:base1 ] = [ s:base1, s:base01 ]
  let [ s:base00, s:base0 ] = [ s:base0, s:base00 ]
endif

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base03, s:blue ], [ s:base03, s:base00 ] ]
let s:p.normal.right = [ [ s:base03, s:base1 ], [ s:base03, s:base00 ] ]
let s:p.inactive.right = [ [ s:base03, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base0, s:base02 ] ]
let s:p.insert.left = [ [ s:base03, s:green ], [ s:base03, s:base00 ] ]
let s:p.replace.left = [ [ s:base03, s:red ], [ s:base03, s:base00 ] ]
let s:p.visual.left = [ [ s:base03, s:magenta ], [ s:base03, s:base00 ] ]
let s:p.normal.middle = [ [ s:base1, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base02 ] ]
let s:p.tabline.left = [ [ s:base03, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base03, s:base1 ] ]
let s:p.tabline.middle = [ [ s:base0, s:base02 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base03, s:yellow ] ]

let g:lightline#colorscheme#Atelier_Estuary#palette = lightline#colorscheme#flatten(s:p)


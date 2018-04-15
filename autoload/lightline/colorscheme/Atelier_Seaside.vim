" Filename: Atelier_Seaside.vim (https://github.com/atelierbram/vim-colors_atelier-schemes/blob/master/autoload/lightline/colorscheme/Atelier_Seaside.vim)
" Scheme: Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/seaside/)
" License: MIT License

let s:cuicolors = {
      \ 'base03': [ '8', '233   ', 'DarkGray' ],
      \ 'base02': [ '0', '235   ', 'Black' ],
      \ 'base01': [ '10', '242   ', 'LightGreen' ],
      \ 'base00': [ '11', '244   ', 'LightYellow' ],
      \ 'base0':  [ '12', '246   ', 'LightBlue' ],
      \ 'base1':  [ '14', '249   ', 'LightCyan' ],
      \ 'base2': [ '7', '254   ', 'LightGray' ],
      \ 'base3': [ '15', '231   ', 'White' ],
      \ 'yellow': [ '3', '136   ', 'DarkYellow' ],
      \ 'orange': [ '9', '94    ', 'LightRed' ],
      \ 'red': [ '1', '233   ', 'DarkRed' ],
      \ 'magenta': [ '5', '129   ', 'DarkMagenta' ],
      \ 'violet': [ '13', '67    ', 'LightMagenta' ],
      \ 'blue': [ '4', '69    ', 'DarkBlue' ],
      \ 'cyan': [ '6', '31    ', 'DarkCyan' ],
      \ 'green': [ '2', '34    ', 'DarkGreen' ],
      \ }

" The following condition only applies for the console and is the same
" condition vim-colors-Atelier_Seaside uses to determine which set of colors
" to use.
let s:Atelier_Seaside_termcolors = get(g:, 'Atelier_Seaside_termcolors', 256)
if s:Atelier_Seaside_termcolors != 256 && &t_Co >= 16
  let s:cuiindex = 0
elseif s:Atelier_Seaside_termcolors == 256
  let s:cuiindex = 1
else
  let s:cuiindex = 2
endif

let s:base03 = [ '#131513', s:cuicolors.base03[s:cuiindex] ]
let s:base02 = [ '#242924', s:cuicolors.base02[s:cuiindex] ]
let s:base01 = [ '#5e6e5e', s:cuicolors.base01[s:cuiindex] ]
let s:base00 = [ '#687d68', s:cuicolors.base00[s:cuiindex] ]
let s:base0 = [ '#809980', s:cuicolors.base0[s:cuiindex] ]
let s:base1 = [ '#8ca68c', s:cuicolors.base1[s:cuiindex] ]
let s:base2 = [ '#cfe8cf', s:cuicolors.base2[s:cuiindex] ]
let s:base3 = [ '#f4fbf4', s:cuicolors.base3[s:cuiindex] ]
let s:yellow = [ '#98981b', s:cuicolors.yellow[s:cuiindex] ]
let s:orange = [ '#87711d', s:cuicolors.orange[s:cuiindex] ]
let s:red = [ '#e6193c', s:cuicolors.red[s:cuiindex] ]
let s:magenta = [ '#e619c3', s:cuicolors.magenta[s:cuiindex] ]
let s:violet = [ '#ad2bee', s:cuicolors.violet[s:cuiindex] ]
let s:blue = [ '#3d62f5', s:cuicolors.blue[s:cuiindex] ]
let s:cyan = [ '#1999b3', s:cuicolors.cyan[s:cuiindex] ]
let s:green = [ '#29a329', s:cuicolors.green[s:cuiindex] ]

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

let g:lightline#colorscheme#Atelier_Seaside#palette = lightline#colorscheme#flatten(s:p)


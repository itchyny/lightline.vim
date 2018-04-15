" Filename: Atelier_Cave.vim (https://github.com/atelierbram/vim-colors_atelier-schemes/blob/master/autoload/lightline/colorscheme/Atelier_Cave.vim)
" Scheme: Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/cave)
" License: MIT License

let s:cuicolors = {
      \ 'base03': [ '8', '234   ', 'DarkGray' ],
      \ 'base02': [ '0', '235   ', 'Black' ],
      \ 'base01': [ '10', '240   ', 'LightGreen' ],
      \ 'base00': [ '11', '241   ', 'LightYellow' ],
      \ 'base0':  [ '12', '243   ', 'LightBlue' ],
      \ 'base1':  [ '14', '245   ', 'LightCyan' ],
      \ 'base2': [ '7', '254   ', 'LightGray' ],
      \ 'base3': [ '15', '231   ', 'White' ],
      \ 'yellow': [ '3', '130   ', 'DarkYellow' ],
      \ 'orange': [ '9', '131   ', 'LightRed' ],
      \ 'red': [ '1', '234   ', 'DarkRed' ],
      \ 'magenta': [ '5', '164   ', 'DarkMagenta' ],
      \ 'violet': [ '13', '99    ', 'LightMagenta' ],
      \ 'blue': [ '4', '63    ', 'DarkBlue' ],
      \ 'cyan': [ '6', '67    ', 'DarkCyan' ],
      \ 'green': [ '2', '30    ', 'DarkGreen' ],
      \ }

" The following condition only applies for the console and is the same
" condition vim-colors-Atelier_Cave uses to determine which set of colors
" to use.
let s:Atelier_Cave_termcolors = get(g:, 'Atelier_Cave_termcolors', 256)
if s:Atelier_Cave_termcolors != 256 && &t_Co >= 16
  let s:cuiindex = 0
elseif s:Atelier_Cave_termcolors == 256
  let s:cuiindex = 1
else
  let s:cuiindex = 2
endif

let s:base03 = [ '#19171c', s:cuicolors.base03[s:cuiindex] ]
let s:base02 = [ '#26232a', s:cuicolors.base02[s:cuiindex] ]
let s:base01 = [ '#585260', s:cuicolors.base01[s:cuiindex] ]
let s:base00 = [ '#655f6d', s:cuicolors.base00[s:cuiindex] ]
let s:base0 = [ '#7e7887', s:cuicolors.base0[s:cuiindex] ]
let s:base1 = [ '#8b8792', s:cuicolors.base1[s:cuiindex] ]
let s:base2 = [ '#e2dfe7', s:cuicolors.base2[s:cuiindex] ]
let s:base3 = [ '#efecf4', s:cuicolors.base3[s:cuiindex] ]
let s:yellow = [ '#a06e3b', s:cuicolors.yellow[s:cuiindex] ]
let s:orange = [ '#aa573c', s:cuicolors.orange[s:cuiindex] ]
let s:red = [ '#be4678', s:cuicolors.red[s:cuiindex] ]
let s:magenta = [ '#bf40bf', s:cuicolors.magenta[s:cuiindex] ]
let s:violet = [ '#955ae7', s:cuicolors.violet[s:cuiindex] ]
let s:blue = [ '#576ddb', s:cuicolors.blue[s:cuiindex] ]
let s:cyan = [ '#398bc6', s:cuicolors.cyan[s:cuiindex] ]
let s:green = [ '#2a9292', s:cuicolors.green[s:cuiindex] ]

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

let g:lightline#colorscheme#Atelier_Cave#palette = lightline#colorscheme#flatten(s:p)


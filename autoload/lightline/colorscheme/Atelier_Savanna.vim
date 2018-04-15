" Filename: Atelier_Savanna.vim (https://github.com/atelierbram/vim-colors_atelier-schemes/blob/master/autoload/lightline/colorscheme/Atelier_Savanna.vim)
" Scheme: Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/savanna)
" License: MIT License

let s:cuicolors = {
      \ 'base03': [ '8', '234   ', 'DarkGray' ],
      \ 'base02': [ '0', '235   ', 'Black' ],
      \ 'base01': [ '10', '240   ', 'LightGreen' ],
      \ 'base00': [ '11', '242   ', 'LightYellow' ],
      \ 'base0':  [ '12', '245   ', 'LightBlue' ],
      \ 'base1':  [ '14', '246   ', 'LightCyan' ],
      \ 'base2': [ '7', '254   ', 'LightGray' ],
      \ 'base3': [ '15', '231   ', 'White' ],
      \ 'yellow': [ '3', '136   ', 'DarkYellow' ],
      \ 'orange': [ '9', '130   ', 'LightRed' ],
      \ 'red': [ '1', '234   ', 'DarkRed' ],
      \ 'magenta': [ '5', '95    ', 'DarkMagenta' ],
      \ 'violet': [ '13', '67    ', 'LightMagenta' ],
      \ 'blue': [ '4', '66    ', 'DarkBlue' ],
      \ 'cyan': [ '6', '30    ', 'DarkCyan' ],
      \ 'green': [ '2', '65    ', 'DarkGreen' ],
      \ }

" The following condition only applies for the console and is the same
" condition vim-colors-Atelier_Savanna uses to determine which set of colors
" to use.
let s:Atelier_Savanna_termcolors = get(g:, 'Atelier_Savanna_termcolors', 256)
if s:Atelier_Savanna_termcolors != 256 && &t_Co >= 16
  let s:cuiindex = 0
elseif s:Atelier_Savanna_termcolors == 256
  let s:cuiindex = 1
else
  let s:cuiindex = 2
endif

let s:base03 = [ '#171c19', s:cuicolors.base03[s:cuiindex] ]
let s:base02 = [ '#232a25', s:cuicolors.base02[s:cuiindex] ]
let s:base01 = [ '#526057', s:cuicolors.base01[s:cuiindex] ]
let s:base00 = [ '#5f6d64', s:cuicolors.base00[s:cuiindex] ]
let s:base0 = [ '#78877d', s:cuicolors.base0[s:cuiindex] ]
let s:base1 = [ '#87928a', s:cuicolors.base1[s:cuiindex] ]
let s:base2 = [ '#dfe7e2', s:cuicolors.base2[s:cuiindex] ]
let s:base3 = [ '#ecf4ee', s:cuicolors.base3[s:cuiindex] ]
let s:yellow = [ '#a07e3b', s:cuicolors.yellow[s:cuiindex] ]
let s:orange = [ '#9f713c', s:cuicolors.orange[s:cuiindex] ]
let s:red = [ '#b16139', s:cuicolors.red[s:cuiindex] ]
let s:magenta = [ '#867469', s:cuicolors.magenta[s:cuiindex] ]
let s:violet = [ '#55859b', s:cuicolors.violet[s:cuiindex] ]
let s:blue = [ '#478c90', s:cuicolors.blue[s:cuiindex] ]
let s:cyan = [ '#1c9aa0', s:cuicolors.cyan[s:cuiindex] ]
let s:green = [ '#489963', s:cuicolors.green[s:cuiindex] ]

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

let g:lightline#colorscheme#Atelier_Savanna#palette = lightline#colorscheme#flatten(s:p)


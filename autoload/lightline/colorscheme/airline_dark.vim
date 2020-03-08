" =============================================================================
" Filename: autoload/lightline/colorscheme/airline_dark.vim
" Author: fx-carton
" Adapted From: autoload/airline/{themes/dark.vim,themes.vim}
" License: MIT License
" Last Change: 2020/03/07 19:56:46.
" =============================================================================

let s:p = {"normal": {}, "inactive": {}, "insert": {}, "replace": {}, "visual": {}, "tabline": {}}
let s:p.normal.left = [["#00005f", "#dfff00", 17, 190, "bold"], ["#ffffff", "#444444", 255, 238]]
let s:p.normal.middle = [["#9cffd3", "#202020", 85, 234]]
let s:p.normal.right = [s:p.normal.left[1], s:p.normal.left[0][0:3], s:p.normal.left[1]]
let s:p.insert.left = [["#00005f", "#00dfff", 17, 45, "bold"], ["#ffffff", "#005fff", 255, 27]]
let s:p.insert.middle = [["#ffffff", "#000080", 15, 17]]
let s:p.insert.right = [s:p.insert.left[1], s:p.insert.left[0][0:3], s:p.insert.left[1]]
let s:p.replace.left = [["#ffffff", "#af0000", 255, 124, "bold"], ["#ffffff", "#005fff", 255, 27]]
let s:p.replace.middle = s:p.insert.middle
let s:p.replace.right = s:p.insert.right
let s:p.visual.left = [["#000000", "#ffaf00", 232, 214, "bold"], ["#000000", "#ff5f00", 232, 202]]
let s:p.visual.middle = [["#ffffff", "#5f0000", 15, 52]]
let s:p.visual.right = [s:p.visual.left[1], s:p.visual.left[0][0:3], s:p.visual.left[1]]
let s:p.inactive.left = [["#4e4e4e", "#1c1c1c", 239, 234], ["#4e4e4e", "#262626", 239, 235]]
let s:p.inactive.middle = [["#4e4e4e", "#303030", 239, 236]]
let s:p.inactive.right = [s:p.inactive.left[1], s:p.inactive.left[0][0:3], s:p.inactive.left[1]]
let s:p.tabline.left = [s:p.normal.left[1]]
let s:p.tabline.tabsel = [s:p.normal.left[0]]
let s:p.tabline.middle = [s:p.normal.middle[0]]
let s:p.tabline.right = [s:p.normal.right[0]]
let s:p.normal.error = [["#000000", "#990000", 232, 160]]
let s:p.normal.warning = [["#000000", "#df5f00", 232, 166]]

let g:lightline#colorscheme#airline_dark#palette = lightline#colorscheme#fill(s:p)

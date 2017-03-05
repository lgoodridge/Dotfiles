" Xuphoria
" Dark, faded, RBP color scheme
" Author: Lance Goodridge
" Inspired by xoria256 Theme

let g:colors_name="xuphoria"

" Define GUI Theme Colors
let main_bg = "#101010"
let sel_bg  = "#505050"
let spec_bg = "#505050"

let t_white = "#E2E2E2"
let t_grey  = "#A0A0A0"
let t_dgrey = "#929292"
let t_beige = "#D8D8D8"

let t_red   = "#DF8787"
let t_blue  = "#87AFDF"
let t_green = "#CAE682"

let t_oran  = "#EAB882"
let t_cyan  = "#53DCCD"
let t_purp  = "#AFAFDF"

" Define Console Theme Colors
let cmain_bg = "NONE"
let csel_bg  = "8"
let cspec_bg = "8"

let ct_white = "7"
let ct_grey  = "8"
let ct_dgrey = "8"
let ct_beige = "194"

let ct_red   = "174"
let ct_blue  = "110"
let ct_green = "28"

let ct_oran  = "130"
let ct_cyan  = "6"
let ct_purp  = "146"


" main groups
exe "hi Normal   ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_beige . " guibg=" . main_bg
exe "hi NonText  ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi LineNr   ctermfg=" . ct_grey  . " ctermbg=" . cmain_bg . " guifg=" . t_grey  . " guibg=" . main_bg

" highlight groups
exe "hi Cursor          ctermfg=" . ct_white . " ctermbg=" . csel_bg  . " guifg=" . t_white . " guibg=" . sel_bg
exe "hi Visual          ctermfg=" . ct_white . " ctermbg=" . csel_bg  . " guifg=" . t_white . " guibg=" . sel_bg
exe "hi Folded	        ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi FoldColumn	    ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi IncSearch	    ctermfg=" . ct_white . " ctermbg=" . cspec_bg . " guifg=" . t_white . " guibg=" . spec_bg
exe "hi MatchParen      ctermfg=" . ct_white . " ctermbg=" . cspec_bg . " guifg=" . t_white . " guibg=" . spec_bg
exe "hi Question	    ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi Search	        ctermfg=" . ct_white . " ctermbg=" . cspec_bg . " guifg=" . t_white . " guibg=" . spec_bg
exe "hi SpecialKey	    ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi StatusLine	    ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi StatusLineNC    ctermfg=" . ct_white . " ctermbg=" . cmain_bg . " guifg=" . t_white . " guibg=" . main_bg
exe "hi Title	        ctermfg=" . ct_purp  . " ctermbg=" . cmain_bg . " guifg=" . t_purp  . " guibg=" . main_bg
exe "hi VertSplit	    ctermfg=" . cmain_bg . " ctermbg=" . ct_grey  . " guifg=" . main_bg . " guibg=" . t_grey

" message groups
exe "hi ModeMsg	        ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi MoreMsg	        ctermfg=" . ct_white . " guifg=" . t_white
exe "hi WarningMsg	    ctermfg=" . ct_red   . " guifg=" . t_red


" syntax highlighting groups
" first line of each paragraph is the general group
" subsequent lines are more specific (higher precedence)
exe "hi Comment	        ctermfg=" . ct_dgrey . " guifg=" . t_dgrey

exe "hi Constant	    ctermfg=" . ct_cyan  . " guifg=" . t_cyan
exe "hi String          ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi Character       ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Number          ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi Float	        ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi Boolean         ctermfg=" . ct_purp  . " guifg=" . t_purp

exe "hi Identifier	    ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi Function	    ctermfg=" . ct_blue  . " guifg=" . t_blue

exe "hi Statement       ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Conditional     ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Repeat          ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Label           ctermfg=" . ct_white . " guifg=" . t_white
exe "hi Operator        ctermfg=" . ct_blue  . " guifg=" . t_beige
exe "hi Keyword         ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Exception       ctermfg=" . ct_red   . " guifg=" . t_red

exe "hi PreProc	        ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi Include	        ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi Define          ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi Macro           ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi PreCondit       ctermfg=" . ct_red   . " guifg=" . t_red

exe "hi Type            ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi StorageClass    ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi Structure       ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi Typedef         ctermfg=" . ct_purp  . " guifg=" . t_purp

exe "hi Special	        ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi SpecialChar	    ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi SpecialComment	ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Delimiter	    ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Tag             ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi Debug           ctermfg=" . ct_red   . " guifg=" . t_red

" special syntax highlighting groups
exe "hi Todo	        ctermfg=" . ct_purp  . " ctermbg=" . cmain_bg . " guifg=" . t_purp . " guibg=" . main_bg
exe "hi Ignore      	ctermfg=" . ct_blue  . " ctermbg=" . cmain_bg . " guifg=" . t_blue . " guibg=" . main_bg
exe "hi Error           ctermfg=" . ct_red   . " ctermbg=" . cmain_bg . " guifg=" . t_red  . " guibg=" . main_bg
exe "hi Underlined      ctermfg=" . ct_cyan . " ctermbg=" . cmain_bg . " guifg=" . t_cyan . " guibg=" . main_bg

" language specific syntax highlighting groups
exe "hi htmlTag          ctermfg=" . ct_beige . " guifg=" . t_beige
exe "hi htmlEndTag       ctermfg=" . ct_beige . " guifg=" . t_beige
exe "hi htmlTagName      ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi htmlArg          ctermfg=" . ct_red   . " guifg=" . t_red
exe "hi htmlSpecialChar  ctermfg=" . ct_red   . " guifg=" . t_red

exe "hi javaScriptFunction   ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi javaScriptBraces     ctermfg=" . ct_beige . " guifg=" . t_beige

exe "hi cssURL           ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi cssFunctionName  ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi cssColor         ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi cssClassName     ctermfg=" . ct_purp  . " guifg=" . t_purp
exe "hi cssValueLength   ctermfg=" . ct_blue  . " guifg=" . t_blue
exe "hi cssCommonAttr    ctermfg=" . ct_blue  . " guifg=" . t_blue

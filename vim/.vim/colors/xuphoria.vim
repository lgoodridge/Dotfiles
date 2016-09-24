" Xuphoria
" Dark, faded, RBP color scheme
" Author: Lance Goodridge
" Inspired by xoria256 Theme

let g:colors_name="xuphoria"

" Define Theme Colors
let main_bg = "#101010"
let sel_bg  = "#505050"
let spec_bg = "#505050"

let t_white = "#E2E2E2"
let t_grey  = "#A0A0A0"
let t_dgrey = "#929292"
let t_beige = "#D0D0D0"

let t_red   = "#DF8787"
let t_blue  = "#87AFDF"
let t_green = "#CAE682"

let t_oran  = "#EAB882"
let t_cyan  = "#53DCCD"
let t_purp  = "#AFAFDF"


" main groups
exe "hi Normal   guifg=" . t_beige . " guibg=" . main_bg
exe "hi NonText  guifg=" . t_white . " guibg=" . main_bg
exe "hi LineNr   guifg=" . t_grey  . " guibg=" . main_bg

" highlight groups
exe "hi Cursor          guifg=" . t_white . " guibg=" . sel_bg
exe "hi Visual          guifg=" . t_white . " guibg=" . sel_bg
exe "hi Folded	        guifg=" . t_white . " guibg=" . main_bg
exe "hi FoldColumn	    guifg=" . t_white . " guibg=" . main_bg
exe "hi IncSearch	    guifg=" . t_white . " guibg=" . spec_bg
exe "hi MatchParen      guifg=" . t_white . " guibg=" . spec_bg
exe "hi Question	    guifg=" . t_white . " guibg=" . main_bg
exe "hi Search	        guifg=" . t_white . " guibg=" . spec_bg
exe "hi SpecialKey	    guifg=" . t_white . " guibg=" . main_bg
exe "hi StatusLine	    guifg=" . t_white . " guibg=" . main_bg
exe "hi StatusLineNC    guifg=" . t_white . " guibg=" . main_bg
exe "hi Title	        guifg=" . t_purp  . " guibg=" . main_bg
exe "hi VertSplit	    guifg=" . main_bg . " guibg=" . t_grey

" message groups
exe "hi ModeMsg	    guifg=" . t_blue
exe "hi MoreMsg	    guifg=" . t_white
exe "hi WarningMsg	guifg=" . t_red


" syntax highlighting groups
" first line of each paragraph is the general group
" subsequent lines are more specific (higher precedence)
exe "hi Comment	        guifg=" . t_dgrey

exe "hi Constant	    guifg=" . t_cyan
exe "hi String          guifg=" . t_purp
exe "hi Character       guifg=" . t_red
exe "hi Number          guifg=" . t_purp
exe "hi Float	        guifg=" . t_purp
exe "hi Boolean         guifg=" . t_purp

exe "hi Identifier	    guifg=" . t_purp
exe "hi Function	    guifg=" . t_blue

exe "hi Statement       guifg=" . t_red
exe "hi Conditional     guifg=" . t_red
exe "hi Repeat          guifg=" . t_red
exe "hi Label           guifg=" . t_white
exe "hi Operator        guifg=" . t_beige
exe "hi Keyword         guifg=" . t_red
exe "hi Exception       guifg=" . t_red

exe "hi PreProc	        guifg=" . t_blue
exe "hi Include	        guifg=" . t_blue
exe "hi Define          guifg=" . t_blue
exe "hi Macro           guifg=" . t_blue
exe "hi PreCondit       guifg=" . t_red

exe "hi Type            guifg=" . t_blue
exe "hi StorageClass    guifg=" . t_purp
exe "hi Structure       guifg=" . t_blue
exe "hi Typedef         guifg=" . t_purp

exe "hi Special	        guifg=" . t_red
exe "hi SpecialChar	    guifg=" . t_red
exe "hi SpecialComment	guifg=" . t_red
exe "hi Delimiter	    guifg=" . t_red
exe "hi Tag             guifg=" . t_red
exe "hi Debug           guifg=" . t_red

" special syntax highlighting groups
exe "hi Todo	        guifg=" . t_purp . " guibg=" . main_bg
exe "hi Ignore      	guifg=" . t_blue . " guibg=" . main_bg
exe "hi Error           guifg=" . t_red  . " guibg=" . main_bg
exe "hi Underlined      guifg=" . t_cyan . " guibg=" . main_bg

" language specific syntax highlighting groups
exe "hi htmlTag          guifg=" . t_beige
exe "hi htmlEndTag       guifg=" . t_beige
exe "hi htmlTagName      guifg=" . t_blue
exe "hi htmlArg          guifg=" . t_red
exe "hi htmlSpecialChar  guifg=" . t_red

exe "hi javaScriptFunction   guifg=" . t_blue
exe "hi javaScriptBraces     guifg=" . t_beige

exe "hi cssURL           guifg=" . t_purp
exe "hi cssFunctionName  guifg=" . t_blue
exe "hi cssColor         guifg=" . t_blue
exe "hi cssClassName     guifg=" . t_purp
exe "hi cssValueLength   guifg=" . t_blue
exe "hi cssCommonAttr    guifg=" . t_blue

" Aptana
" Faded mix color scheme
" Author: Lance Goodridge
" Inspired by NightLion Aptana Eclipse Theme

let g:colors_name="aptana"

" Define Theme Colors
let main_bg = "#080808"
let sel_bg  = "#505050"
let spec_bg = "#505050"

let t_white = "#E2E2E2"
let t_grey  = "#A0A0A0"
let t_beige = "#D4C4A9"

let t_red   = "#CC9393"
let t_blue  = "#8DCBE2"
let t_green = "#CAE682"

let t_oran  = "#EAB882"
let t_cyan  = "#53DCCD"
let t_purp  = "#9393CC"


" main groups
exe "hi Normal   guifg=" . t_beige . " guibg=" . main_bg
exe "hi NonText  guifg=" . t_white . " guibg=" . main_bg
exe "hi LineNr   guifg=" . t_grey  . " guibg=" . main_bg

" highlight groups
exe "hi Cursor          guifg=" . t_white . " guibg=" . sel_bg
exe "hi Visual          guifg=" . t_white . " guibg=" . sel_bg
exe "hi Folded	        guifg=" . t_white . " guibg=" . t_white
exe "hi FoldColumn	    guifg=" . t_white . " guibg=" . t_white
exe "hi IncSearch	    guifg=" . t_white . " guibg=" . spec_bg
exe "hi MatchParen      guifg=" . t_white . " guibg=" . spec_bg
exe "hi Question	    guifg=" . t_white . " guibg=" . t_white
exe "hi Search	        guifg=" . t_white . " guibg=" . spec_bg
exe "hi SpecialKey	    guifg=" . t_white . " guibg=" . t_white
exe "hi StatusLine	    guifg=" . t_white . " guibg=" . t_white
exe "hi StatusLineNC    guifg=" . t_white . " guibg=" . t_white
exe "hi Title	        guifg=" . t_red   . " guibg=" . main_bg
exe "hi VertSplit	    guifg=" . main_bg . " guibg=" . t_grey

exe "hi ModeMsg	    guifg=" . t_blue
exe "hi MoreMsg	    guifg=" . t_white
exe "hi WarningMsg	guifg=" . t_red

" syntax highlighting groups
exe "hi Boolean         guifg=" . t_purp
exe "hi Character       guifg=" . t_purp
exe "hi Comment	        guifg=" . t_grey
exe "hi Conditional     guifg=" . t_red
exe "hi Constant	    guifg=" . t_cyan
exe "hi Define          guifg=" . t_white
exe "hi Float	        guifg=" . t_oran
exe "hi Function	    guifg=" . t_blue
exe "hi Identifier	    guifg=" . t_blue
exe "hi Keyword         guifg=" . t_blue
exe "hi Label           guifg=" . t_white
exe "hi Number          guifg=" . t_purp
exe "hi Operator        guifg=" . t_oran
exe "hi PreProc	        guifg=" . t_red
exe "hi Special	        guifg=" . t_oran
exe "hi Statement       guifg=" . t_oran
exe "hi StorageClass    guifg=" . t_blue
exe "hi String          guifg=" . t_red
exe "hi Tag             guifg=" . t_white
exe "hi Type            guifg=" . t_green

exe "hi Ignore	guifg=" . t_grey . " guibg=" . main_bg
exe "hi Todo	guifg=" . t_purp . " guibg=" . main_bg

exe "hi htmlTag          guifg=" . t_purp
exe "hi htmlEndTag       guifg=" . t_purp
exe "hi htmlTagName      guifg=" . t_blue
exe "hi htmlArg          guifg=" . t_green
exe "hi htmlSpecialChar  guifg=" . t_oran

exe "hi javaScriptFunction   guifg=" . t_blue
exe "hi javaScriptBraces     guifg=" . t_white

exe "hi cssURL           guifg=" . t_purp
exe "hi cssFunctionName  guifg=" . t_oran
exe "hi cssColor         guifg=" . t_green
exe "hi cssClassName     guifg=" . t_purp
exe "hi cssValueLength   guifg=" . t_green
exe "hi cssCommonAttr    guifg=" . t_green

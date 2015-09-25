" Aptana
" Faded mix color scheme
" Author: Lance Goodridge
" Inspired by NightLion Aptana Eclipse Theme

let g:colors_name="aptana"

" Define Theme Colors
let main_bg = "#1E1E1E"
let t_white = "#E2E2E2"
let t_grey  = "#C0C0C0"
let t_beige = "#D4C4A9"
let t_brown = "#B3B784"
let t_blue  = "#8DCBE2"

" main groups
exe "hi Normal   guifg=" . t_white . " guibg=" . main_bg
exe "hi NonText  guifg=" . t_white . " guibg=" . main_bg
exe "hi LineNr   guifg=" . t_white . " guibg=" . main_bg

" highlight groups
exe "hi Cursor          guifg=" . t_white . " guibg=" . t_white
exe "hi Folded	        guifg=" . t_white . " guibg=" . t_white
exe "hi FoldColumn	    guifg=" . t_white . " guibg=" . t_white 
exe "hi IncSearch	    guifg=" . t_white . " guibg=" . t_white
exe "hi MatchParen      guifg=" . t_white . " guibg=" . t_white
exe "hi Question	    guifg=" . t_white . " guibg=" . t_white
exe "hi Search	        guifg=" . t_white . " guibg=" . t_white
exe "hi SpecialKey	    guifg=" . t_white . " guibg=" . t_white
exe "hi StatusLine	    guifg=" . t_white . " guibg=" . t_white
exe "hi StatusLineNC    guifg=" . t_white . " guibg=" . t_white
exe "hi Title	        guifg=" . t_white . " guibg=" . t_white
exe "hi VertSplit	    guifg=" . t_white . " guibg=" . t_white
exe "hi Visual          guifg=" . t_white . " guibg=" . t_white

exe "hi ModeMsg	    guifg=" . t_white
exe "hi MoreMsg	    guifg=" . t_white
exe "hi WarningMsg	guifg=" . t_white

" syntax highlighting groups
exe "hi Boolean         guifg=" . t_white
exe "hi Character       guifg=" . t_white
exe "hi Comment	        guifg=" . t_grey
exe "hi Conditional     guifg=" . t_white
exe "hi Constant	    guifg=" . t_white
exe "hi Define          guifg=" . t_white
exe "hi Float	        guifg=" . t_white
exe "hi Function	    guifg=" . t_white
exe "hi Identifier	    guifg=" . t_white
exe "hi Keyword         guifg=" . t_white
exe "hi Label           guifg=" . t_white
exe "hi Number          guifg=" . t_white
exe "hi Operator        guifg=" . t_white
exe "hi PreProc	        guifg=" . t_white
exe "hi Special	        guifg=" . t_white
exe "hi Statement       guifg=" . t_white
exe "hi StorageClass    guifg=" . t_white
exe "hi Tag             guifg=" . t_white
exe "hi Type            guifg=" . t_white

exe "hi Ignore	guifg=" . t_white
exe "hi Todo	guifg=" . t_white

exe "hi htmlTag          guifg=" . t_white
exe "hi htmlEndTag       guifg=" . t_white
exe "hi htmlTagName      guifg=" . t_white
exe "hi htmlArg          guifg=" . t_white
exe "hi htmlSpecialChar  guifg=" . t_white

exe "hi javaScriptFunction   guifg=" . t_white
exe "hi javaScriptBraces     guifg=" . t_white

exe "hi cssURL           guifg=" . t_white
exe "hi cssFunctionName  guifg=" . t_white
exe "hi cssColor         guifg=" . t_white
exe "hi cssClassName     guifg=" . t_white
exe "hi cssValueLength   guifg=" . t_white
exe "hi cssCommonAttr    guifg=" . t_white
exe "hi cssCommonAttr    guifg=" . t_white

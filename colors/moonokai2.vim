" Vim color file
"
" Original Author: Tomas Restrepo <tomas@winterdom.com>
" Modified by: Federico Holgado <fholgado@gmail.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai2"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif


hi Boolean         guifg=#AE81FF			gui=bold
hi Include         guifg=#e73c50 			gui=bold
hi Character       guifg=#E6DB74            gui=bold
hi Number          guifg=#ae81ff            gui=bold
hi String          guifg=#f92772            gui=bold
hi Condtional     guifg=#f92772               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F35FBC gui=bold
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF              gui=bold
hi Delimiter       guifg=#8F8F8F              gui=bold
hi DiffAdd                       guibg=#0F1D0B gui=bold
hi DiffChange      guifg=#89807D guibg=#322F2D gui=bold
hi DiffDelete      guifg=#960050 guibg=#1E0010 gui=bold
hi DiffText                      guibg=#4A4340 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#66D9EF               gui=bold
hi Float           guifg=#ae81ff
hi Folded          guifg=#465457 guibg=#000000 gui=bold
hi Function        guifg=#90E0EF gui=bold
hi Identifier      guifg=#c4cad5 gui=bold
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#f92772               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=bold
hi SpecialKey      guifg=#66D9EF               gui=bold

hi MatchParen      guifg=#E4E400 guibg=#232728 gui=bold
hi ModeMsg         guifg=#E6DB74 gui=bold
hi MoreMsg         guifg=#E6DB74 gui=bold
hi Operator        guifg=#f92772 gui=bold

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000 gui=bold
hi PmenuSel                      guibg=#808080 gui=bold
hi PmenuSbar                     guibg=#080808 gui=bold
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E			   gui=bold
hi Question        guifg=#66D9EF			   gui=bold
hi Repeat          guifg=#f92772               gui=bold
hi Search          guifg=#FFFFFF guibg=#455354 gui=bold
" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#f92772               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=bold,italic
hi SpecialKey      guifg=#888A85               gui=bold,italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#f92772               gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FD971F               gui=bold,italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=bold,italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF			   gui=bold
hi Type            guifg=#66D9EF               gui=bold
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D gui=bold
hi Visual                        guibg=#422982 gui=bold
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000 gui=bold

hi MyTagListFileName guifg=#F92672 guibg=#1B1D1E gui=bold

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

if s:molokai_original == 1
   hi Normal          guifg=#F8F8F2 guibg=#272822
   hi Comment         guifg=#75715E
   hi CursorLine                    guibg=#3E3D32
   hi CursorColumn                  guibg=#3E3D32
   hi ColorColumn                   guibg=#3E3D32
   hi LineNr          guifg=#5D5A4B guibg=#3B3A32
   hi FoldColumn      guifg=#AAAAAA guibg=#3B3A32
   hi NonText         guifg=#1B1D1E guibg=#3B3A32
else
   hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
   hi Folded          guifg=#666666 guibg=#1B1D1E
   hi Comment         guifg=#5c7176
   hi CursorLine                    guibg=#232728
   hi CursorColumn                  guibg=#232728
   hi ColorColumn                   guibg=#232728
   hi LineNr          guibg=#333333 guifg=#808080
   hi FoldColumn      guifg=#AAAAAA guibg=#1B1D1E
   
   " Invisible character colors
   highlight NonText    guifg=#282c34 guibg=#1a1c1d
   highlight SpecialKey guifg=#444444 guibg=#1a1c1d
end

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=57
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=252 ctermbg=233
   hi Comment         ctermfg=59
   hi CursorLine                  ctermbg=234   cterm=none
   hi CursorColumn                ctermbg=234
   hi LineNr          ctermfg=250 ctermbg=234
   hi NonText         ctermfg=250 ctermbg=234

   " MiniBufExpl Colors
   hi MBEVisibleActive ctermfg=75 cterm=bold
   hi MBEVisibleChangedActive ctermfg=214
   hi MBEVisibleChanged ctermfg=210
   hi MBEVisibleNormal ctermfg=48
   hi MBEChanged ctermfg=196
   hi MBENormal ctermfg=46
end

"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cFunction        gui=NONE guifg=#B5A1FF
hi cFunction        term=bold ctermfg=DarkMagenta gui=NONE guifg=#B5A1FF

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators
syn match       cPointerOperator  display "->\|\."
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
"hi cMathOperator            guifg=#3EFFE2
"hi cPointerOperator         guifg=#3EFFE2
"hi cLogicalOperator         guifg=#3EFFE2
"hi cBinaryOperator          guifg=#3EFFE2
"hi cBinaryOperatorError     guifg=#3EFFE2
"hi cLogicalOperator         guifg=#3EFFE2
"hi cLogicalOperatorError    guifg=#3EFFE2

hi def link cMathOperator    Identifier
hi def link cPointerOperator Identifier
hi def link cLogicalOperator Identifier
hi def link cBinaryOperator          Identifier
hi def link cBinaryOperatorError     Identifier
hi def link cLogicalOperator         Identifier
hi def link cLogicalOperatorError    Identifier

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight OverLength ctermbg=red ctermfg=darkred guibg=#FFD9D9
match OverLength /\%81v.\+/


"========================================================
" My Own DataType
"========================================================
"syn keyword cType       My_Type_1 My_Type_2 My_Type_3

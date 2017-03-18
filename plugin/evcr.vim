" Copyright (c) 2014, Evertz Microsystem, All rights reserved.

" Auto fill the copyright info at the head of cpp /h files.

"

if exists("loaded_evertzcopyrights")
	finish
endif
if (v:progname == "ex")
	finish
endif

if (!exists('g:ecAuthor'))
	let g:ecAuthor = 'Ethan Da'
endif

if (!exists('g:ecAutoFill'))
	let g:ecAutoFill = 0
endif

if !exists(':Evcr')
	command -nargs=0 Evcr :silent call <SID>EcFillCopyrights()
endif

if g:ecAutoFill
augroup EvertzCopyRights
	autocmd BufEnter *.cpp,*.h,*.c,*.cc :call <SID>EcFillCopyrights()
augroup END
endif

function! <SID>EcFillCopyrights()
	"Check the 2nd Line contains \" * Copyright YYYY Evertz Microsystem\"
	if getline(1) !~ "^\/\\* Copyright (c) \\d\\{4\\}"
		let s:EvertzCopyright  = "/* Copyright (c) 2014-". strftime("%Y") ." Evertz Microsystems Ltd. All rights reserved */\r"
"	if getline(2) !~ "^ \\* Copyright (c) \\d\\{4\\}"
"		let s:EvertzCopyright  = "/*******************************************************************************\r"
"		let s:EvertzCopyright .= " * Copyright (c) ". strftime("%Y") ." Evertz Microsystems Ltd. All rights reserved\r"
"		let s:EvertzCopyright .= " ******************************************************************************/\r"
"		let s:EvertzCopyright .= "/*\r"
"		let s:EvertzCopyright .= " *  Brief             : FPGA device reader / writer\r"
"		let s:EvertzCopyright .= " *\r"
"		let s:EvertzCopyright .= " *  File Name         : ". expand("%:t") ."\r"
"		let s:EvertzCopyright .= " *\r"
"		let s:EvertzCopyright .= " *  Description       : This is the MADI9-TS FPGA reader/writer\r"
"		let s:EvertzCopyright .= " *                            You may use it as a sample to implement \r"
"		let s:EvertzCopyright .= " *                            your FPGA read/write\r"
"		let s:EvertzCopyright .= " *\r"
"		let s:EvertzCopyright .= " *  Revision History  :\r"
"		let s:EvertzCopyright .= " *      DD-MM-YYYY      Author(s)            Changes (Describe the changes made)\r"
"		let s:EvertzCopyright .= " *      ". strftime("%m-%d-%Y", getftime(expand("%"))) ."      ". g:ecAuthor ."             -Created \r"
"		let s:EvertzCopyright .= " *\r"
"		let s:EvertzCopyright .= " ******************************************************************************/\r"

		se nocindent
		execute "normal ggO" . s:EvertzCopyright
		execute "normal <C-o><C-o>"
		se cindent
	endif
endfunction

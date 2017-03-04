" my .vimrc

" Generic settings.
set nocp
set nobackup
set noswapfile
set nowrap
set ss=1
"set wrap
"set textwidth=80
set mouse=a
set sts=0
set ts=4
set sw=4
set noet
set noml
set fp=astyle
set hlsearch
set list
set listchars=tab:>-,trail:-
"set vi='0,<50,s10,h
"nmap <SPACE> <C-D>
set cscopetag
set csto=1
set foldmethod=indent
set fdls=99
"set spell

filetype plugin indent on


" VHDL
let g:vhdl_indent_genportmap=0
au FileType vhdl set fdm=expr | set fde=VHDLFoldLevel()
function VHDLFoldLevel()
	let ind  = indent(v:lnum)
	let curs = getline(v:lnum)
	if curs =~ '^\s*--'
		let ind = ind + 2
	elseif curs =~ '^\s*$'
		if 0 != indent(prevnonblank(v:lnum-1))
			let ind = indent(prevnonblank(v:lnum-1))
		endif
	else
		let ind = ind + 1
	endif
	return ind
endfunction


" diff Fold
au FileType diff set fdm=expr | set fde=DiffFoldLevel()
function DiffFoldLevel()
	let curs = getline(v:lnum)
	if curs =~ '^diff --git'
		" return 0 for never folding.
		return 0
		" return 1
	endif
		return 1
endfunction


" VIM as IDE
"Taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout="TagList,FileExplorer|BufExplorer"
let g:winManagerWindowLayout="TagList|FileExplorer,BufExplorer"
let g:winManagerWidth=25
let g:persistentBehaviour=0
"nmap w1 :FirstExplorerWindow<cr>
"nmap w2 :BottomExplorerWindow<cr>
nmap <F6> :WMToggle<CR>
nmap <C-j>  <C-W>j
nmap <C-k>  <C-W>k
nmap <C-h>  <C-W>h
nmap <C-l>  <C-W>l


" Generic mappings.
nmap <F3> :vimgrep  /\<<C-R>=expand("<cword>")<CR>\>/ %<CR>:cl<CR>
nmap <Space> <C-F>
nnoremap gp `[v`]


" Evertz Copyright
"let g:ecAutoFill=1  "default is 0
"let g:ecAuthor="Jayesh Joseph"   "default is Ethan Da

" Don't know what patch it is.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Diff mode extr settings.
if &diff
	set diffopt+=iwhite
	set nolist
	"set bg=dark
	color desert
	syntax off
	"highlight! link DiffText MatchParen
	nmap <F4> :qa<CR>
else
	au VimEnter * if getfsize(expand("%")) < 1*1024*1024 | exe "WMToggle" | endif
endif


" My compiling settings
if filereadable(".proj.vim")
	so .proj.vim
elseif filereadable($HOME.'/.bin/.proj.vim')
	so $HOME/.bin/.proj.vim
endif
" MM - my hijacked make cmd.
let g:oldmakeprg=&makeprg
set makeprg=echo\ !!!!!!!!!!!\ \ \ \ \ \ Call:MM\ \ \ \ \ \ !!!!!!!!!!!!!
command -nargs=* MM call MyMake(<f-args>)
func MyMake(...)
	let &makeprg=g:oldmakeprg
"	echomsg "makeprg=". &makeprg
"	:w | :make! join(a:000, " ") | :copen
	if empty(a:000)
		exec "w" | exec "make! " . expand('%')      | exec "copen"
	else
		exec "w" | exec "make! " . join(a:000, " ") | exec "copen"
	endif
	set makeprg=echo\ !!!!!!!!!!!\ \ \ \ \ \ Call:MM\ \ \ \ \ \ !!!!!!!!!!!!!
endf


" vim-plug
call plug#begin('~/.vim')
Plug 'https://github.com/eda53/my-vim-ide.git'
Plug 'https://github.com/lifepillar/vim-mucomplete.git'
Plug 'https://github.com/juneedahamed/vc.vim.git'
Plug 'https://github.com/vim-scripts/a.vim.git'
call plug#end()


" mucomplete
set completeopt+=menuone
set shortmess+=c
set completeopt+=noinsert,noselect
let g:mucomplete#enable_auto_at_startup=1
set complete-=i
set complete-=t
let g:mucomplete#chains = { 'default': [ 'path', 'omni', 'keyn', 'dict', 'uspl', 'c-p', 'incl', 'tags' ] }


" a.vim
let g:alternateSearchPath='sfr:../source,sfr:../src,sfr:../include,sfr:../inc,'
let g:alternateSearchPath.='sfr:./include,sfr:..,'
let g:alternateSearchPath.='sfr:../common,'
let g:alternateNoDefaultAlternate=1
nmap ;a :A<CR>
"let  mapleader=";"


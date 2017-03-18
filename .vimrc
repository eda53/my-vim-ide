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
Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
Plug 'https://github.com/lifepillar/vim-mucomplete.git'
Plug 'https://github.com/juneedahamed/vc.vim.git'
Plug 'https://github.com/vim-scripts/a.vim.git'
Plug 'https://github.com/WolfgangMehner/c-support.git', { 'do' : '../my-vim-ide/hijack-temp.sh' }
"Plug 'https://github.com/sirver/ultisnips.git'
call plug#end()


" mucomplete
set completeopt+=menuone
set shortmess+=c
set completeopt+=noinsert,noselect
let g:mucomplete#enable_auto_at_startup=1
set complete-=i
set complete-=t
let g:mucomplete#chains = { 'default': [ 'path', 'omni', 'ulti', 'keyn', 'dict', 'uspl', 'c-p', 'incl', 'tags' ] }


" --- OmniCppComplete ---
"set tags+=~/.vim/commontags
" -- required --
"set nocp " non vi compatible mode
"filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode or moving away
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave *  if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot   = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem  = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch  = 2 " search namespaces in this and included files
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl  = 1 " don't require special style of function opening braces
let OmniCpp_DefaultNamespaces= ["std", "_GLIBCXX_STD", "_GLIBCXX_STD_A", "_GLIBCXX_STD_C"]
" -- ctags --  -- proj.vim
" map <ctrl>+F12 to generate ctags for current folder:
"map <C-x><C-t> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
"set tags+=./tags
set tags+=~/.bin/cpp_tags


" a.vim
let g:alternateSearchPath='sfr:../source,sfr:../src,sfr:../include,sfr:../inc,'
let g:alternateSearchPath.='sfr:./include,sfr:..,'
let g:alternateSearchPath.='sfr:../common,'
let g:alternateNoDefaultAlternate=1
nmap ;a :A<CR>
"let  mapleader=";"

" c.vim
"let g:C_MapLeader = ';'
"let g:C_CustomTemplateFile= $HOME.'/.vim/my-vim-ide/templates/c.templates'
"let g:Templates_OverwriteWarning = 'yes'
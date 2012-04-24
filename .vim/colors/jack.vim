" Vim color file
" Maintainer:	Jack Holborn
" Last Change:	05 Jan 2012

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "jack"

hi Comment	ctermfg=blue		cterm=none
hi Constant	ctermfg=red		cterm=none
hi Special	ctermfg=lightred	cterm=bold
hi Identifier	ctermfg=blue		cterm=bold
hi Statement	ctermfg=yellow		cterm=none
hi PreProc	ctermfg=magenta		cterm=none
hi type		ctermfg=green		cterm=bold
hi function	ctermfg=cyan		cterm=bold
hi repeat	ctermfg=white		cterm=none
hi Operator	ctermfg=yellow		cterm=bold
hi Underlined	cterm=underline		cterm=none
hi Ignore	ctermfg=white		cterm=none
hi Error	ctermfg=white		cterm=bold	ctermbg=lightred
hi Todo		ctermfg=black		cterm=none	ctermbg=yellow

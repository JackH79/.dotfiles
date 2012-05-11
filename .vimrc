" ~/.vimrc
" JackH79
" 2012

" Use vim, not vi
set nocompatible


filetype plugin on		" allow plugins
filetype indent on		" indent by filetype

" If has gui
if &t_Co > 2 || has("gui_running")
  syntax on			" use syntax highlighting
  set hlsearch		" highlight search results
  set t_Co=256		" use 256 colours
  set mouse=a		" allow the rat
endif

" LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" clear search results with space
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allow backspace in insert mode
set backspace=indent,eol,start

" File backups in folder
set backup			" keep a backup file
set backupdir=/home/jack/.vim/bak,/tmp

" Various settings
set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set number			" show line numbers
set linebreak				" enable line wrapping
set tabstop=4		" tabs have 4 spaces
set shiftwidth=4
set autoindent		" auto indent whilst typing
set noerrorbells	" don't beep
set background=dark	" let vim know that the background is dark
colorscheme jack	" use this colour profile
set cursorline		" highlight the current line
hi CursorLine ctermbg=darkgray term=bold cterm=bold

" Printing
set pdev=pdf		" set pdf as default
set printoptions=paper:A4,syntax:y,wrap:y,duplex:long " page settings

" Autocommands
if has("autocmd")
	augroup vimrcEx
		au!
		" jump cursor to last known position
		autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	augroup END
	au BufWritePre * let &bex = strftime("-%y-%m-%d-%H%M")
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" #########  Start vundle plugin ######## {{{
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vundle plugin commands
" ## :PluginList
" ## :PluginInstall
" ## :PluginSearch foo
" ## :PluginClean

"# markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 0
" set conceallevel=2
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/UltiSnips'

"# yaml
Plugin 'chase/vim-ansible-yaml'

"# remove whitespace
Plugin 'ntpeters/vim-better-whitespace'
":StripWhitespace

"# looks like powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='onedark'
" let g:airline_theme='luna'
" let g:airline_theme='badwolf'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'


"# file system explorer
Plugin 'scrooloose/nerdtree'
map <F7> :NERDTreeToggle<CR>
"## :NERDTree

"# nerdtree add git info
Plugin 'Xuyuanp/nerdtree-git-plugin'

"# comment out
Plugin 'tpope/vim-commentary'
autocmd FileType shell,python,perl set commentstring=#\ %s
autocmd FileType c,cpp,java set commentstring=//\ %s
"## `gcc`: comment out current line
"## `gc`:  comment out current select in visual mode
"## `gcu`: return back
"## `gcgc`

" 高亮显示当前行/列
set cursorline
set cursorcolumn

"# search
" Plugin 'haya14busa/incsearch.vim'
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
set hlsearch
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)
"## /\v(map g)

"# show function, variable list
Plugin 'majutsushi/tagbar'
map <F8> :TagbarToggle<CR>
map <F9> :TagbarToggle<CR>
"## it requires ctags
"## :Tagbar
"## Ctrl+N, Ctrl+P (next, previous tag)
"## p show
"## Ctrl+M/Enter

"# CtrlP search files
Plugin 'kien/ctrlp.vim'
"## :CtrlP
"## Ctrl+P
"## Ctrl+D file not full path
"## Ctrl+j, Ctrl+k (down,up)

"# groovy
Plugin 'groovy.vim'

"# Jenkinsfile
Plugin 'martinda/Jenkinsfile-vim-syntax'
autocmd BufNewFile,BufReadPost Jenkinsfile* set expandtab tabstop=4 shiftwidth=4 softtabstop=4 foldmethod=indent

"# code-completion
Plugin 'Valloric/YouCompleteMe'
"cd ~/.vim/bundle/YouCompleteMe
"./install.py --clang-completer
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let mapleader = ","
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" ## ctrl + o: jump back

call vundle#end()
filetype plugin indent on
" #########  End vundle plugin ######## }}}

" my settings
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,gbk,gb2312,gb18020
endif

" gui
if has("gui_running")
    set guioptions=m  " close menu bar
    set guioptions=t  " close tool bar

    if has("win32")
        set guifont=Consolas:h12
    endif
endif

set encoding=utf-8
set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

set nocompatible
set ignorecase
set incsearch
set showcmd
set ruler
set hlsearch
set fileformat=unix
set noerrorbells
set novisualbell

syntax on
" ## no backup file
set nobackup
" set noswapfile

" ## highlight current line
set cursorline
"set cursorcolumn
autocmd InsertLeave * se cul
autocmd InsertEnter * se cul

colorscheme desert
" colorscheme evening

" # Map Fn {{{
" ## auto change modified info
nnoremap <F2> :call AutoChangeModifiedTime()<CR>

" ## Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" map F4, no highlight search this time
nnoremap <F4> :nohlsearch<CR>
"}}}


"# Enable folding with the spacebar {{{
nnoremap <space> za
set foldlevelstart=99
autocmd FileType sh,python,perl set foldmethod=indent
autocmd FileType c,cpp,java set foldmethod=syntax
"}}}


autocmd FileType sh,python,perl,c,cpp,java,javascript,groovy set expandtab
autocmd FileType sh map <F5> :!bash %<CR>
autocmd FileType python map <F5> :!python %<CR>
autocmd FileType perl map <F5> :!perl %<CR>
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.yaml set filetype=ansible
autocmd BufNewFile,BufReadPost *.yml set filetype=ansible


"# compile C,C++,Java {{{
" map <F5> :call CompileRunGcc()<CR>
" func! CompileRunGcc()
" 	exec "w"
" 	if &filetype == 'c'
" 		exec "!g++ % -o %<"
" 		exec "! ./%<"
" 	elseif &filetype == 'cpp'
" 		exec "!g++ % -o %<"
" 		exec "! ./%<"
" 	elseif &filetype == 'java'
" 		exec "!javac %"
" 		exec "!java %<"
" 	elseif &filetype == 'sh'
" 		:!./%
" 	endif
" endfunc
" }}}

"# debug C, C++ {{{
" map <F8> :call Rungdb()<CR>
" func! Rungdb()
" 	exec "w"
" 	exec "!g++ % -g -o %<"
" 	exec "!gdb ./%<"
" endfunc
" }}}

"# vimrc folding {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"# jumping to the end of file when creating a new file.
" autocmd BufNewFile * normal G
"# auto insert commets at the head of file
autocmd BufNewFile *.sh,*.bash,*.p[lm],*.py exec ":call SetUnixTitle()"  | normal G
autocmd BufNewFile *.[ch],*.cpp,*.java,*.groovy,*.js exec ":call SetCLikeTitle()"  | normal G
autocmd BufNewFile *.html,*.htm exec ":call SetHtmlTitle()"  | normal 8G
autocmd BufNewFile *.xml exec ":call SetXMLTitle()"  | normal 2G

"# set HTML title {{{
func SetHtmlTitle()
	call setline(1, "<!DOCTYPE html>")
	call append(1, "<html>")
	call append(2, "<head>")
	call append(3, '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>')
	call append(4, "  <title></title>")
	call append(5, "</head>")
	call append(6, "<body>")
	call append(7, "")
	call append(8, "</body>")
	call append(9, "</html>")
endfunc
" }}}

"# set XML title {{{
func SetXMLTitle()
	call setline(1, '<?xml version="1.0" encoding="utf-8"?>')
	call append(1, "")
endfunc
" }}}

let g:authorinfo_author = "Lin, Chao"
let g:authorinfo_email = "chaochaox.lin@intel.com"
let g:star_line = "********************************************************"


"# setTitle when crate a new file {{{
func SetUnixTitle()
	let g:index = 0
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash")
		let g:index = 0
	elseif &filetype == 'perl'
		call setline(1, "\#!/usr/bin/env perl")
		let g:index = 0
	elseif &filetype == 'python'
		call setline(1, "\#!/usr/bin/env python")
		call append(1, '# -*- coding: UTF-8 -*-')
		let g:index = 1
	endif

	call append(g:index + 1, "\# ".g:star_line)
	call append(g:index + 2, "\# @file: ".expand("%"))
	call append(g:index + 3, "\# @author: ".g:authorinfo_author." <".g:authorinfo_email.">")
	call append(g:index + 4, "\# @create time: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(g:index + 5, "\# @last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(g:index + 6, "\# @description:")
	call append(g:index + 7, "\# ".g:star_line)
	call append(g:index + 8, "")
	call append(g:index + 9, "")
endfunc
" }}}


"# setCLikeTitle when crate a new file {{{
func SetCLikeTitle()
	let g:index = 0
	if &filetype == 'groovy'
		call setline(1, "#!/usr/bin/env groovy")
		call append(1, "/*")
		let g:index = 1
	else
		call setline(1, "/*")
		let g:index = 0
	endif
	call append(g:index + 1, " * @file: ".expand("%"))
	call append(g:index + 2, " * @author: ".g:authorinfo_author." <".g:authorinfo_email.">")
	call append(g:index + 3, " * @create time: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(g:index + 4, " * @last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(g:index + 5, " * @description:")
	call append(g:index + 6, " */")

	if &filetype == 'c'
		call append(g:index + 7, "#include <stdio.h>")
		call append(g:index + 8, "")
		call append(g:index + 9, "")
	elseif &filetype == 'cpp'
		call append(g:index + 7, "#include <iostream>")
		call append(g:index + 8, "using namespace std;")
		call append(g:index + 9, "")
		call append(g:index + 10, "")
	else
		call append(g:index + 7, "")
		call append(g:index + 8, "")
	endif
endfunc
" }}}


"# change modified time {{{
func AutoChangeModifiedTime()
    execute "normal ma"
    exe "1,5g/file:.*/s/file:.*/file: " .expand("%")
    exe "1,10g/last modified:.*/s/last modified:.*/last modified: " .strftime("%Y-%m-%d %H:%M:%S")
    execute "normal `a"
    execute "normal ma"
endfunc
" }}}

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 

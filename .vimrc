"vundle begin
set nocompatible " be iMproved
filetype off  "required!

if has('win32') || has('win64')
	set rtp^=~/.vim/
	set rtp+=~/.vim/vimfiles/bundle/vundle/
	call vundle#rc('$HOME/.vim/vimfiles/bundle')
else
	" Usual quickstart instructions
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
endif

" let Vundle manage plugins
" required! 
Bundle 'gmarik/vundle'

" vim-scripts.org repos
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'bufexplorer.zip'
Bundle 'grep.vim'
" Github repos
Bundle 'tomasr/molokai'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'altercation/vim-colors-solarized'
Bundle 'airblade/vim-gitgutter'
Bundle 'embear/vim-localvimrc'
"Bundle 'Shougo/neocomplete.vim'

filetype plugin indent on     " required! 
" vundle end

"" GUI
set background=dark
colorscheme desert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cursorline
hi CursorLine ctermbg=237 cterm=None
set hlsearch
hi Search cterm=bold ctermfg=None ctermbg=grey

" For quick replace
map <leader>s :%s/\(<c-r>=expand("<cword>")<cr>\)/

" For C++ completion plugin
if v:version <= 703 || !has('python')
	" For omnicomplete
	Bundle 'OmniCppComplete'
	let OmniCpp_NamespaceSearch = 1      
	let OmniCpp_GlobalScopeSearch = 1      
	let OmniCpp_ShowScopeInAbbr = 1
	let OmniCpp_ShowPrototypeInAbbr = 1
	let OmniCpp_ShowAccess = 1      
	let OmniCpp_MayCompleteDot = 1
	let OmniCpp_MayCompleteArrow = 1      
	let OmniCpp_MayCompleteScope = 1      
	let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
	" Do not show preview window
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif
else
	Bundle 'Valloric/YouCompleteMe'
	"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
	"let g:ycm_confirm_extra_conf = 0
	let g:ycm_autoclose_preview_window_after_completion = 1
	let g:ycm_autoclose_preview_window_after_insertion = 1
	noremap <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif

" For NERDTree plugin
" autocmd vimenter * NERDTree
map <leader>t :NERDTreeToggle<CR>
"let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" For Tagbar plugin
noremap <silent> <F9> :TagbarToggle<CR>

" For BufExplorer shortcut key
noremap <silent> <F8> :BufExplorer<CR>

" For ctags
set tags+=~/.vim/tagfiles/stl_tags
map <F12> :!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.java" -o -name "*.py" > .srcFiles <CR> :!ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q -L .srcFiles <CR><CR>

" For CtrlP Plugin
" let g:ctrlp_working_path_mode=1
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore={
	\ 'dir': '\.git$\|\.hg$\|\.svn$\|build$\|deps$\|lib$\|release$\|debug$',
	\}

" For powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#whitespace#enabled = 0

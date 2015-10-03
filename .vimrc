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
"Bundle 'scrooloose/syntastic'
Bundle 'embear/vim-localvimrc'

filetype plugin indent on     " required! 
" vundle end

"" GUI
set background=dark
colorscheme desert

" Personal setting
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

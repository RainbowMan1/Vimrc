set nocompatible
set number
set hlsearch

set tabstop=2       
set shiftwidth=2   
set softtabstop=2 
set expandtab
set autoindent

autocmd BufReadPost,BufNewFile *.h,*.cc,*.cpp,*.hpp source ~/Vimrc/C++/C++.vim 
autocmd BufReadPost,BufNewFile *.py source ~/Vimrc/Python/Python.vim 

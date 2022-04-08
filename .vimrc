set number
set relativenumber
syntax enable
filetype on
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set clipboard=unnamedplus
set term=xterm-256color
set termguicolors
set background=dark

map <C-P> :NERDTree<CR>

call vundle#begin()
    Plugin 'preservim/nerdtree'
    Plugin 'dracula/vim', { 'name': 'dracula' }
    Plugin 'ap/vim-css-color'
call vundle#end()

colorscheme dracula

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1

autocmd BufWritePost .Xresources execute "!xrdb ~/.Xresources"
autocmd BufWritePost config.def.h execute "!cp config.def.h config.h && sudo make install"
autocmd BufWritePost config.h execute "!cp config.h config.def.h && sudo make install"

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfile/after,~/.vim/after
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats="pdf, aux"

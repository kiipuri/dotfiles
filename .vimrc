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
call vundle#end()

colorscheme dracula

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1

autocmd BufWritePost .Xresources execute "!xrdb ~/.Xresources"

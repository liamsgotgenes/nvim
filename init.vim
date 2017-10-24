set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
call plug#end()
"auto-complete on start
let g:deoplete#enable_at_startup = 1
"auto-complete english dictionary
"setlocal dictionary+=/usr/share/dict/american-english
"NERTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Ale/linter
let g:ale_sign_column_always = 1
"color
colorscheme elda
nmap <F2> :TagbarToggle<CR>
let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1"
let g:deoplete#sources#clang#clang_header ="/usr/include/clang"
"map autocomplete to tab key
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

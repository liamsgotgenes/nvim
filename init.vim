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
Plug 'quabug/vim-gdscript'
call plug#end()

"disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"auto-complete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview
let g:deoplete#sources#clang#libclang_path="/home/lain/.clang/build/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/usr/lib/clang"
"auto-complete english dictionary
"setlocal dictionary+=/usr/share/dict/american-english

"NERDTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Ale/linter
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"colorschemes
colorscheme elda

"Tagbar
nmap <F2> :TagbarToggle<CR>

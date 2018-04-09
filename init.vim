set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
Plug 'dracula/vim'
Plug 'Rip-Rip/clang_complete'
Plug 'enricobacis/vim-airline-clock'
Plug 'zchee/deoplete-jedi'
Plug 'pedrosans/vim-notes'
Plug 'pedrosans/vim-misc'
call plug#end()

let file_extension=expand('%:e')
let file_name=expand('%t')
if file_extension=="java"
    nmap <F10> :!javac *java && java main<CR>
endif
if file_extension=="cpp"||file_extension=="h"
    nmap <F10> :!make && ./a.out<CR>
endif
if file_extension=="py"
    nmap <F10> :!python *py<CR>
endif
if file_extension=="c"
    nmap <F10> :!gcc *c && ./a.out<CR>
endif

"remap tabswitch
nmap <C-j> :tabprevious<CR>
nmap <C-k> :tabnext<CR>
imap <C-j> <Esc> :tabprevious<CR>
imap <C-k> <Esc> :tabnext<CR>

"remap opening a new tab in normal mode
nmap <C-p> :tabnew<CR>
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
if hostname()=="lappy"
    let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
    let g:deoplete#enable_at_startup=0
    let g:deoplete#max_list=10
    imap <C-Space> <nop>
    nmap <C-Space> :call deoplete#toggle()<CR>
    imap <C-Space> <C-o>:call deoplete#toggle()<CR>
elseif hostname()=="navi"
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#max_list=20
endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview

"NERDTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Ale/linter
let g:ale_sign_column_always = 1
nmap <silent> <C-m> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

"colorschemes
"colorscheme elda

"Tagbar
nmap <F2> :TagbarToggle<CR>

"airline theme
let g:airline_theme='bubblegum'

"html autoclose tags
let g:closetag_filenames = '*.html, *.xml, *.xhtml'

syntax on
color dracula

"terminal keymaps
tnoremap <C-w> <c-\><C-n><C-w>
let g:ale_java_javac_classpath = "/media/lain/SHARE/JavaWorkspace/ScpGUI/src/edu/ilstu/"

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

"javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"syncs the ale java path with javacomplete2's path
:command Path let g:ale_java_javac_classpath = javacomplete#server#GetClassPath()

"fixes autopair bug with clang_complete
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

"clock update time and format
let g:airline#extensions#clock#updatetime = 999
let g:airline#extensions#clock#format = "%I:%M%p"

filetype plugin on
let g:notes_suffix='.txt'
let g:notes_tab_indents = 1
let g:notes_directories=['~/Notes']

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
Plug 'quabug/vim-gdscript'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
call plug#end()


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
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview
"auto-complete english dictionary
"setlocal dictionary+=/usr/share/dict/american-english

"NERDTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Ale/linter
let g:ale_sign_column_always = 1
nmap <silent> <C-m> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

"colorschemes
colorscheme elda

"Tagbar
nmap <F2> :TagbarToggle<CR>

"airline theme
let g:airline_theme='bubblegum'

"html autoclose tags
let g:closetag_filenames = '*.html, *.xml, *.xhtml'

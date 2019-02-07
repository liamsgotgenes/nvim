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
Plug 'rhysd/vim-clang-format'
Plug 'justinmk/vim-syntax-extra'
Plug 'dylanaraps/wal.vim'
Plug 'romainl/vim-cool'
Plug 'NLKNguyen/copy-cut-paste.vim'
call plug#end()
let g:CoolTotalMatches = 1


let g:theme_index=1
let g:number_of_themes=3
function Change_theme (arg)
    if a:arg=="l"
        let g:theme_index=g:theme_index+1
        if g:theme_index==g:number_of_themes
            let g:theme_index=0
        endif
    else
        let g:theme_index=g:theme_index-1
        if g:theme_index==-1
            let g:theme_index=g:number_of_themes-1
        endif
    endif

    if g:theme_index==0
        "needs to redraw and call color twice in order to change cursor color,
        "idk why but it #justworks
        let g:airline_theme="dracula"
        color dracula
        redraw
        color dracula
        redraw
    endif
    if g:theme_index==1
        let g:airline_theme='jet'
        color eva
    endif
    if g:theme_index==2
        let g:airline_theme='wal'
        color wal
    endif
endfunction

let file_extension=expand('%:e')
let file_name=expand('%t')
if file_extension=="java"
    nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    nmap <F10> :!javac *java && java main<CR>
endif
if file_extension=="cpp"||file_extension=="h"
    nmap <F10> :!make && ./a.out<CR>
endif
if file_extension=="py"
    nmap <F10> :!python *py<CR>
endif
if file_extension=="c"
    nmap <F10> :!make<CR>
endif
if file_extension=="txt"
    setlocal dictionary+=/usr/share/dict/american-english
endif

"remap tabswitch
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>

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

"map arrow keys for theme changer function
nmap <left> :call Change_theme("l")<CR>
nmap <right> :call Change_theme("r")<CR>

"auto-complete
let g:deoplete#enable_at_startup = 1
nmap <C-Space> :call deoplete#toggle()<CR>
imap <C-Space> <C-o>:call deoplete#toggle()<CR>
let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
let g:deoplete#max_list=10

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview

"NERDTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Ale/linter
let g:ale_sign_column_always = 1
nmap <silent> <C-m> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

"Tagbar
nmap <F2> :TagbarToggle<CR>

"airline theme
"let g:airline_theme='jet'

"html autoclose tags
let g:closetag_filenames = '*.html, *.xml, *.xhtml'

syntax on
"color dracula
"color eva

"terminal keymaps
tnoremap <C-w> <c-\><C-n><C-w>

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

"vim-notes
filetype plugin on
let g:notes_suffix='.txt'
let g:notes_tab_indents = 1

let g:airline_powerline_fonts = 1
call Change_theme("r")

"copy from vim simplified
let g:copy_cut_paste_no_mappings = 1
vmap <C-c> <Plug>CCP_CopyText

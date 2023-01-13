"  ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓
"  ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░
" ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ 
" ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒
" ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░
" ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░
"    ░   ░ ░     ░░   ▒ ░░      ░   
"          ░      ░   ░         ░   
"                ░                  
call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
Plug 'pedrosans/vim-misc'
Plug 'rhysd/vim-clang-format'
Plug 'romainl/vim-cool'
Plug 'NLKNguyen/copy-cut-paste.vim'
Plug 'Yggdroot/indentLine'
Plug 'numirias/semshi'
Plug 'vim-scripts/indentpython.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/cSyntaxAfter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-syntax-extra'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'aserebryakov/vim-todo-lists'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'tpope/vim-surround'
Plug 'turbio/bracey.vim'
call plug#end()

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number

let g:indentLine_conceallevel = 2
let g:CoolTotalMatches = 1


"colorscheme eva01
hi Normal ctermbg=None 
let g:airline_theme='base16'

highlight clear SignColumn

"disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>

nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :TagbarToggle<CR>

" COC
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<Tab>"
      "\ <SID>check_back_space() ? "\<Tab>" :
      "\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

map <F3> :!make<CR>
imap <F3> <Esc> :!make<CR>

function Java_Mappings()
    noremap <F3> :CocCommand java.action.organizeImports<CR>
    noremap <F4> :FloatermNew! ./gradlew bootRun<CR>
endfunction

noremap "" "+y<CR>

" =========================================================================================
" Cozy floaterm
" =========================================================================================
" tnoremap <C-h> <C-\><C-n> :FloatermToggle<CR>
" 
" let g:big_term = 0
" let g:vis_term = 0
" 
" function Hush()
"     if g:vis_term == 1
"         call feedkeys("\<C-\>")
"         call feedkeys("\i")
"     else
"         normal :
"         startinsert
"     endif
" endfunction
" 
" function Tog_Vis()
"     FloatermToggle
"     if g:vis_term == 0
"         let g:vis_term = 1
"     else
"         let g:vis_term = 0
"     endif
"     call Hush()
" endfunction
" 
" function Tog_Size()
"     if g:vis_term == 0
"         call Hush()
"         return
"     endif
"     if g:big_term == 0
"         FloatermUpdate --height=1.1 --width=1.0
"         let g:big_term = 1
"     else
"         FloatermUpdate --height=0.6 --width=0.6
"         let g:big_term = 0
"     endif
"     call Hush()
" endfunction
" 
" "noremap <F3> <C-\><C-n>:call Tog_Size()<CR>
" "tnoremap <F3> <C-\><C-n>:call Tog_Size()<CR>
" 
" "noremap <F4> :call Tog_Vis()<CR>
" "tnoremap <F4> <C-\><C-n>:call Tog_Vis()<CR>
" 
" noremap <F4> :PrevColorScheme<CR>color<CR>
" noremap <F5> :NextColorScheme<CR>color<CR>
" 
" let g:floaterm_wintitle = get(g:, 'floaterm_wintitle', "v:false")
" let g:floaterm_autoclose = get(g:, 'floaterm_autoclose', '2')
" "let g:floaterm_borderchars = get(g:, 'floaterm_borderchars', ['', '', '', '', '', '', '', ''])
" 
" function Cozy_Term()
"     let g:vis_term = 1
"     AirlineToggle
"     set noshowmode
"     set noruler
"     set laststatus=0
"     set noshowcmd
"     set cmdheight=1
"     set number!
"     terminal rain
"     IndentLinesDisable
"     FloatermToggle
"     call Hush()
" endfunction



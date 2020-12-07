" %s/\_s*{/{\r/g
syntax on

set guicursor=
set cursorline
set cursorcolumn
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set nu
set noswapfile
set nowrap
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set noshowmode
set backspace=indent,eol,start
set scrolloff=999
"iset sidescrolloff=999
set encoding=utf-8
"set wrap linebreak

set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


"xsel
set clipboard=unnamedplus

set colorcolumn=75
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'rust-lang/rust.vim'
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'pangloss/vim-javascript'
  Plug 'jvirtanen/vim-octave'
  " Plug 'tranvansang/octave.vim'
  "Plug 'morhetz/gruvbox'
call plug#end()


" color scheme
syntax enable
colorscheme dracula

" ariline
let g:airline_theme='dracula'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


" vim-hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']


" files
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
" let g:netrw_sort_by = "exten"


" remap
let mapleader = " "
inoremap <C-c> <esc>
nnoremap <leader>q :bp <bar> bd # <CR>
nnoremap <leader>cg :bd! <bar> :Goyo <CR>
nnoremap <leader>ca :wa <bar> %bd <bar> e# <bar> bd# <CR>
nnoremap <leader>w :wa <CR>
tnoremap ii  <c-\><c-n>
nnoremap <leader>v :vsplit<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>cl :Goyo<CR>
nnoremap <leader>pv :Ex <CR>
nnoremap <leader>t :wa <bar> :term ++curwin<CR>
nnoremap <leader>r :wa <bar> :term ++curwin ext %<CR>
nnoremap <leader>d :wa <bar> :term ++curwin zsh -c "clang++ -fstandalone-debug -g -O0 *.cpp -o ../main && lldb ../main"<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>ps :Rg<CR>
nnoremap <Leader><CR> :so $MYVIMRC<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap U <C-r>
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap Y yv
nnoremap D dv
inoremap ii <Esc>
inoremap ê <C-k>e>


" move line
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" clang-format
map <C-f> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-f> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()



" coc

"autocmd FileType * let b:coc_suggest_disable = 1
autocmd FileType markdown let b:coc_suggest_disable = 1

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_snippet_next = '<tab>'




" goyo
let g:goyo_linenr = 1
let g:goyo_width = '50%'
let g:goyo_height = '100'


" rustfmt
let g:rustfmt_autosave = 1
syntax enable
filetype plugin indent on

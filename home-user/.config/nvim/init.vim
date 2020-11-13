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
set nu
set nowrap
set ignorecase 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
"set wrap linebreak

"xsel
set clipboard=unnamedplus


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=104
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
" Neovim lsp Plugins
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

let mapleader = " "

nnoremap <leader>q :bd! <bar> :Goyo <CR>
nnoremap <leader>w :w <CR>
tnoremap <esc> <c-\><c-n>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>cl :Goyo<CR>
nnoremap <leader>pv :Ex <CR>
nnoremap <leader>r :wa <bar> :term ext %<CR>
nnoremap <leader>d :wa <bar> :term clang++ -fstandalone-debug -g -O0 main.cpp -o main && lldb main <CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>ps :Rg<CR>
nnoremap <Leader><CR> :so $MYVIMRC<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap U <C-r>
imap ii <Esc>
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap o o<Esc>
nnoremap O O<Esc>

"clang-format
map <C-f> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-f> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

inoremap <C-c> <esc>

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart




"nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
"nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
"nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
"nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
"nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
"
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
"
"autocmd BufEnter * lua require'completion'.on_attach()
"" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"let g:completion_enable_auto_popup = 0
"
"" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect
"
"" Avoid showing message extra message when using completion
"set shortmess+=c
"
"let g:completion_enable_auto_hover = 0
"let g:completion_enable_auto_signature = 0





syntax enable
colorscheme dracula

let g:goyo_linenr = 1
let g:goyo_width = '50%'
let g:goyo_height = '100'
let g:airline_theme='dracula'

autocmd FileType * let b:coc_suggest_disable = 1
"autocmd vimenter * colorscheme gruvbox
"colorscheme gruvbox

let g:rustfmt_autosave = 1

syntax enable
filetype plugin indent on

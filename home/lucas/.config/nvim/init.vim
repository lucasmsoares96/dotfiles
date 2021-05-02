if exists('g:vscode')
  set clipboard=unnamedplus
	" remap
	let mapleader = " "
	inoremap <C-c> <esc>
	tnoremap ii  <c-\><c-n>
	nnoremap <C-l> :bnext<CR>
	nnoremap <C-h> :bprevious<CR>
	nnoremap <S-k> <C-u>
	nnoremap <S-j> <C-d>
	nnoremap U <C-r>
	nnoremap o o<Esc>
	nnoremap O O<Esc>
	nnoremap Y yv
	nnoremap D dv
	inoremap ii <Esc>

	" nnoremap <silent> gD <C-]>   
else
	set cursorline
	set cursorcolumn
	set guicursor=
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
	set noswapfile
	set nobackup
	set undodir=~/.vim/undodir
	set undofile
	set incsearch
	set termguicolors
	set scrolloff=99
	" set noshowmode
	set signcolumn=no
	set isfname+=@-@
	" set ls=0
	set timeoutlen=250

	" Give more space for displaying messages.
	set cmdheight=1

	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=50

	set colorcolumn=76

	"xsel
	set clipboard=unnamedplus


	highlight ColorColumn ctermbg=0 guibg=lightgrey


	call plug#begin('~/.vim/plugged')
	  Plug 'neovim/nvim-lspconfig'
	  Plug 'nvim-lua/completion-nvim'
	  "  Plug 'SirVer/ultisnips'
	  Plug 'honza/vim-snippets'
	  Plug 'norcalli/snippets.nvim'
	  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
	  Plug 'dracula/vim', { 'as': 'dracula' }
	  Plug 'junegunn/goyo.vim'
	  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	  Plug 'junegunn/fzf.vim'
	  Plug 'vim-airline/vim-airline'
	  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	  Plug 'rust-lang/rust.vim'
	  Plug 'pangloss/vim-javascript'
	  Plug 'jvirtanen/vim-octave'
	  Plug 'posva/vim-vue'
	  " Plug 'tranvansang/octave.vim'
	  "Plug 'morhetz/gruvbox'
	call plug#end()

	"  completion-nvim
	lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}

	" Use <Tab> and <S-Tab> to navigate through popup menu
	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" Set completeopt to have a better completion experience
	set completeopt=menuone,noinsert,noselect

	" Avoid showing message extra message when using completion
	set shortmess+=c



	lua require'snippets'.use_suggested_mappings()

	" This variant will set up the mappings only for the *CURRENT* buffer.
	lua require'snippets'.use_suggested_mappings(true)

	" There are only two keybindings specified by the suggested keymappings, which is <C-k> and <C-j>
	" They are exactly equivalent to:

	" <c-k> will either expand the current snippet at the word or try to jump to
	" the next position for the snippet.
	inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

	" <c-j> will jump backwards to the previous field.
	" If you jump before the first field, it will cancel the snippet.
	inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>



	lua require'nvim-treesitter.configs'.setup {highlight = {enable = true,},}


	" color scheme
	syntax enable
	colorscheme dracula
	if exists('+termguicolors')
	    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif

	" ariline
	let g:airline_theme='dracula'


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
	nnoremap <leader>t :wa <bar> :term fish<CR>
	nnoremap <leader>r :wa <bar> :term ++curwin ext %<CR>
	nnoremap <leader>d :wa <bar> :term ++curwin zsh -c "clang++ -fstandalone-debug -g -O0 *.cpp -o ../main && lldb ../main"<CR>
	nnoremap <Leader>pf :Files<CR>
	nnoremap <Leader>ps :Rg<CR>
	nnoremap <Leader><CR> :so $MYVIMRC<CR>
	nnoremap <Leader>+ :vertical resize +5<CR>
	nnoremap <Leader>- :vertical resize -5<CR>
	nnoremap <Leader>rp :resize 100<CR>
	nnoremap <S-k> <C-u>
	nnoremap <S-j> <C-d>
	nnoremap U <C-r>
	nnoremap o o<Esc>
	nnoremap O O<Esc>
	nnoremap Y yv
	nnoremap D dv
	inoremap ii <Esc>


	nnoremap <silent> gD <C-]>   


	" move line
	nnoremap <A-j> :m .+1<CR>==
	nnoremap <A-k> :m .-2<CR>==
	inoremap <A-j> <Esc>:m .+1<CR>==gi
	inoremap <A-k> <Esc>:m .-2<CR>==gi
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


	" goyo
	let g:goyo_linenr = 1
	let g:goyo_width = '50%'
	let g:goyo_height = '100'


	" rustfmt
	let g:rustfmt_autosave = 1
	syntax enable
	filetype plugin indent on


	" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
	" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
	" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
	" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
	" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
	" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
	" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
	" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
	" nnoremap <leader>f      <cmd>lua vim.lsp.buf.formatting()<CR>
endif


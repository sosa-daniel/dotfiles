""" Plugins & Colorscheme - Install with Vim-Plug
""" ============================================================================
"call plug#begin()
"Plug 'davidhalter/jedi-vim'         " Python autocompletion library!
"Plug 'vim-scripts/indentpython.vim' " Better autoindent for PEP 8
"Plug 'sheerun/vim-polyglot'         " Syntax highlighting and auto-indentation
"Plug 'junegunn/vim-easy-align'      " Operators/objects for aligning text
"Plug 'tpope/vim-surround'           " Operators/objects for sorrounding chars
"Plug 'tpope/vim-repeat'             " dependency of surround
"if has('nvim')                      " Plugins depending if on Vim/NeoVim
"    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
"    Plug 'nvim-lua/plenary.nvim'                              
"    Plug 'neovim/nvim-lspconfig'
"else	
"    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }      
"    Plug 'junegunn/fzf.vim'                                 
"    Plug 'tpope/vim-commentary'     " Extra operator to comment/uncomment
"endif
"Plug 'itchyny/lightline.vim'        " Statusline
"Plug 'catppuccin/vim', { 'as': 'catppuccin'}
"call plug#end()
"let g:lightline = { 'colorscheme': 'one'}
"colorscheme catppuccin_macchiato 

"" Base Settings
"" ============================================================================
set nocompatible      " Disable vi compatibility
set guicursor=a:block " Set the cursor to block in all modes
set encoding=utf8     " Avoid encoding headaches
"set laststatus=2      " Enable statusline (lightline Plugin)
"set noshowmode        " Don't show mode (lightline Plugin)
set hidden            " Allows moving through buffers without saving first
"set cursorline        " Highlights the current line in the editor
set scrolloff=2       " The number of context lines above and below the cursor
set incsearch         " Highlights the pattern as a search command is typed
set ignorecase        " Ignore case in search patterns
set smartcase         " Except if you use upper case in your search pattern
set number            " Absolute line numbers
augroup numbertoggle  " Relative numbers in normal/visual modes only
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set clipboard^=unnamed,unnamedplus " Interact with the OS clipboard
autocmd BufNewFile,BufRead *.py    " PEP 8 indentation (Python)
    \ set tabstop=4                " Tab chars are displaced as 4 spaces
    \ set softtabstop=4            " Amount of whitespace per tab/backspace
    \ set shiftwidth=4             " 4 spaces per level of indentation
    \ set expandtab                " Use spaces instead of tab chars
    \ set autoindent               " Indent automatically
    \ set colorcolumn=80           " Marks an 80-character column limit
    \ set fileformat=unix          " Avoids conversion issues with Github
    \ match BadWhitespace /\s\+$/  " Mark extra whitespace as bad
" Use `:H` instead of `:help` for fullscreen help window
command! -nargs=1 -complete=help H help <args> | silent only 

"" Key Mapping
"" ============================================================================
let mapleader = " "
" Exit Insert mode by pressing 'jk'
inoremap jk <Esc>
" Center screen after scrolling up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" Buffer navigation
nnoremap <leader>b :ls!<CR>:b<space>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"add numbered jumps to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
if has('nvim') " If in NeoVim, map to telescope.nvim
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
else           " If in Vim, map to fzf.vim
    nnoremap <leader>ff <cmd>Files<cr>
    nnoremap <leader>fg <cmd>Rg<cr>
    nnoremap <leader>fb <cmd>Buffers<cr>
    nnoremap <leader>fh <cmd>Helptags<cr>
endif
" Beancount commands (remember l for ledger)
nnoremap <leader>lc :! bean-check % <CR>
nnoremap <leader>lf :%! bean-format <CR>
nnoremap <leader>lt :! bean-report % trial <CR>
nnoremap <leader>la :! bean-report % accounts <CR>
nnoremap <leader>le :! bean-report % equity <CR>

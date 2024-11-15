""" Changes last set 2024-11-14
"" Plugins & Colorscheme - Install with Vim-Plug
"" ====================================================================
call plug#begin()
Plug 'davidhalter/jedi-vim'                                         " Python autocompletion library!
Plug 'sheerun/vim-polyglot'                                         " Syntax highlighting and auto-indentation
Plug 'junegunn/vim-easy-align'                                      " Extra operators and text-objects for aligning text
Plug 'tpope/vim-surround'                                           " Extra operators and text-objects for sorrounding characters
Plug 'tpope/vim-repeat'                                             " dependency of surround
if has('nvim')                                                      " Plugins depending if on Vim/NeoVim
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } " Fuzzy finder
	Plug 'nvim-lua/plenary.nvim'                                " Dependency of telescope
else	
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " Fuzzy finder
	Plug 'junegunn/fzf.vim'                                     " Fuzzy finder integration
	Plug 'tpope/vim-commentary'                                 " Extra operator to comment/uncomment
endif
Plug 'itchyny/lightline.vim'                                        " Statusline
Plug 'catppuccin/vim', { 'as': 'catppuccin'}                        " Colorscheme
call plug#end()
let g:lightline = { 'colorscheme': 'one'}
colorscheme catppuccin_macchiato 

"" Base Settings
"" ====================================================================
set encoding=utf8
set hidden      " Allows moving through buffers without saving first
set cursorline  " Highlights the current line in the editor
set scrolloff=2 " The number of context lines above and below the cursor (similar to zz command)
set incsearch   " Incremental search highlights the pattern as a search command is typed
set ignorecase  " Ignore case in search patterns
set smartcase   " Except if you use upper case in your search pattern
set number      " User relative numbers in normal mode only for an active buffer; user absolute numbers elsewhere
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set clipboard^=unnamed,unnamedplus                           " Interact with the OS clipboard
command! -nargs=1 -complete=help H help <args> | silent only " use `:H` instead of `:help` for fullscreen help window

"" Key Mapping
"" ====================================================================
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
" Execute command under cursor (line)
"nnoremap <leader>c Y:@"<CR>
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

""" Changes last set 2024-11-13
"" Plugins & Colorscheme - install with Vim-Plug: https://github.com/junegunn/vim-plug
"" ====================================================================
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'nvim-lua/plenary.nvim'
Plug 'echasnovski/mini.icons'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin'}
call plug#end()
let g:lightline = {
	\ 'colorscheme': 'one',
	\ }
colorscheme catppuccin_macchiato 

"" Base Settings
"" ====================================================================
set encoding=utf8
set hidden " 'hidden' allows moving through buffers without saving first
set cursorline " Highlights the current line in the editor
" User relative numbers in normal mode only for an active buffer; user absolute numbers elsewhere
set number 
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" Scroll offset determines the number of context lines you would like to see above and below the cursor (similar to zz command)
set scrolloff=4
" Interact with the OS clipboard
set clipboard^=unnamed,unnamedplus
"" Search settings
set incsearch " Incremental search highlights the pattern as a search command is typed
set ignorecase " Ignore case in search patterns
set smartcase " Except if you use upper case in your search pattern
" use `:H` instead of `:help` for fullscreen help window
command! -nargs=1 -complete=help H help <args> | silent only

"" Key Mapping
"" ====================================================================
let mapleader = " "
" Exit Insert and Visual modes by pressing 'jk'
inoremap jk <Esc>
" Center screen after scrolling up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" add numbered jumps to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
" Buffer navigation
nnoremap <leader>b :ls!<CR>:b<space>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Execute command under cursor (line)
"nnoremap <leader>c Y:@"<CR>
nnoremap <C-P> :FZF<CR>

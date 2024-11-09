"" Changes last set 2024-11-08
"" Base Settings
"" ====================================================================
colorscheme slate
" 'hidden' allows moving through buffers without saving first
set hidden
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
" Incremental search highlights the pattern as a search command is typed
set incsearch
" Ignore case in search patterns
set ignorecase
" Except if you use upper case in your search pattern
set smartcase

"" Key Mapping
"" ====================================================================
let mapleader = " "
" Exit Insert and Visual modes by pressing 'jk'
inoremap jk <Esc>
vnoremap jk <Esc>
" Center screen after scrolling up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" add numbered jumps to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
" Buffer navigation
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

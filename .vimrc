"" Changes last set 2024-11-04
"" Base Settings
"" ====================================================================
" Disable the mouse
set mouse=
" User relative numbers in normal mode only for an active buffer; user absolute numbers elsewhere
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" Scroll offset determines the number of context lines you would like to see above and below the cursor (similar to zz command)
set scrolloff=8
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
" Exit Insert mode by pressing 'jk'
inoremap jk <Esc>
" Center screen after scrolling up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" Press space twice to switch between your last two buffers
nnoremap <leader><leader> <C-^>
" add numbered jumps to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

"" This VIMRC file does not make use of any plugins
"" Base Settings
"" ============================================================================
set nocompatible      " Disable vi compatibility
colorscheme slate     " Colorscheme
set nolist            " Don't show whitespace chars.
set guicursor=a:block " Set the cursor to block in all modes
set encoding=utf8     " Avoid encoding headaches
set laststatus=2      " Enable statusline
set hidden            " Allows moving through buffers without saving first
set cursorline        " Highlights the current line in the editor
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
set tabstop=4                " Tab chars are displaced as 4 spaces
set softtabstop=4            " Amount of whitespace per tab/backspace
set shiftwidth=4             " 4 spaces per level of indentation
set expandtab                " Use spaces instead of tab chars
set autoindent               " Indent automatically
"set colorcolumn=80           " Marks an 80-character column limit
set fileformat=unix          " Avoids conversion issues with Github
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

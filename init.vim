"" Changes last set 2024-11-08
"" Edit with `:e $MYVIMRC`

" Highlight the yanked text for 40 ms
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=40})
augroup END

" Read .vimrc config
source $HOME/.vimrc

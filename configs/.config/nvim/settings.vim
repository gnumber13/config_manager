syntax enable

filetype plugin indent on
set fileencoding=utf-8
set fileencodings=utf-8

" set tabstop to 4 chars and fill with spaces
set tabstop=4
set shiftwidth=4
set expandtab
"" Fix backspace indent
set backspace=indent,eol,start

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set fileformats=unix,dos,mac

set path+=**
set wildmenu

let g:netrw_liststyle=3     " tree view
let g:netrw_winsize=20	    " set treeview width

set number
set relativenumber
set clipboard+=unnamedplus

set hidden "open buffer in background
set nowrap "display long lines as one line

set splitbelow
set encoding=utf-8
set cursorline
set scrolloff=8
set signcolumn=yes


"autosource configs when written to them
au BufWritePost $MYVIMRC source %
au BufWritePost $HOME/.config/nvim/settings.vim source %
au BufWritePost $HOME/.config/nvim/keymappings.vim source %
au BufWritePost $HOME/.config/nvim/plugins.vim source %



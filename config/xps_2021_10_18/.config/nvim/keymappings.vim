" any mode
noremap <F3> :Lex<Return>
noremap <C-i> :resize +3<CR>
noremap <C-n> :resize -3<CR>
noremap <C-p> <C-w>3<>
noremap <C-u> <C-w>3>

" Normalmode 

nnoremap go :Goyo<CR>:set wrap<CR>
nnoremap yo :Goyo!<CR>:set nowrap<CR>

nnoremap <F8> :buffers<CR>:buffer<Space>


" Insertmode
inoremap jj <Esc>

" open terminal right
nnoremap tt :vs<Return><C-w>w:terminal<Return>i

" Terminalbuffer "insertmode"
" map esc-sequence of term-buffer to <esc>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>w <Esc><C-w>w
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l
"... and jj
tnoremap jj <C-\><C-n>

"set if filetype is python
"au FileType python noremap <C-j>j :w !python3<Return>
" in ~/.local/bin/compile
map  <C-j>j :w! \| !compile % <CR><CR>


" abbreviations
iabbrev _hi Hello World 
iabbrev _sh #!/bin/sh
iabbrev _incl #include <
iabbrev ``` ```<CR><CR>```<Esc>ki
iabbrev tex $$<CR><CR>$$<Esc>ki


iabbrev cmain int main () {<CR><CR>}<Esc>ki

" for plugin: markdown-preview
"" normal/insert
"<Plug>MarkdownPreview
"<Plug>MarkdownPreviewStop
"<Plug>MarkdownPreviewToggle

"" example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle


"" Map leader to ,
let mapleader= "\<Space>"

"" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>d :bd<CR>

"" Switching windows
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

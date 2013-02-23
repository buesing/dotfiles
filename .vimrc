"GENERAL configuration

syntax on
set background=dark
colorscheme smyck
set autoindent
set number
"set tabs to insert 4 spaces
set shiftwidth=4
set tabstop=4
"set expandtab
"view cursor at beginning of tab in normal mode
set list lcs=tab:\ \ 
set backspace=indent,eol,start
"statusline
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=\ %h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


set encoding=utf-8
set fileencoding=utf-8

"VUNDLE configuration

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/powerline'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'vim-scripts/tlib'
Bundle 'honza/snipmate-snippets'
Bundle 'scrooloose/nerdtree'

"POWERLINE configuration

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"NERDTREE configuration

map <F2> :NERDTreeToggle<CR>

"let g:Powerline_symbols = 'fancy'

"highlight lines over 80 chars
"highlight OverLength ctermbg=black
"map <C-o> :highlight OverLength ctermbg=none ctermfg=none guibg=none
"match OverLength /\%81v.\+/

" tab navigation like firefox
":nmap <C-S-tab> :tabprevious<CR>
":nmap <C-tab> :tabnext<CR>
":map <C-S-tab> :tabprevious<CR>
":map <C-tab> :tabnext<CR>
":imap <C-S-tab> <Esc>:tabprevious<CR>i
":imap <C-tab> <Esc>:tabnext<CR>i
":nmap <C-t> :tabnew<CR>
":imap <C-t> <Esc>:tabnew<CR>
":nmap <C-w> :tabclose<CR>
":imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>
" buffer menu
:nnoremap <F5> :buffers<CR>:buffer<Space>

"avoid C-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"hex editor with C-h
map <C-h> :%!xxd
map <C-j> :%!xxd -r

" avoid having to use escape key
:imap jj <Esc>

"COLOR configuration
highlight LineNr ctermfg=grey guifg=#555555
highlight NonText           ctermfg=5   ctermbg=none    cterm=bold  guifg=#333333   guibg=#000000   gui=none
highlight PreProc	guifg=#ffffff	guibg=#005555	gui=bold

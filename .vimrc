"GENERAL configuration

"set t_Co=16
syntax on
set background=dark
set autoindent
"set number
set wrap
set linebreak
"set tabs to insert 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
"view cursor at beginning of tab in normal mode
set list lcs=tab:\ \ 
set backspace=indent,eol,start
"filetype plugin on
filetype off
set nocompatible
"pasting on osx
set clipboard=unnamed
"statusline
set colorcolumn=100

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



set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tikhomirov/vim-glsl'
Bundle 'chemzqm/vim-jsx-improve'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Quramy/tsuquyomi'
Bundle 'evidens/vim-twig'
Bundle 'jwalton512/vim-blade'
Bundle 'jparise/vim-graphql'
Bundle 'dense-analysis/ale'
Bundle 'udalov/kotlin-vim'
Bundle 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Bundle 'jxnblk/vim-mdx-js'
Bundle 'leafgarland/typescript-vim'
Bundle 'peitalin/vim-jsx-typescript'


call vundle#end()
colorscheme solarized
syntax enable
filetype plugin indent on

let g:jsx_ext_required = 0

"highlight lines over 80 chars
"highlight OverLength ctermbg=black
"map <C-o> :highlight OverLength ctermbg=none ctermfg=none guibg=none
"match OverLength /\%81v.\+/

" buffer menu
nnoremap <F5> :buffers<CR>:buffer<Space>

"avoid C-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"hex editor with C-h
map <C-h> :%!xxd
map <C-j> :%!xxd -r

map <C-t> :ALEToggle<CR>
autocmd BufEnter *.php ALEDisable

"highlight non-breaking space
au VimEnter,BufWinEnter * syn match ErrorMsg " "

" avoid having to use escape key
imap jj <Esc>
imap jk <Esc>

" set j and k to move around rows, not lines
nmap j gj
nmap k gk

"COLOR configuration
highlight LineNr ctermfg=grey guifg=#555555
highlight NonText           ctermfg=5   ctermbg=none    cterm=bold  guifg=#333333   guibg=#000000   gui=none
highlight PreProc	guifg=#ffffff	guibg=#005555	gui=bold

" set proper search
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

"helps for javadoc-style comments
set formatoptions+=rco

"syntax highlighting for .repy files
au! BufRead,BufNewFile *.repy  setfiletype repy

runtime plugin/dragvisuals.vim
vmap  <expr>  H  DVB_Drag('left')
vmap  <expr>  L  DVB_Drag('right')
vmap  <expr>  J  DVB_Drag('down')
vmap  <expr>  K  DVB_Drag('up')
vmap  <expr>  D  DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...     ##
let g:DVB_TrimWS = 1

au BufRead,BufNewFile *.less setfiletype css

" toggle numbering with control-n and control-m
nnoremap <C-n> :set nonumber <bar> :set norelativenumber<CR>
nnoremap <C-m> :set number <bar> :set relativenumber<CR>

" show char under cursor
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

command! -bar -nargs=* -range=% Interleave :<line1>,<line2>call Interleave(<f-args>)
fun! Interleave(...) range
  if a:0 == 0
    let x = 1
    let y = 1
  elseif a:0 == 1
    let x = a:1
    let y = a:1
  elseif a:0 == 2
    let x = a:1
    let y = a:2
  elseif a:0 > 2
    echohl WarningMsg
    echo "Argument Error: can have at most 2 arguments"
    echohl None
    return
  endif
  let i = a:firstline + x - 1
  let total = a:lastline - a:firstline + 1
  let j = total / (x + y) * x + a:firstline
  while j < a:lastline
    let range = y > 1 ? j . ',' . (j+y) : j
    silent exe range . 'move ' . i
    let i += y + x
    let j += y
  endwhile
endfun

highlight clear SignColumn
let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}


" new style vim 8 plugins

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
" autocmd BufRead,BufNewFile *.tsx setlocal syntax=javascript
" autocmd BufRead,BufNewFile *.ts setlocal filetype=javascript
autocmd BufRead,BufNewFile *.svelte setlocal filetype=html

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|lib|build)$',
  \ 'file': '\v\.(exe|so|dll|swp)$',
  \ }

let g:prettier#autoformat = 0
if filereadable(findfile('.prettierrc.js', '.;')) || filereadable(findfile('.prettierrc', '.;')) 
  autocmd BufWritePre *.js,*.ts,.jsx,*.json,*.css,*.scss,*.less,*.graphql,*.tsx PrettierAsync
endif

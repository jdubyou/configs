"set rtp+=/usr/local/Cellar/go/1.3/libexec/misc/vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost *.go Fmt 
execute pathogen#infect()
syntax on
filetype plugin indent on

" Jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal| g'\"" | endif
endif

" Set tab stop to 4 characters
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set expandtab
set title
set modeline
set ls=2
set number
set mouse=a
set hlsearch
" Status line settings
set ruler


"Use F2 to save a file
noremap <F2> :w<cr>

"Adds the file viewer to the left when pressing Ctrl-n
map <C-n> :NERDTreeToggle<CR>

set clipboard=unnamed
set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,eol:$
set number

syntax enable
" set background=dark
" colorscheme solarized

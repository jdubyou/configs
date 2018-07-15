" A reasonably simple vimrc for Node & Go development
" Use at your own risk, but it works
" I highly encourage to change/adapt the vimrc to your own
" needs. Add vim/bundle to the run time path for vim 

" rtp = run time path
set rtp+=~/.vim/bundle/Vundle.vim

" Required for vundle. All plugins need to exist between the call blocks
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tomasr/molokai'
call vundle#end()

" Where much of the Go magic happens. Note molokai is for the color coding
" scheme
call plug#begin()
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'fatih/molokai'
call plug#end()

autocmd BufWritePost *.go !gofmt -w %

" Jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal| g'\"" | endif
endif

"""""""""""""""""""""""""""
"     Settings            "
"                         "
"""""""""""""""""""""""""""
set nocompatible    " Enables us Vim specific features
filetype off
set showcmd         " Show me what I am typing
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set expandtab       " Expand tabs as spaces 
set title
set modeline
set ls=2            " This makes Vim show a status line even when only one window is shown.
set number          " set line numbers on
set mouse=a         " Allows copy without line numbers
set hlsearch        " Highlight my search results
set ruler           " Shows the ruler for the cursor, ie its current position with line+column and the percentage within the buffer
set backspace=indent,eol,start
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,eol:$
syntax on
filetype plugin indent on

" Enable copy
if (has('unnamedplus'))
       set clipboard^=unnamed
       set clipboard^=unnamedplus
 endif

" Colorscheme
syntax enable
set t_Co=256
let g:molokai_original = 1
set background=dark
colorscheme molokai

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" mappings
map <C-b> :GoBuild<CR>
map <C-r> :GoRun<CR>
" use leaders to start build. i.e. \b to build and \r to run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

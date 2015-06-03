if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    set title
    syntax on

    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Ubuntu\ Mono:h16
        set antialias
    endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable filetype
    filetype plugin indent on

    " For all text files set 'textwidth' to 79 characters.
    autocmd FileType text setlocal textwidth=79

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif " has("autocmd")

" Inject pathogen manager
execute pathogen#infect()

" Initial setup
set nocompatible
set encoding=utf-8 nobomb
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

" always set autoindenting on
set autoindent

" Round indent
set shiftround

" Set numbering
set number
set relativenumber

" Set style for tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Insure end of line
set eol

" Better cmd autocomplete
set wildmenu

" Show where cursor is
set cursorline
set ruler

" Remember commands
set history=1000
set showcmd

" Search
set hlsearch!
set incsearch

" Color
color molokai
let g:rehash256 = 1

" Auto read file and change directory
set autoread
set autochdir

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Always show status
set laststatus=2

" Better wrapping
set wrap linebreak
set showbreak=" "

" NerdTree
map <Leader>k :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_max=250
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''

" Gondo
nnoremap <F5> :GundoToggle<CR>

" Configuration for SuperTab
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
"let g:SuperTabDefaultCompletionType = "context"

" Key bindings
noremap <up> ddkP
noremap <down> ddp
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprevious<CR>
inoremap <C-Tab> <ESC>:tabnext<CR>
inoremap <C-S-Tab> <ESC>:tabprevious<CR>
vnoremap <C-Tab> :tabnext<CR>
vnoremap <C-S-Tab> :tabprevious<CR>

nnoremap Y y$
nnoremap <F3> :set hlsearch!<CR>

noremap j gj
noremap k gk

vnoremap < <gv
vnoremap > >gv

" Easy pasting
vnoremap <C-c> "*y
vnoremap <C-x> "*x
nnoremap <C-v> "*gp

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


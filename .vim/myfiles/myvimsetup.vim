" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Setting up font for different guis
if &t_Co > 2 || has("gui_running")
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

" Initial setup
set nocompatible
set modifiable

" Display
set title
set encoding=utf-8 nobomb
set showcmd
set showmode
set showmatch
set cursorline
set ruler

" Set numbering
set number

" Enable filetype, syntax and autocomplete
syntax off
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set complete-=i

" always set autoindenting on
set autoindent

" Round indent
set shiftround

" Set style for tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

" Insure end of line
set eol

" Better cmd autocomplete
set wildmenu
set wildmode=list:full
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set completeopt=longest,menu,preview

" Remember commands
set history=1000

" Undo
set undolevels=1000

" Search
set hlsearch!
set incsearch
set ignorecase
set smartcase

" Color
color molokai
let g:rehash256 = 1
set t_Co=256

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

" Textwidth
set textwidth=80

" TTY behavior
set ttyfast

" Timeout
set ttimeout
set ttimeoutlen=100

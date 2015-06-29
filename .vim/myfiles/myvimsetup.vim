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
    " Enable omni completion
    "set omnifunc=syntaxcomplete#Complete
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

" Undo
set undolevels=1000

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

" Windows setup...
set shellslash


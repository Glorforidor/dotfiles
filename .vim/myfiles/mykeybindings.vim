" Remove pesky arrow keys but keep up and down for special use
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

" Better tabs setting
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprevious<CR>
inoremap <C-Tab> <ESC>:tabnext<CR>
inoremap <C-S-Tab> <ESC>:tabprevious<CR>
vnoremap <C-Tab> :tabnext<CR>
vnoremap <C-S-Tab> :tabprevious<CR>

" Better yanking
nnoremap Y y$

" Toggle highlight search on/off
nnoremap <F3> :set hlsearch!<CR>

" Better navigation
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> $ g$

" Better indention
vnoremap < <gv
vnoremap > >gv

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Plugin bindings

" jedi-vim keybindings
augroup python
    autocmd!
    autocmd FileType python nnoremap <silent> <buffer> <F2> :call jedi#rename()<CR>
augroup END

" Vim-Go keybindings
augroup go
    autocmd!
    autocmd FileType go nnoremap <silent> <buffer> <leader>gr :GoRun<CR>
    autocmd FileType go nnoremap <silent> <buffer> <leader>gb :GoBuild<CR>
    autocmd FileType go nnoremap <silent> <buffer> <leader>gv :GoVet<CR>
    autocmd FileType go nnoremap <silent> <buffer> <leader>gt :GoTest<CR>
    autocmd FileType go nnoremap <silent> <buffer> <leader>gtf :GoTestFunc<CR>
    autocmd FileType go nnoremap <silent> <buffer> <leader>r :GoRename<CR>
    autocmd FileType go nnoremap <silent> <buffer> <F2> :GoRename<CR>
augroup END

" FZF
nmap <leader>f :Files<cr>
nmap <leader>gf :GF<cr>

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" NerdTree
" stolen from the vim conf ! :D
nnoremap <expr> <leader>k g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<cr>'

" Tagbar
noremap <Leader>t :TagbarToggle<CR>

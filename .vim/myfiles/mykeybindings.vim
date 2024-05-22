vim9script

# Remove pesky arrow keys but keep up and down for special use
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

# Better tabs setting
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprevious<CR>
inoremap <C-Tab> <ESC>:tabnext<CR>
inoremap <C-S-Tab> <ESC>:tabprevious<CR>
vnoremap <C-Tab> :tabnext<CR>
vnoremap <C-S-Tab> :tabprevious<CR>

# Better yanking
nnoremap Y y$

# Toggle highlight search on/off
nnoremap <silent> <F3> :set hlsearch!<CR>
# Better navigation when wrapping
var wrapenabled = 0
def ToggleWrap()
  set wrap nolist
  if wrapenabled
    set nolinebreak
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    wrapenabled = 0
  else
    set linebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    wrapenabled = 1
  endif
enddef
nnoremap <F4> <scriptcmd>ToggleWrap()<CR>

# Better indention
vnoremap < <gv
vnoremap > >gv

# Don't use Ex mode, use Q for formatting
map Q gq

# CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
# so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

# Plugin bindings

# jedi-vim keybindings
augroup PYTHON
    autocmd!
    autocmd FileType python nnoremap <silent> <buffer> <F2> :call jedi#rename()<CR>
augroup END

# Vim-Go keybindings
augroup GO
    autocmd!
    autocmd FileType go nnoremap <silent> <buffer> <leader>gr <Plug>(go-run)
    autocmd FileType go nnoremap <silent> <buffer> <leader>gb <Plug>(go-build)
    autocmd FileType go nnoremap <silent> <buffer> <leader>gv <Plug>(go-vet)
    autocmd FileType go nnoremap <silent> <buffer> <leader>gt <Plug>(go-test)
    autocmd FileType go nnoremap <silent> <buffer> <leader>gtf <Plug>(go-test-func)
    autocmd FileType go nnoremap <silent> <buffer> <leader>r <Plug>(go-rename)
    autocmd FileType go nnoremap <silent> <buffer> <F2> <Plug>(go-rename)
augroup END

# FZF
nnoremap <leader>gf :GF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>

# FZF anf Fugitive <3
nnoremap <expr> <leader>a g:FugitiveIsGitDir() ? ':Gcd <BAR> RG<SPACE>' : ':RG<Space>'
nnoremap <expr> <leader>f g:FugitiveIsGitDir() ? ':Gcd <BAR> Files<CR>' : ':Files<CR>'

# Undotree
nnoremap <F5> :UndotreeToggle<CR>

# NerdTree
# stolen from the vim conf ! :D
nnoremap <expr> <leader>k g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

# Tagbar
noremap <leader>t :TagbarToggle<CR>

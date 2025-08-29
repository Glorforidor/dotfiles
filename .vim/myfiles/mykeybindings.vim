vim9script

###############################################################################
#                            General key bindings                             #
###############################################################################


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

###############################################################################
#                             Plugin key bindings                             #
###############################################################################

###############################################################################
#                                  jedi-vim                                   #
###############################################################################

augroup PYTHON
    autocmd!
    autocmd FileType python nnoremap <silent> <buffer> <F2> :call jedi#rename()<CR>
augroup END

###############################################################################
#                                   vim-Go                                    #
###############################################################################

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

###############################################################################
#                                     ALE                                     #
###############################################################################

# Lua

augroup LUA
    autocmd!
    autocmd filetype lua nnoremap K <Plug>(ale_hover)
augroup END

# Elixir
# augroup ELIXIR
#     autocmd!
#     autocmd FileType elixir nnoremap <silent> <buffer> K <Plug>(ale_hover)
#     autocmd FileType elixir nnoremap <silent> <buffer> <F2> :ALERename<CR>
#     autocmd FileType elixir nnoremap <silent> <buffer> gd <Plug>(ale_go_to_definition)
#     autocmd FileType elixir nnoremap <silent> <buffer> gt <Plug>(ale_go_to_type_definition)
#     autocmd FileType elixir nnoremap <silent> <buffer> gi <Plug>(ale_go_to_implementation)
# augroup END

# Odin
augroup ODIN
    autocmd!
    autocmd FileType odin nnoremap <silent> <buffer> K <Plug>(ale_hover)
    autocmd FileType odin nnoremap <silent> <buffer> gd <Plug>(ale_go_to_definition)
    autocmd FileType odin nnoremap <silent> <buffer> gt <Plug>(ale_go_to_type_definition)
    autocmd FileType odin nnoremap <silent> <buffer> gi <Plug>(ale_go_to_implementation)
    autocmd FileType odin nnoremap <silent> <buffer> <leader>r :ALERename<CR>
    autocmd FileType odin nnoremap <silent> <buffer> <F2> :ALERename<CR>
augroup END

# Zig
augroup ZIG
    autocmd!
    autocmd FileType zig inoremap <silent> <buffer> <C-X><C-O> <Plug>(ale_complete)
    autocmd FileType zig nnoremap <silent> <buffer> <S-K> <Plug>(ale_hover)
    autocmd FileType zig nnoremap <silent> <buffer> gd <Plug>(ale_go_to_definition)
    autocmd FileType zig nnoremap <silent> <buffer> <leader>r :ALERename<CR>
    autocmd FileType zig nnoremap <silent> <buffer> <F2> :ALERename<CR>
augroup END

###############################################################################
#                                   vim-lsp                                   #
###############################################################################

augroup ELIXIR
    autocmd!
    autocmd FileType elixir nnoremap <silent> <buffer> K <Plug>(lsp-hover)
    autocmd FileType elixir nnoremap <silent> <buffer> <leader>r <Plug>(lsp-rename)
    autocmd FileType elixir nnoremap <silent> <buffer> gr <Plug>(lsp-references)
    autocmd FileType elixir nnoremap <silent> <buffer> gd <Plug>(lsp-definition)
    autocmd FileType elixir nnoremap <silent> <buffer> gt <Plug>(lsp-type-definition)
    autocmd FileType elixir nnoremap <silent> <buffer> gi <Plug>(lsp-implementation)
    autocmd FileType elixir nnoremap <silent> <buffer> <expr><c-j> lsp#scroll(+4)
    autocmd FileType elixir nnoremap <silent> <buffer> <expr><c-k> lsp#scroll(-4)
augroup END

###############################################################################
#                                   Merlin                                    #
###############################################################################

augroup OCAMLBINDINGS
    autocmd!
    # O binding my Caml
    autocmd FileType ocaml nnoremap <silent> <buffer> <leader>r <Plug>(MerlinRename)
    autocmd FileType ocaml nnoremap <silent> <buffer> <F2> <Plug>(MerlinRename)
    autocmd FileType ocaml nnoremap <silent> <buffer> <leader>R <Plug>(MerlinRenameAppend)
    autocmd Filetype ocaml nnoremap <silent> <buffer> <leader>* <Plug>(MerlinSearchOccurrencesForward)
    autocmd Filetype ocaml nnoremap <silent> <buffer> <leader># <Plug>(MerlinSearchOccurrencesBackward)
    autocmd FileType ocaml nnoremap <silent> <buffer> K :MerlinDocument<CR>
    autocmd FileType ocaml nnoremap <silent> <buffer> <leader>db :execute 'terminal ++close dune build' \| wincmd p<CR>
    autocmd FileType ocaml nnoremap <silent> <buffer> <leader>dt :execute 'terminal ++close dune test --auto' \| wincmd p \| edit!<CR>
    autocmd FileType ocaml nnoremap <silent> <buffer> <leader>df :execute 'terminal ++close dune fmt --auto' \| wincmd p \| edit!<CR>
augroup END

###############################################################################
#                                     FZF                                     #
###############################################################################

nnoremap <leader>gf :GF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>

# FZF and Fugitive <3
nnoremap <expr> <leader>a g:FugitiveIsGitDir() ? ':Gcd <BAR> RG<SPACE>' : ':RG<Space>'
nnoremap <expr> <leader>f g:FugitiveIsGitDir() ? ':Gcd <BAR> Files<CR>' : ':Files<CR>'

###############################################################################
#                                  Undotree                                   #
###############################################################################

nnoremap <F5> :UndotreeToggle<CR>

###############################################################################
#                                  Nerdtree                                   #
###############################################################################

# Stolen from the vim conf ! :D
nnoremap <expr> <leader>k g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

###############################################################################
#                                   Tagbar                                    #
###############################################################################

noremap <leader>t :TagbarToggle<CR>

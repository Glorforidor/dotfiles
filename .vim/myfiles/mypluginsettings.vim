" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" jedi-vim
let g:jedi#completions_command = ''
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
let g:jedi#auto_close_doc = 0
let g:jedi#force_py_version = 3

" jedi-vim keybindings
autocmd FileType python noremap <silent> <buffer> <F2> :call jedi#rename()<cr>

" NerdTree
" stolen from the vim conf ! :D
nnoremap <expr> <leader>k g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<cr>'

" rust.vim
let g:rustfmt_autosave = 1

" Syntastic
let g:syntastic_python_python_exec = '/usr/bin/env python3'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar
map <Leader>t :TagbarToggle<CR>

" Vim-Go
" turn of source proposel, since it is slowing down autocomplete
let g:go_gocode_propose_source = 0
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_metalinter_command = 'gopls' " golangci-lint
let g:go_gopls_staticcheck = 1
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_doc_popup_window = 1
let g:go_list_type = 'quickfix'
let g:go_debug_windows = { 'vars': 'rightbelow 60vnew', 'stack': 'rightbelow 10new', }
let g:go_term_enabled = 1
let g:go_term_reuse = 1

" Vim-Go keybindings
autocmd FileType go noremap <silent> <buffer> <localleader>r :GoRename<cr>
autocmd FileType go noremap <silent> <buffer> <F2> :GoRename<cr>

" Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'golangci_lint']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'tex'] }

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" Vimtex
let g:vimtex_quickfix_open_on_warning = 0

" FZF
nmap <leader>f :Files<cr>
nmap <leader>gf :GF<cr>

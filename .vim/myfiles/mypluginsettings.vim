" Goyo and Limelight
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

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

" Syntastic
let g:syntastic_python_python_exec = '/usr/bin/python3'

" Vim-Go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
" Vim-Go fixes with Syntastic 
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

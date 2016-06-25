" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_max=250
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0

" Goyo and Limelight
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" NerdTree
map <Leader>k :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_python_python_exec = '/usr/bin/env python3'

" Vim-Go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
" Vim-Go fixes with Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

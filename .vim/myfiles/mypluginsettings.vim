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


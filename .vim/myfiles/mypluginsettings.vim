" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
colorscheme monochrome

" Goyo and Limelight
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" jedi-vim
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "0"
let g:jedi#popup_on_dot = 0
let g:jedi#auto_close_doc = 0
let g:jedi#force_py_version=3

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

" NerdTree
map <Leader>k :NERDTreeToggle<CR>

" rust.vim
let g:rustfmt_autosave = 1

" Syntastic
let g:syntastic_python_python_exec = '/usr/bin/env python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar
map <Leader>t :TagbarToggle<CR>

" Vim-Go
" turn of source proposel, since it is slowing down autocomplete
let g:go_gocode_propose_source = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1

" Vim-Go fixes with Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" Vim-racer
let g:racer_cmd="/home/pbj/.cargo/bin/racer"
let $RUST_SRC_PATH="/home/pbj/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

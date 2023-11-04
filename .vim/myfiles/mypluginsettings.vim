vim9script

# Airline
g:airline_left_sep = ''
g:airline_right_sep = ''
# Let airline show information about mode
set noshowmode

# Goyo and Limelight
augroup GOYO
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END
g:limelight_conceal_ctermfg = 'gray'
g:limelight_conceal_ctermfg = 240

# jedi-vim
g:jedi#completions_command = ''
g:jedi#show_call_signatures = 0
g:jedi#popup_on_dot = 0
g:jedi#auto_close_doc = 0
g:jedi#force_py_version = 3

# rust.vim
g:rustfmt_autosave = 1

# Vim-Go
# turn of source proposel, since it is slowing down autocomplete
g:go_gocode_propose_source = 0
g:go_def_mode = 'gopls'
g:go_info_mode = 'gopls'
g:go_rename_command = 'gopls'
g:go_metalinter_command = 'golangci-lint' # golangci-lint
g:go_gopls_staticcheck = 1
g:go_auto_type_info = 1
g:go_highlight_functions = 1
g:go_highlight_methods = 1
g:go_highlight_structs = 1
g:go_highlight_fields = 1
g:go_highlight_interfaces = 1
g:go_highlight_operators = 0
g:go_highlight_build_constraints = 1
g:go_doc_popup_window = 0
g:go_list_type = 'quickfix'
g:go_debug_windows = { 'vars': 'rightbelow 60vnew', 'stack': 'rightbelow 10new', }
g:go_term_enabled = 1
g:go_term_reuse = 1

# Vimtex
g:vimtex_quickfix_open_on_warning = 0

# Ale
# For go files disable the lsp feature in ale and let vim-go do this.
augroup ALE
    autocmd!
    autocmd filetype go g:ale_go_golangci_lint_package = 1
    autocmd filetype go g:ale_disable_lsp = 1
augroup END

# wiki.vim
g:wiki_root = '~/wiki'

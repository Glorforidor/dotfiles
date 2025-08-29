vim9script

###############################################################################
#                                   Airline                                   #
###############################################################################

g:airline_left_sep = ''
g:airline_right_sep = ''
# Let airline show information about mode
set noshowmode

g:fzf_colors = {
    'fg':         ['fg', 'Normal'],
    'preview-fg': ['fg', 'Normal'],
    'bg':         ['bg', 'Normal'],
    'preview-bg': ['bg', 'Normal'],
    'query':      ['fg', 'Normal'],
    'hl':         ['fg', 'Comment'],
    'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
    'hl+':        ['fg', 'Statement'],
    'info':       ['fg', 'PreProc'],
    'border':     ['fg', 'Ignore'],
    'prompt':     ['fg', 'Conditional'],
    'pointer':    ['fg', 'Exception'],
    'marker':     ['fg', 'Keyword'],
    'spinner':    ['fg', 'Label'],
    'header':     ['fg', 'Comment'],
}

$BAT_THEME = 'gruvbox-dark'

###############################################################################
#                                    GoYo                                     #
###############################################################################

augroup GOYO
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END
g:limelight_conceal_ctermfg = 'gray'
g:limelight_conceal_ctermfg = 240

###############################################################################
#                                  jedi-vim                                   #
###############################################################################

g:jedi#completions_command = ''
g:jedi#show_call_signatures = 0
g:jedi#popup_on_dot = 0
g:jedi#auto_close_doc = 0
g:jedi#force_py_version = 3

###############################################################################
#                                  rust.vim                                   #
###############################################################################

g:rustfmt_autosave = 1

###############################################################################
#                                   vim-go                                    #
###############################################################################

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

###############################################################################
#                                   vimtex                                    #
###############################################################################

g:vimtex_quickfix_open_on_warning = 0

###############################################################################
#                                vim-dispatch                                 #
###############################################################################

g:dispatch_no_tmux_make = 1
g:dispatch_no_tmux_start = 1

###############################################################################
#                                     ALE                                     #
###############################################################################

# For go files disable the lsp feature in ale and let vim-go do this.
augroup ALE
    autocmd!

    # For go files disable the lsp feature in ale and let vim-go do this.
    autocmd FileType go b:ale_go_golangci_lint_package = 1
    autocmd FileType go b:ale_disable_lsp = 1

    autocmd FileType lua b:ale_hover_to_floating_preview = 1

    # autocmd FileType elixir g:ale_elixir_elixir_ls_release = expand('~/src/elixir-ls/rel')
    # autocmd FileType elixir g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}
    # autocmd FileType elixir b:ale_set_balloons = has('gui_running') ? 'hover' : 0

    autocmd FileType elixir b:ale_enabled = 0
    autocmd FileType elixir GoToRoot()

    # autocmd FileType elixir,lua,odin set omnifunc=ale#completion#OmniFunc
    # autocmd FileType elixir,lua,odin b:ale_completion_enabled = 1

    autocmd FileType lua,odin set omnifunc=ale#completion#OmniFunc
    autocmd FileType lua,odin b:ale_completion_enabled = 1
augroup END

def GoToRoot()
    # If the below git command fails then we are not in a git repository.
    system("git rev-parse --is-inside-work-tree")
    if v:shell_error == 0
        var git_root = system("git rev-parse --show-toplevel")[ : -2]

        execute 'cd' git_root
    endif
enddef

g:ale_linters = {
    'elixir': [ 'elixir-ls' ],
    'ocaml': [ 'merlin', 'ocamllsp' ],
}

def g:FormatOdin(buffer: any): dict<any>
    return {
        'command': 'odinfmt -stdin'
    }
enddef

call ale#fix#registry#Add(
    'odinfmt',
    'FormatOdin',
    ['odin'],
    'odinfmt for odin',
)

g:ale_fixers = {
    'lua': [ 'stylua' ],
    'zig': [
        'zigfmt',
        'remove_trailing_lines',
        'trim_whitespace',
    ],
    'elixir': [
        'mix_format',
        'remove_trailing_lines',
        'trim_whitespace',
    ],
    'ocaml': [
        'ocamlformat',
        'remove_trailing_lines',
        'trim_whitespace',
    ],
    'odin': [
        'odinfmt',
        'remove_trailing_lines',
        'trim_whitespace',
    ],
}
g:ale_fix_on_save = 1

###############################################################################
#                                   vim-lsp                                   #
###############################################################################

g:lsp_document_code_action_signs_enabled = 0
g:lsp_format_sync_timeout = 1000
g:lsp_hover_ui = "preview"
g:lsp_inlay_hints_enabled = 1
g:lsp_use_native_client = 1

if executable("elixir")
    augroup LSP_EXPERT
        autocmd!
        autocmd User lsp_setup call lsp#register_server({ name: "expert", cmd: (server_info) => expand("~/.local/bin/expert_linux_amd64"), allowlist: ["elixir", "eelixir"] })
        autocmd FileType elixir,eelixir setlocal omnifunc=lsp#complete

        autocmd! BufWritePre *.ex,*.exs,*.heex call execute('LspDocumentFormatSync')
    augroup END
endif

###############################################################################
#                                   Merlin                                    #
###############################################################################

augroup OCAML
    autocmd!
    autocmd FileType ocaml setlocal balloonexpr=merlin#TypeAtBalloon()
augroup END

###############################################################################
#                                  wiki.vim                                   #
###############################################################################

g:wiki_root = '~/wiki'

###############################################################################
#                                   Puppet                                    #
###############################################################################

augroup PUPPET
    autocmd!
    autocmd BufNewFile,BufRead *.pp set filetype=puppet
augroup END

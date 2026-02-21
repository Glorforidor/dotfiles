-----------------
-- Convenience --
-----------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-------------
-- PLUGINS --
-------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Setup below is copied from Fatih, so thanks for your great work!

require("lazy").setup(
{
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000
    },
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                lastplace_open_folds = true
            })
        end,
    },
    {
        -- Just simply da best
        "mbbill/undotree",
    },
    {
        -- Commenting out lines
        "tpope/vim-commentary",
    },
    {
        -- Best Git client ever!
        "tpope/vim-fugitive",
    },
    {
        "tpope/vim-rhubarb",
    },
    {
        "tpope/vim-surround",
    },
    {
        "tpope/vim-repeat",
    },
    {
        "tpope/vim-speeddating",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim", build = "make",
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "rodjek/vim-puppet"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim" ,
            "nvim-treesitter/nvim-treesitter",
        },
        config = function ()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                },
            })

            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("fzf")

            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install {
                "go",
                "gomod",
                "lua",
                "ruby",
                "vimdoc",
                "vim",
                "elixir",
                "heex",
                "bash",
                "puppet",
                "markdown",
                "markdown_inline",
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "j-hui/fidget.nvim", opts = {} },

            -- Autoformatting
            "stevearc/conform.nvim",

            -- Schema information
            "b0o/SchemaStore.nvim",
        },
        config = function ()
            local capabilities = nil
            if pcall(require, "cmp_nvim_lsp") then
                local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
                capabilities.textDocument.completion.completionItem.snippetSupport = true
            end

            local servers = {
                gopls = {
                    usePlaceholders = true,
                    gofumpt = true,
                    analyses = {
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    experimentalPostfixCompletions = true,
                    completeUnimported = true,
                    staticcheck = true,
                    directoryFilters = { "-.git", "-node_modules" },
                    semanticTokens = true,
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
                lua_ls = true,
                expert = {
                    cmd = { 'expert', '--stdio' },
                    root_markers = { 'mix.exs', '.git' },
                    filetypes = { 'elixir', 'eelixir', 'heex' },
                },
            }

            local servers_to_install = vim.tbl_filter(function(key)
                local t = servers[key]
                if type(t) == "table" then
                    return not t.manual_install
                else
                    return t
                end
            end, vim.tbl_keys(servers))

            require("mason").setup()
            local ensure_installed = {
                "stylua",
                "lua_ls",
                -- "delve",
            }

            vim.list_extend(ensure_installed, servers_to_install)
            require("mason-tool-installer").setup {
                ensure_installed = ensure_installed
            }

            vim.lsp.config("*", {
                capabilities = capabilities
            })

            for name, config in pairs(servers) do
                if config == true then
                    config = {}
                end

                if next(config) ~= nil then
                    local lsp_config = vim.tbl_deep_extend("force", {}, config)
                    lsp_config.manual_install = nil
                    vim.lsp.config(name, config)
                end

                vim.lsp.enable(name)
            end
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                gorup_index = 0,
            })
        end,
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            luasnip.config.setup {}

            require("cmp").setup.cmdline(":", {
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },
})

--------------------------
-- Key maps for Plugins --
--------------------------

-- Better leader
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Undotree
vim.keymap.set("n", "<F5>", "<cmd>UndotreeToggle<cr>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>td", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>a", builtin.live_grep, {})

-- diagnostics
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ds", vim.diagnostic.setqflist)

-- disable diagnostics, I didn't like them
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- Go uses gofmt, which uses tabs for indentation and spaces for aligment.
-- Hence override our indentation rules.
autocmd("FileType", {
    group = augroup("setIndent", { clear = true }),
    pattern = { "go" },
    -- command = "setlocal noexpandtab tabstop=4 shiftwidth=4",
    callback = function()
        vim.treesitter.start()
    end,
})

autocmd("FileType", {
    pattern = { "elixir", "eelixir", "heex" },
    callback = function()
        vim.treesitter.start()
    end,
})

-- Run gofmt/gofmpt, import packages automatically on save
autocmd("BufWritePre", {
    group = augroup("setGoFormatting", { clear = true }),
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true, async = false })
        vim.lsp.buf.format({ async = true })
    end
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
autocmd("LspAttach", {
    group = augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        -- If there is a LSP for the buffer, then use that for omnifunc
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})

autocmd("LspDetach", {
    callback = function(args)
    end
})

-----------
-- SETUP --
-----------

-- Lets modify
vim.opt.modifiable = true

vim.opt.omnifunc = "syntaxcomplete#Complete"

-- Filetype, Syntax, and autocomplete
vim.opt.syntax = "on"
vim.cmd("filetype plugin indent on")
vim.opt.complete = { ".", "w", "b", "u", "t" }
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Better stronger .. CMD?
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

-- Display whaaat?
vim.opt.title = true
vim.opt.encoding = "utf-8"
vim.opt.bomb = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.ruler = true

-- Colour
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("catppuccin")

-- Da indent auto
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Round about
vim.opt.shiftround = true

-- MaTab and MaSpaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

-- Is this the END?
vim.opt.eol = true

-- Oh my history
vim.opt.history = 10000

-- Undo me daddy
vim.opt.undolevels = 1000
vim.opt.undofile = true

-- Auto read/write file and change directory
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autochdir = true

-- Make search pretty again
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scroll
vim.opt.scrolloff = 8

-- Redraw
vim.opt.lazyredraw = true
vim.opt.redrawtime = 1000

-- Split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Allow hidden buffers
vim.opt.hidden = true

-- Draw numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- No swap and backup for me
vim.opt.swapfile = false
vim.opt.backup = false

-- hmm
-- vim.opt.shortmess:append("c")

-- Update woop woop
vim.opt.updatetime = 50

-- Textwidth
vim.opt.textwidth = 79

-- Yummy! WRAP
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "> " -- MAYBE gut

-- My Baaaaaack
vim.opt.backspace = {"indent", "eol", "nostop"}

-- Show me da status
vim.opt.laststatus = 2

-- Red goes faster
vim.opt.ttyfast = true

-- Pesky spaces
vim.opt.joinspaces = false

-- You are on da bench
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- ThePrimeagen that beautiful man :D

local ThePrimeagenGroup = augroup("ThePrimeagen", {})
autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    callback = function(_)
        local current_pos = vim.api.nvim_win_get_cursor(0)
        local current_win = vim.api.nvim_get_current_win()
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(current_win, current_pos)
    end,
})

-- NETRW

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

------------------------------
-- LET THERE BE KEYBINDINGS --
------------------------------

-- Better Yank
vim.keymap.set("n", "Y", "y$")

-- No more arrow keys :O
vim.keymap.set("n", "<up>", "ddkP")
vim.keymap.set("n", "<down>", "ddp")
vim.keymap.set({"n", "i", "v"}, "<left>", "<Nop>")
vim.keymap.set({"n", "i", "v"}, "<right>", "<Nop>")
vim.keymap.set({"i", "v"}, "<up>", "<Nop>")
vim.keymap.set({"i", "v"}, "<down>", "<Nop>")

-- Better tabs .. sometimes we use tabs...
vim.keymap.set({"n", "v"}, "<c-tab>", "<cmd>tabnext<cr>", { silent = true})
vim.keymap.set({"i"}, "<c-tab>", "<esc><cmd>tabnext<cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<c-s-tab>", "<cmd>tabprevious<cr>", { silent = true})

vim.keymap.set("n", "<leader>pv", "<cmd>edit .<cr>")
vim.keymap.set("n", "<F3>", "<cmd>set hlsearch!<cr>", { silent = true})

local wrap_enabled = false
local function toggle_wrap()
    vim.opt.wrap = true
    vim.opt.list = false

    if wrap_enabled then
        vim.opt.linebreak = false
        vim.keymap.del({"n", "v"}, "j")
        vim.keymap.del({"n", "v"}, "k")
        vim.keymap.del({"n", "v"}, "0")
        vim.keymap.del({"n", "v"}, "^")
        vim.keymap.del({"n", "v"}, "$")
        wrap_enabled = false
    else
        vim.opt.linebreak = true
        vim.keymap.set({"n", "v"}, "j", "gj")
        vim.keymap.set({"n", "v"}, "k", "gk")
        vim.keymap.set({"n", "v"}, "0", "g0")
        vim.keymap.set({"n", "v"}, "^", "g^")
        vim.keymap.set({"n", "v"}, "$", "g$")
        wrap_enabled = true
    end
end

vim.keymap.set("n", "<F4>", toggle_wrap)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- so that you can undo CTRL-U after inserting a line break.
vim.keymap.set("i", "<c-u>", "<c-g>u<c-u>")

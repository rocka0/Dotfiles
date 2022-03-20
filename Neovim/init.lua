-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]]

local use = require("packer").use
require("packer").startup(
    function()
        use "wbthomason/packer.nvim" -- Package manager
        use "tpope/vim-fugitive" -- Git commands in nvim
        use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
        use "numToStr/Comment.nvim" -- "gc" to comment visual regions/lines
        use "ludovicchabant/vim-gutentags" -- Automatic tags management
        -- UI to select things (files, grep results, open buffers...)
        use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        use "navarasu/onedark.nvim"
        use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
        -- Add indentation guides even on blank lines
        use "lukas-reineke/indent-blankline.nvim"
        -- Add git related info in the signs columns and popups
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
        -- Highlight, edit, and navigate code using a fast incremental parsing library
        use "nvim-treesitter/nvim-treesitter"
        -- Additional textobjects for treesitter
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp"
        use "saadparwaiz1/cmp_luasnip"
        use "L3MON4D3/LuaSnip" -- Snippets plugin
        use "jiangmiao/auto-pairs" -- Bracket Autocomplete
    end
)

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme
vim.o.termguicolors = true
require("onedark").setup {
    style = "warmer"
}
require("onedark").load()

--Gutentags config
vim.g.gutentags_cache_dir = "~/.cache/nvim/ctags/"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

--Set statusbar
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "onedark",
        component_separators = "|",
        section_separators = ""
    }
}
function foo() print(1) end
--Enable Comment.nvim
require("Comment").setup()

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = {"help", "packer"}
vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require("gitsigns").setup {
    signs = {
        add = {text = "+"},
        change = {text = "~"},
        delete = {text = "_"},
        topdelete = {text = "‾"},
        changedelete = {text = "~"}
    }
}

-- Telescope
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
            }
        }
    }
}

-- Enable telescope fzf native
require("telescope").load_extension "fzf"

--Add leader shortcuts
vim.api.nvim_set_keymap(
    "n",
    "<leader><space>",
    [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sf",
    [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sb",
    [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sh",
    [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>st",
    [[<cmd>lua require('telescope.builtin').tags()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sd",
    [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sp",
    [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>so",
    [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>?",
    [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
    {noremap = true, silent = true}
)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    indent = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        }
    }
}

-- Diagnostic keymaps
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true, silent = true})

-- LSP settings
local lspconfig = require "lspconfig"
local on_attach = function(_, bufnr)
    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>so",
        [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
        opts
    )
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable the following language servers
lspconfig.clangd.setup {
    -- format on save
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
    end,
    capabilities = capabilities,
    cmd = {"clangd", "--header-insertion=never", "--background-index"}
}
lspconfig.pyright.setup {
    on_attach = attach,
    capabilities = capabilities
}

-- luasnip setup
local luasnip = require "luasnip"

-- luasnip configuration
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local p = require("luasnip.extras").partial

luasnip.snippets = {
    cpp = {
        s(
            "CPP",
            {
                t({"/**", " *\tauthor:\t\ttctlh", " *\tcreated:\t"}),
                p(os.date, "%d.%m.%Y %H:%M:%S"),
                t({"", "**/", "", ""}),
                t(
                    {
                        "#ifdef LOCAL",
                        '#include "tlh.hpp"',
                        "#else",
                        "#include <bits/stdc++.h>",
                        "using namespace std;",
                        "#define debug(...) 14122021",
                        "#endif",
                        "",
                        "template <typename T>",
                        "bool chmax(T &x, T y) {",
                        "return x < y and (x = y, true);",
                        "}",
                        "template <typename T>",
                        "bool chmin(T &x, T y) {",
                        "return x > y and (x = y, true);",
                        "}",
                        "",
                        "int main() {",
                        "\tios::sync_with_stdio(false);",
                        "\tcin.tie(0);",
                        "",
                        "\t"
                    }
                ),
                i(0),
                t(
                    {
                        "",
                        "}",
                        ""
                    }
                )
            }
        )
    }
}

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "luasnip"}
    }
}

-- Set Tab Options
vim.opt.ts = 2
vim.opt.sts = 2
vim.opt.sw = 2

-- Set clipboard to unnamed plus
vim.cmd "set clipboard+=unnamedplus"

-- Set Ctrl-s as save
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", {noremap = true, silent = true})

-- Set Ctrl-b as build
vim.cmd "autocmd filetype cpp nnoremap <C-b> :w <bar> !./compile %:r && ./%:r < in && rm ./%:r <CR>"
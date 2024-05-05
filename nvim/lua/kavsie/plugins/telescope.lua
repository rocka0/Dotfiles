return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                vimgrep_arguments = {
                    'rg',
                    '-L',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                },
                prompt_prefix = '   ',
                selection_caret = '  ',
                entry_prefix = '  ',
                initial_mode = 'insert',
                selection_strategy = 'reset',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                file_sorter = require('telescope.sorters').get_fuzzy_file,
                file_ignore_patterns = { 'node_modules' },
                generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
                path_display = { 'truncate' },
                winblend = 0,
                border = {},
                borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                color_devicons = true,
                set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
                buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
            },
        })
        pcall(require('telescope').load_extension, 'fzf')

        local builtin = require('telescope.builtin')
        local map = require('kavsie.core.utils').map

        map('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
        map('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = '[F]ind in [C]urrent buffer' })
        map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
        map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
    end,
}

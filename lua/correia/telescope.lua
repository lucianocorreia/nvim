local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions


telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

telescope.load_extension("file_browser")
telescope.load_extension('projects')

vim.keymap.set('n', '<Leader>f',
    function()
        builtin.find_files({
            -- no_ignore = true,
            -- hidden = false,
            file_ignore_patterns = { "node_modules", "vendor", ".git" },
        })
    end)

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').git_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- vim.keymap.set('n', '<Leader>s', function()
--     builtin.live_grep()
-- end)
--
-- vim.keymap.set('n', '<Leader>b', function()
--     builtin.buffers({
--         theme = "dropdown"
--     })
-- end)

-- vim.keymap.set('n', ';t', function()
--     builtin.help_tags()
-- end)

vim.keymap.set('n', '<Leader>\\', function()
    telescope.extensions.projects.projects {}
end)

vim.keymap.set('n', '<Leader>dd', function()
    builtin.diagnostics()
end)

vim.keymap.set('n', '<Leader>q', function()
    builtin.quickfix()
end)

vim.keymap.set('n', '<Leader>o', function()
    builtin.lsp_document_symbols({
        show_line = true,
        symbols = { "method", "function" }
    })
end)

vim.keymap.set('n', '<Leader>gb', function()
    builtin.git_branches({
        theme = "dropdown"
    })
end)

vim.keymap.set("n", "<Leader>p", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        -- initial_mode = "normal",
        layout_config = { height = 30 },
    })
end)

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")
vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
)

require("telescope").load_extension('harpoon')
vim.keymap.set("n", "<Leader>re", function()
    telescope.extensions.harpoon.marks({
        previewer = false,
        -- initial_mode = "normal",
        layout_config = { height = 20, width = 90 },
    })
end)

vim.keymap.set("n", "<Leader>gt", function()
    builtin.git_status({
        -- layout_config = { height = 20, width = 90 },
    })
end)

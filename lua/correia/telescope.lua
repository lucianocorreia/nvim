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

vim.keymap.set('n', '<Leader>s', function()
    builtin.live_grep()
end)

vim.keymap.set('n', '<Leader>b', function()
    builtin.buffers()
end)

-- vim.keymap.set('n', ';t', function()
--     builtin.help_tags()
-- end)

vim.keymap.set('n', '<Leader>\\', function()
    telescope.extensions.projects.projects {}
end)

vim.keymap.set('n', '<Leader>e', function()
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
    builtin.git_branches()
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

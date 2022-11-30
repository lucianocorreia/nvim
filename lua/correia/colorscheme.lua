-- require("tokyonight").setup({
--     -- use the night style
--     style = "storm",
--     -- disable italic for functions
--     styles = {
--         functions = {}
--     },
--     sidebars = { "qf", "vista_kind", "terminal", "packer" },
--     -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--     on_colors = function(colors)
--         colors.hint = colors.orange
--         colors.error = "#ff0000"
--     end
-- })
--
-- Load the colorscheme
-- vim.cmd [[colorscheme ayu]]
-- vim.cmd [[colorscheme tokyonight-night]]

--  vim.g.everforest_background = 'hard'
--  vim.g.everforest_enable_italic = 1
--  vim.g.everforest_cursor = 'purple' -- `'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
--  vim.g.everforest_sign_column_background = 'none' -- `'none'`, `'grey'`
--  vim.g.everforest_spell_foreground = 'none' --  `'none'`, `'colored'`
--  vim.g.everforest_ui_contrast = 'low' -- `'low'`, `'high'`
-- -- vim.g.everforest_colors_override = { bg0 = { '#21282c', '234' } } --{'bg0': ['#202020', '234'], 'bg2': ['#282828', '235']}
--  vim.cmd [[colorscheme everforest]]


-- Example config in lua
--vim.g.nord_contrast = true
--vim.g.nord_borders = true
--vim.g.nord_disable_background = false
--vim.g.nord_italic = true
--vim.g.nord_uniform_diff_background = true
--vim.g.nord_bold = false
--vim.cmd[[colorscheme nord]]


-- vim.cmd[[colorscheme duskfox]]



vim.cmd [[colorscheme catppuccin-mocha]]
require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            -- underlines = {
            --     errors = { "underline" },
            --     hints = { "underline" },
            --     warnings = { "underline" },
            --     information = { "underline" },
            -- },
        },
        lsp_trouble = true,
        lsp_saga = true,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        indent_blankline = { enabled = true, colored_indent_levels = false },
        dashboard = true,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        markdown = true,
        lightspeed = false,
        ts_rainbow = true,
        mason = true,
        neotest = false,
        noice = false,
        hop = true,
        illuminate = true,
        cmp = true,
        dap = { enabled = true, enable_ui = true },
        notify = true,
        symbols_outline = false,
        coc_nvim = false,
        leap = false,
        neotree = { enabled = false, show_root = true, transparent_panel = false },
        telekasten = false,
        mini = false,
        aerial = false,
        vimwiki = true,
        beacon = false,
        navic = { enabled = false },
        overseer = false,
        fidget = true,
    },
})

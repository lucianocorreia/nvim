-- require("tokyonight").setup({
--     -- use the night style
--     style = "night",
--     -- disable italic for functions
--     styles = {
--       functions = {}
--     },
--     sidebars = { "qf", "vista_kind", "terminal", "packer" },
--     -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--     on_colors = function(colors)
--       colors.hint = colors.orange
--       colors.error = "#ff0000"
--     end
-- })
--
-- Load the colorscheme
-- vim.cmd [[colorscheme ayu]]
-- vim.cmd [[colorscheme tokyonight]]
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
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
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

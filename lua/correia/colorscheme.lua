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
-- vim.cmd [[colorscheme tokyonight]]
vim.cmd [[colorscheme catppuccin]]

require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

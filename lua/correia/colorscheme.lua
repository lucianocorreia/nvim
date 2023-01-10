vim.cmd [[colorscheme catppuccin-mocha]]
require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        treesitter = true,
        treesitter_context = true,
        harpoon = true,
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
        indent_blankline = { enabled = true, colored_indent_levels = true },
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
        symbols_outline = true,
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

function ConfigRosePine()
    require('rose-pine').setup({
        --- @usage 'main' | 'moon'
        dark_variant = 'main',
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = true,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = 'base',
            panel = 'surface',
            border = 'highlight_med',
            comment = 'muted',
            link = 'iris',
            punctuation = 'subtle',

            error = 'love',
            hint = 'iris',
            info = 'foam',
            warn = 'subtle',

            headings = {
                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            }
            -- or set all headings at once
            -- headings = 'subtle'
        },

        -- Change specific vim highlight groups
        highlight_groups = {
            ColorColumn = { bg = 'rose' }
        }
    })

    -- set colorscheme after options
    vim.cmd('colorscheme rose-pine')
end

function FixColors()
    vim.g.tokyonight_transparent_sidebar = false
    vim.g.tokyonight_transparent = false
    vim.opt.background = "dark"

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end
    --
    -- hl("SignColumn", {
    --     bg = "none",
    -- })
    --
    -- hl("ColorColumn", {
    --     ctermbg = 0,
    --     bg = "#2B79A0",
    -- })
    --
    -- hl("CursorLineNR", {
    --     bg = "None"
    -- })
    --
    -- hl("Normal", {
    --     bg = "none"
    -- })

    hl("LineNr", {
        fg = "#89B4FA"
        -- fg = "#31748f"
    })

    hl("netrwDir", {
        fg = "#89B4FA"
        -- fg = "#31748f"
    })

end

ConfigRosePine()
-- FixColors()

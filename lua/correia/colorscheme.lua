function ConfigureCatppuccin()
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
    FixColors()
end

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

function ConfigureKanagawa()
    -- Default options:
    require('kanagawa').setup({
        undercurl = false, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = false },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true,    -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false,     -- do not set background color
        dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,    -- adjust window separators highlight for laststatus=3
        terminalColors = true,   -- define vim.g.terminal_color_{0,17}
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = "none"
                    }
                }
            }
        },
        -- theme = "default" -- Load "default" theme or the experimental "light" theme
        theme = "wave",    -- Load "wave" theme when 'background' option is not set
        background = {
                           -- map the value of 'background' option to a theme
            dark = "wave", -- try "dragon" !
            light = "lotus"
        },
    })

    -- setup must be called before loading
    -- vim.cmd("colorscheme kanagawa")
    require("kanagawa").load("wave")
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

function ConfigureGruvbox()
    -- setup must be called before loading the colorscheme
    -- Default options:
    require("gruvbox").setup({
        undercurl = true,
        underline = false,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    })
    vim.cmd("colorscheme gruvbox")
end

-- ConfigureCatppuccin()
-- ConfigRosePine()
ConfigureKanagawa()
-- ConfigureGruvbox()

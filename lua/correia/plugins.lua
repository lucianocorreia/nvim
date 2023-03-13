local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- PLUGINS
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- use {
    --     "catppuccin/nvim",
    --     as = "catppuccin",
    -- }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use "rebelot/kanagawa.nvim"
    use { "ellisonleao/gruvbox.nvim" }

    use "mbbill/undotree"

    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in neovim
    use 'nvim-lua/plenary.nvim' -- Useful Lua functions used by many plugins
    use 'nvim-lualine/lualine.nvim' -- lualine
    use "akinsho/bufferline.nvim" --buffer (tabs)

    --Treesitter
    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    -- use 'tree-sitter/tree-sitter-typescript'

    -- telescope
    use 'kyazdani42/nvim-web-devicons' -- icons
    use 'nvim-telescope/telescope.nvim' -- telescopr
    use 'nvim-telescope/telescope-file-browser.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")
    use("ThePrimeagen/refactoring.nvim")

    -- go lang
    use 'fatih/vim-go'

    -- Git, Comments, Autorpairs
    use "lewis6991/gitsigns.nvim" --Git indication
    use "windwp/nvim-autopairs" --autopairs
    use "numToStr/Comment.nvim"
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

    --cmp plugins
    use "hrsh7th/nvim-cmp" -- completion plugin
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- LSP completion for cmp
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "onsails/lspkind.nvim"
    use 'j-hui/fidget.nvim'
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    -- use {
    --     "SmiteshP/nvim-navic",
    --     requires = "neovim/nvim-lspconfig"
    -- }
    -- use("simrat39/rust-tools.nvim")
    -- use({
    --     "glepnir/lspsaga.nvim",
    --     branch = "main",
    --     config = function()
    --         local saga = require("lspsaga")
    --
    --         saga.init_lsp_saga({
    --             -- your configuration
    --         })
    --     end,
    -- })

    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

    --Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- many snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use "jose-elias-alvarez/null-ls.nvim" --formatters and linters
    use "jlcrochet/vim-razor"

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- use { 'glepnir/dashboard-nvim' }
    -- use 'simrat39/symbols-outline.nvim'
    --
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                patterns = { "Makefile", "build/env.sh", "cargo.toml", "go.mod", "package.json", "composer.json" }
            }
        end
    }

    use 'norcalli/nvim-colorizer.lua'
    use("tpope/vim-fugitive")
    -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- use "ThePrimeagen/harpoon"
    -- use 'ThePrimeagenvim-be-good'

    use "lukas-reineke/indent-blankline.nvim"

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use 'leoluz/nvim-dap-go'
    -- use 'nvim-telescope/telescope-dap.nvim'

    use 'sbdchd/neoformat'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    use { "ellisonleao/glow.nvim",
        config = function()
            require('glow').setup({
            })
        end
    }

    -- use { "rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" } }
end)

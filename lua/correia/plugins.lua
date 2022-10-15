local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

    use 'folke/tokyonight.nvim'
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in neovim   
    use 'nvim-lua/plenary.nvim' -- Useful Lua functions used by many plugins
    use 'nvim-lualine/lualine.nvim' -- lualine
    use "akinsho/bufferline.nvim" --buffer (tabs)

    --Treesitter
    use "nvim-treesitter/nvim-treesitter" --Syntax highlighting

    -- telescope
    use 'kyazdani42/nvim-web-devicons' -- icons
    use 'nvim-telescope/telescope.nvim' -- telescopr
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Git, Comments, Autorpairs
    use "lewis6991/gitsigns.nvim" --Git indication
    use "windwp/nvim-autopairs" --autopairs
    use "numToStr/Comment.nvim"
    --use "lukas-reineke/indent-blankline.nvim"

    --Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- many snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"

end)


local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-3<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- clear search
keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- Todo comments
keymap('n', '<Leader>td', ':TodoLocList<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- close current buffer
keymap('n', '<Leader>z', ':bw<CR>', { noremap = true, silent = true })

-- Save file
keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- vim go add tags
keymap("n", "<Leader>aa", ":GoAddTags<CR>", opts)
keymap("n", "<Leader>ae", ":GoIfErr<CR>", opts)
keymap("n", "<Leader>as", ":GoFillStruct<CR>", opts)
keymap("n", "<Leader>at", ":GoTestFunc<CR>", opts)

-- GIT
keymap("n", "<Leader>gs", ":Git<CR>", opts)
keymap("n", "<Leader>gp", ":Git push<CR>", opts)
-- vim.keymap.set("n", "<Leader>gs", function()
--     require('neogit').open()
-- end, { desc = "git open" })

-- undotree
keymap('n', '<F5>', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- harpoon
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, opts)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, opts)

-- vim.keymap.set("n", "<C-1>", function() require("harpoon.ui").nav_file(1) end, opts)
-- vim.keymap.set("n", "<C-2>", function() require("harpoon.ui").nav_file(2) end, opts)
-- vim.keymap.set("n", "<C-3>", function() require("harpoon.ui").nav_file(3) end, opts)
-- vim.keymap.set("n", "<C-4>", function() require("harpoon.ui").nav_file(4) end, opts)

-- vim.keymap.set("n", "<leader>re", function() require("refactoring").refactor("Extract Function") end, opts)
-- vim.keymap.set("n", "<leader>re", function() require("refactoring").refactor("Extract Variable") end, opts)

-- togletem
-- keymap("n", "<Leader>tt", ":ToggleTerm<CR>", opts)

-- Neoformat
keymap("n", "<Leader>nf", ":Neoformat<CR>", opts)

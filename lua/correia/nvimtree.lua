-- empty setup using defaults
require("nvim-tree").setup {
    view = {
        width = 40,
    }
}

-- local HEIGHT_RATIO = 0.8 -- You can change this
-- local WIDTH_RATIO = 0.5  -- You can change this too
--
-- require("nvim-tree").setup({
--   disable_netrw = true,
--   hijack_netrw = true,
--   respect_buf_cwd = true,
--   sync_root_with_cwd = true,
--   view = {
--     relativenumber = true,
--     float = {
--       enable = true,
--       open_win_config = function()
--         local screen_w = vim.opt.columns:get()
--         local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--         local window_w = screen_w * WIDTH_RATIO
--         local window_h = screen_h * HEIGHT_RATIO
--         local window_w_int = math.floor(window_w)
--         local window_h_int = math.floor(window_h)
--         local center_x = (screen_w - window_w) / 2
--         local center_y = ((vim.opt.lines:get() - window_h) / 2)
--                          - vim.opt.cmdheight:get()
--         return {
--           border = "rounded",
--           relative = "editor",
--           row = center_y,
--           col = center_x,
--           width = window_w_int,
--           height = window_h_int,
--         }
--         end,
--     },
--     width = function()
--       return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
--     end,
--   },
--   -- filters = {
--   --   custom = { "^.git$" },
--   -- },
--   -- renderer = {
--   --   indent_width = 1,
--   -- },
-- })
--
-- vim.g.nvim_tree_width = 40
-- vim.g.nvim_tree_disable_netrw = 0 --"1 by default, disables netrw
-- vim.g.nvim_tree_hide_dotfiles = 1 --0 by default, this option hides files and folders starting with a dot `.`
-- vim.g.nvim_tree_indent_markers = 1 --"0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_follow = 1 --"0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window
-- vim.g.nvim_tree_auto_ignore_ft = 'startify' --"empty by default, don't auto open tree on specific filetypes.

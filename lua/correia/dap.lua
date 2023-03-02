vim.keymap.set("n", "<F4>", ":lua require('dapui').close()<CR>")
vim.keymap.set("n", "<F5>", ":lua require('dap').close()<CR>")
vim.keymap.set("n", "<F6>", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F7>", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require('dap-go').debug_test()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require('dap').toggle_breakpoint()<CR>")

require('dap-go').setup() 
require('dapui').setup()
require('nvim-dap-virtual-text').setup();

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

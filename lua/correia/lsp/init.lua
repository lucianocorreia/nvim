local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("correia.lsp.handlers").setup()

local lspconfig = require("lspconfig")

local servers = { "jsonls", "lua_ls", "intelephense", "tsserver", "rust_analyzer", "vuels", "tailwindcss", "gopls",
    "sqlls", "bufls", "dockerls", "yamlls", "svelte", "cssls", "html", "omnisharp", "prismals", "emmet_ls"}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("correia.lsp.handlers").on_attach,
        capabilities = require("correia.lsp.handlers").capabilities,
    }

    if server == "vuels" then
        opts.root_dir = lspconfig.util.find_node_modules_ancestor
    end

    local has_custom_opts, server_custom_opts = pcall(require, "correia.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    lspconfig[server].setup(opts)
end

-- Go lang LINT
-- lspconfig.golangci_lint_ls.setup {
--     on_attach = require("correia.lsp.handlers").on_attach,
--     capabilities = require("correia.lsp.handlers").capabilities,
--     settings = {
--         gopls = {
--             gofumpt = true,
--         },
--     },
--     flags = {
--         debounce_text_changes = 150,
--     },
-- }

vim.keymap.set("n", "<C-i>", function()
    -- require 'lsp_extensions'.inlay_hints()
end, { desc = "Inlay Hints" })

require('fidget').setup()

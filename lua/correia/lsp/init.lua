local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("correia.lsp.handlers").setup()

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "intelephense", "tsserver", "rust_analyzer", "vuels", "tailwindcss", "gopls", "sqls", "bufls" }

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

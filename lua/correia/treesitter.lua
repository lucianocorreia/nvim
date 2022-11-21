local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "toml",
        "php",
        "json",
        "yaml",
        "css",
        "html",
        "lua",
        "rust",
        "vue",
        "go",
        "sql"
    },
    autotag = {
        enable = true,
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }


require 'treesitter-context'.setup {}

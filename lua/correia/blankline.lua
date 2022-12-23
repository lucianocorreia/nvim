vim.cmd [[highlight IndentBlanklineIndent1 guifg=#524f67 gui=nocombine]]

require("indent_blankline").setup {
    -- show_end_of_line = true,
    show_current_context = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}

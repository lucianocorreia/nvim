local rt = require("rust-tools")

rt.setup({
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> "
        }
    },
    server = {
        inlayHints = { -- NOT SURE THIS IS VALID/WORKS 😬
            lifetimeElisionHints = {
                enable = true,
                useParameterNames = true
            }
        }
    }
})

local home = os.getenv('HOME')
local db = require('dashboard')

db.custom_footer = { desc = "© Luciano Correia" }


db.custom_center = {
    { icon = '  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = '<Leader> f' },
    { icon = '  ',
        desc = 'File Browser                            ',
        action = 'Telescope file_browser',
        shortcut = '<Leader> p' },
    { icon = '  ',
        desc = 'Find  word                              ',
        action = 'Telescope live_grep',
        shortcut = '<Leader> s' },
    -- { icon = '  ',
    --     desc = 'Open Personal dotfiles                  ',
    --     action = 'Telescope dotfiles path=' .. home .. '/.config/nvim',
    --     shortcut = 'SPC f d' },
}

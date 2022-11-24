local neogit = require('neogit')

neogit.setup {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    kind = "tab",
    -- Change the default way of opening the commit popup
    commit_popup = {
        kind = "tab",
    },
    -- Change the default way of opening popups
    popup = {
        kind = "tab",
    },
}

-- Keybinding	Function
-- Tab	Toggle diff
-- 1, 2, 3, 4	Set a foldlevel
-- $	Command history
-- b	Branch popup
-- s	Stage (also supports staging selection/hunk)
-- S	Stage unstaged changes
-- <C-s>	Stage Everything
-- u	Unstage (also supports staging selection/hunk)
-- U	Unstage staged changes
-- c	Open commit popup
-- r	Open rebase popup
-- L	Open log popup
-- p	Open pull popup
-- P	Open push popup
-- Z	Open stash popup
-- ?	Open help popup
-- x	Discard changes (also supports discarding hunks)
-- <enter>	Go to file
-- <C-r>	Refresh Buffer

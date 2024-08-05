local wk = require("which-key")

wk.register({
    { "<leader>C",  desc = "Configure Neovim" },
    { "<leader>d",  desc = "Delete (Dont Yank)" },
    { "<leader>f",  group = "Find" },
    { "<leader>fh", desc = "Find Help" },
    { "<leader>p",  group = "Problem" },
    { "<leader>pf", desc = "Toggle Quickfix" },
    { "<leader>s",  desc = "Find and Replace" },
    { "<leader>x",  group = "Trouble" },
    { "<leader>y",  desc = "Yank to clipboard" },
})

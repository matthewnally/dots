-- local keymap = vim.api.nvim_set_keymap
-- keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
--   { noremap = true, silent = true, desc = "Diagnostics (Trouble)" })
-- keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
--   { noremap = true, silent = true, desc = "Buffer Diagnostics (Trouble)" })
-- keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",
--   { noremap = true, silent = true, desc = "Symbols (Trouble)" })
-- keymap("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--   { noremap = true, silent = true, desc = "LSP Definitions / references / ... (Trouble)" })
-- keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",
--   { noremap = true, silent = true, desc = "Location List (Trouble)" })
-- keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",
--   { noremap = true, silent = true, desc = "Quickfix List (Trouble)" })
return {
    "folke/trouble.nvim",
    opts = {},     -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle focus=true<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
}

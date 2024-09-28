-- Set space as the <leader> key
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<SPACE>", "<Nop>", { noremap = true, silent = true })

-- Move selected text and keep indented
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv",
    { noremap = true, silent = true, desc = "Move selection down and match indentations" })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv",
    { noremap = true, silent = true, desc = "Move selection up and match indentations" })

-- Center cursor while half page jumping
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Center cursor while searching
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Remove highlights with Ctrl-l
vim.api.nvim_set_keymap("n", "<C-l>", ":nohl<CR>", { noremap = true, silent = true })

-- Open Config
vim.api.nvim_set_keymap("n", "<leader>C", ":e ~/.config/nvim/<CR>",
    { noremap = true, silent = true, desc = "Open Config" })


-- vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP",
--     { noremap = true, silent = true, desc = "Paste (Dont Yank)" })
-- vim.api.nvim_set_keymap("n", "<leader>d", "\"_dP",
--     { noremap = true, silent = true, desc = "Delete (Dont Yank)" })
-- vim.api.nvim_set_keymap("v", "<leader>d", "\"_dP",
--     { noremap = true, silent = true, desc = "Delete (Dont Yank)" })

-- Yank text to the system clipboard
vim.api.nvim_set_keymap("x", "<leader>y", "\"+y", { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", { noremap = true, silent = true, desc = "Yank to system clipboard" })

-- Disable Ex mode with Q
vim.api.nvim_set_keymap("n", "Q", "<nop>", { noremap = true, silent = true, desc = "Disable Ex mode" })

-- Open find and replace with visual selection
vim.api.nvim_set_keymap("x", "<leader>s", "y:%s/<C-r>\"/<C-r>\"/gI<Left><Left><Left>",
    { noremap = true, silent = true, desc = "Find and replace with selection" })

-- Open a find and replace prompt
vim.api.nvim_set_keymap("n", "<leader>s", ":%s/", { noremap = true, silent = true, desc = "Find and replace" })

-- detab in insert mode
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-D>', { noremap = true, silent = true })

-- vim tabs, create mew
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>tabnew<cr>", { noremap = true, silent = true, desc = "Open new tab" })

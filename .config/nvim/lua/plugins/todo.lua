-- TODO: add comments
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    },
    config = function()
        require("todo-comments").setup({})
        vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", { desc = "Find TODO" })
        vim.keymap.set('n', '<leader>xt', "<cmd>Trouble todo<CR>", { desc = "TODO Comments (Trouble)" })
    end
}

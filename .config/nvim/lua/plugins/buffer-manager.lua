return {
    "j-morano/buffer_manager.nvim",
    config = function()
        local bm = require('buffer_manager')
        vim.keymap.set("n", "<leader>b", function() bm.ui.toggle_quick_menu() end, { desc = "Buffer Manager" })
        vim.keymap.set("n", "<tab>", function() bm.ui.nav_next(1) end)
        vim.keymap.set("n", "<s-tab>", function() bm.ui.nav_prev(1) end)
    end
}

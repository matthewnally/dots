return {
    "j-morano/buffer_manager.nvim",
    config = function()
        local bmui = require('buffer_manager.ui')
        vim.keymap.set("n", "<leader>b", function() bmui.toggle_quick_menu() end, { desc = "Buffer Manager" })
        vim.keymap.set("n", "<tab>", function() bmui.nav_next(1) end)
        vim.keymap.set("n", "<s-tab>", function() bmui.nav_prev(1) end)
    end
}

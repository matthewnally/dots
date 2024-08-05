local ui = require("buffer_manager.ui")

vim.keymap.set("n", "<leader>b", function() ui.toggle_quick_menu() end, { desc = "Buffer Manager" })
vim.keymap.set("n", "<tab>", function() ui.nav_next(1) end)
vim.keymap.set("n", "<s-tab>", function() ui.nav_prev(1) end)

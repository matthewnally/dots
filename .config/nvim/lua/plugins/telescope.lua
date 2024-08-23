return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git Files" })
        vim.keymap.set('n', '<leader>fr', builtin.live_grep, { desc = "Find Text with Regex" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffer" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })
        vim.keymap.set('n', '<leader>fC', function() builtin.find_files({ cwd = "~/.config/nvim" }) end,
            { desc = "Find Config" })
    end
}

return {
    'jpalardy/vim-slime',
    config = function()
        -- Disable default mappings for vim-slime
        vim.g.slime_no_mappings = 1
        vim.g.slime_target = "tmux"
        vim.g.slime_bracketed_paste = 1
    end,
    keys = {
        -- Key mappings for vim-slime
        { '<leader>S',  '<Plug>SlimeRegionSend', mode = 'x', desc = "Send selection to REPL" },
        { '<leader>S',  '<Plug>SlimeMotionSend', mode = 'n', desc = "Send Motion to REPL" },
        { '<leader>SS', '<Plug>SlimeLineSend',   mode = 'n', desc = "Send Line to REPL" },
    },
}

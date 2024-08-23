return {
    "mfussenegger/nvim-dap",
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            -- "rcarriga/nvim-dap-ui",
            -- "nvim-neotest/nvim-nio",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)

            vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
            vim.keymap.set('n', '<Leader>dj', function() require('dap').step_over() end)
            vim.keymap.set('n', '<Leader>dl', function() require('dap').step_into() end)
            vim.keymap.set('n', '<Leader>dh', function() require('dap').step_out() end)
            vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
            vim.keymap.set('n', '<Leader>dt', function() require('dap').test_method() end)
            -- vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
            --     require('dap.ui.widgets').hover()
            -- end)
            -- vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
            --     require('dap.ui.widgets').preview()
            -- end)
            -- vim.keymap.set('n', '<Leader>df', function()
            --     local widgets = require('dap.ui.widgets')
            --     widgets.centered_float(widgets.frames)
            -- end)
            -- vim.keymap.set('n', '<Leader>ds', function()
            --     local widgets = require('dap.ui.widgets')
            --     widgets.centered_float(widgets.scopes)
            -- end)
        end,
    },
}

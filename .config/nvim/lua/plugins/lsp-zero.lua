return {
    'VonHeikemen/lsp-zero.nvim', -- This connects nvim-lspconfig and nvim-cmp
    branch = 'v3.x',
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
            -- this auto uses all lsps for formatting
            -- order cannot be guaranteed so specify lsps if issues
            lsp_zero.buffer_autoformat()
        end)
    end

}

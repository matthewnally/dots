require('gitsigns').setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- this auto uses all lsps for formatting
    -- order cannot be guaranteed so specify lsps if issues
    lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
    automatic_installation = true
})
local cmp = require('cmp')
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end
}
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})


-- setup for guard
local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft("python"):fmt("black"):fmt({
    cmd = 'isort',
    args = { '-', '--profile', 'black' },
    stdin = true,
}):lint("flake8")

ft('typescript,javascript,typescriptreact'):fmt('prettier')

-- Call setup() LAST!
require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
})

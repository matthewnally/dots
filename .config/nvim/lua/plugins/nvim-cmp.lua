return {
    'hrsh7th/nvim-cmp', --autocompletion
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                ['<tab>'] = cmp.mapping.confirm({ select = false }),
            })
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
                cmp.setup.buffer {
                    sources = {
                        { name = 'vim-dadbod-completion' },
                        { name = "buffer" }
                    }
                }
            end,
        })
    end
}

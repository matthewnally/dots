-- manages installing lsps, formatters, linters
return {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({ pip = { upgrade_pip = true } })
        end
    }

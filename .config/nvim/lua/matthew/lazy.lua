local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "folke/which-key.nvim" },
    { "stevearc/oil.nvim" },    -- file mamanger based on vim vinegar
    { "lambdalisue/suda.vim" }, -- write sudo file with :SudaWrite
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    { "nvim-treesitter/nvim-treesitter" },
    { "tpope/vim-fugitive" },           -- git client
    { "tpope/vim-surround" },           -- parenthesis shortcuts
    { "tpope/vim-commentary" },         -- code comment shortcuts
    { "tpope/vim-sleuth" },             -- auto switches between spaces and tabs depending on file
    { "tpope/vim-unimpaired" },         -- adds [q ]q for quickfix navigation
    { "lewis6991/gitsigns.nvim" },
    { "j-hui/fidget.nvim" },            -- shows progress and logging for lsps
    { "mbbill/undotree" },              -- show undo history in tree with :UndotreeToggle
    { "j-morano/buffer_manager.nvim" }, --fast file navigation with shortcuts
    { 'norcalli/nvim-colorizer.lua' },  -- highlights html color coldes
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    syntax = "markdown",
                    ext = ".md",
                    path = "~/notes/wiki"
                },
            }
        end,
    },

    { "ElPiloto/telescope-vimwiki.nvim" },

    {
        -- This sets sensible defaults for running lsps
        { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },

        --- Uncomment these if you want to manage LSP servers from neovim
        { 'williamboman/mason.nvim' },           -- manages installing LSPs
        { 'williamboman/mason-lspconfig.nvim' }, -- sane default configs for lsp

        -- LSP Support
        {
            'neovim/nvim-lspconfig', --simplifies lsp confih
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
            },
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                {
                    "L3MON4D3/LuaSnip",
                    -- follow latest release.
                    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                    -- install jsregexp (optional!).
                    build = "make install_jsregexp"
                },
            }
        },
    },
    { "nvimtools/none-ls.nvim" }, -- Adds lsp like features to cli tools such as black, isort
    { "rebelot/kanagawa.nvim",          lazy = false }
})

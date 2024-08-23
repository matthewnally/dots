return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
        require('kanagawa').setup({
            dimInactive = false
        })
        vim.cmd("colorscheme kanagawa")
        vim.cmd("highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ff9e3b guifg=#223249")
    end
}

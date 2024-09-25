return {
    'tpope/vim-fugitive',     -- git client
    {
        "tpope/vim-surround", -- parenthesis shortcuts
        config = function()
            vim.g['surround_' .. vim.fn.char2nr('b')] = '**\r**'
            vim.g['surround_' .. vim.fn.char2nr('i')] = '*\r*'
        end
    },
    "tpope/vim-commentary", -- code comment shortcuts
    "tpope/vim-sleuth",     -- auto switches between spaces and tabs depending on file
    "tpope/vim-repeat",     -- plugin repeat functionality
}

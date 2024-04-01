vim.cmd('source ~/.config/vim/vimrc')

require("matthew.set")
require("matthew.remap")
require("matthew.lazy")

local augroup = vim.api.nvim_create_augroup
local MatthewGroup = augroup('Matthew', {})

local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

-- remove whitespace on save
autocmd({"BufWritePre"}, {
    group = MatthewGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


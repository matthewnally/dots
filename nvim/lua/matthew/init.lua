require("matthew.set")
require("matthew.remap")
require("matthew.packer")

local augroup = vim.api.nvim_create_augroup
local MatthewGroup = augroup('Matthew', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd
local pandoc_group = augroup('PandocWrite', {})

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

autocmd({"BufWritePre"}, {
    group = MatthewGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd({"BufWritePost"}, {
    group = pandoc_group,
    pattern = "cv.md,cv.css",
    command = ":silent !source build.sh",
})


vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

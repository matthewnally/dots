require("matthew.set")
require("matthew.remap")
require("matthew.statusline")

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
autocmd({ "BufWritePre" }, {
    group = MatthewGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


-- LAZY SETUP
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

require("lazy").setup('plugins', {})

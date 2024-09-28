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



vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.bo.commentstring = "-- %s"
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.wo.showbreak = ""
    end,
})



-- Set conceallevel to 2 for Markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end
})

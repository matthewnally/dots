local augroup = vim.api.nvim_create_augroup
local MatthewGroup = augroup('Matthew', {})

local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    desc = "Highlight on yank",
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



autocmd("FileType", {
    desc = "Add sql comment type",
    pattern = "sql",
    callback = function()
        vim.bo.commentstring = "-- %s"
    end,
})
autocmd("FileType", {
    desc = "Show soft breaks without >",
    pattern = "markdown",
    callback = function()
        vim.wo.showbreak = ""
    end,
})

-- autocmd('BufReadPost', {
--     desc = 'Open file at the last position it was edited earlier',
--     pattern = '*',
--     command = 'silent! normal! g`"zv'
-- })

-- Set conceallevel to 2 for Markdown files
autocmd("FileType", {
    desc = "Show quotation marks in json",
    pattern = { "json", "jsonc" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end
})

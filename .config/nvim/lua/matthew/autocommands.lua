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


vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
    group = vim.api.nvim_create_augroup("user_diagnostic_qflist", {}),
    callback = function(args)
        -- Use pcall because I was getting inconsistent errors when quitting vim.
        -- Possibly timing errors from trying to get/create diagnostics/qflists
        -- that don't exist anymore. DiagnosticChanged fires at some strange times.
        local has_diagnostics, diagnostics = pcall(vim.diagnostic.get)
        local has_qflist, qflist = pcall(vim.fn.getqflist, { title = 0, id = 0, items = 0 })
        if not has_diagnostics or not has_qflist then return end

        -- Sometimes the event fires with an empty diagnostic list in the data.
        -- This conditional prevents re-creating the qflist with the same
        -- diagnostics, which reverts selection to the first item.
        if
            #args.data.diagnostics == 0
            and #diagnostics > 0
            and qflist.title == "All Diagnostics"
            and #qflist.items == #diagnostics
        then
            return
        end

        vim.schedule(function()
            -- If the last qflist was created by this autocmd, replace it so other
            -- lists (e.g., vimgrep results) aren't buried due to diagnostic changes.
            pcall(vim.fn.setqflist, {}, qflist.title == "All Diagnostics" and "r" or " ", {
                title = "All Diagnostics",
                items = vim.diagnostic.toqflist(diagnostics),
            })

            -- Don't steal focus from other qflists. For example, when working
            -- through vimgrep results, you likely want :cnext to take you to the
            -- next match, rather than the next diagnostic. Use :cnew to switch to
            -- the diagnostic qflist when you want it.
            if qflist.id ~= 0 and qflist.title ~= "All Diagnostics" then pcall(vim.cmd.cold) end
        end)
    end,
})

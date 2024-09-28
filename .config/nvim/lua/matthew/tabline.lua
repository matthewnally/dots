vim.o.tabline = "%!v:lua.MyTabLine()"

function MyTabLine()
    local s = ""
    for i = 1, vim.fn.tabpagenr('$') do
        -- Highlight current tab
        if i == vim.fn.tabpagenr() then
            s = s .. "%#TabLineSel#"
        else
            s = s .. "%#TabLine#"
        end

        -- Get the file name for the buffer in the tab
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local file = vim.fn.bufname(buflist[winnr])
        file = vim.fn.fnamemodify(file, ":t") -- Get file name from the full path

        -- Append tab number and file name to the tabline
        s = s .. "%" .. i .. "T" .. " " .. i .. ": " .. file .. " "
    end

    -- Fill the rest of the tabline
    s = s .. "%#TabLineFill#%T"
    return s
end

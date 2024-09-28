-- Statusline setup with git branch

function git_branch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    local result = handle:read("*a")
    handle:close()
    return result
end

function statusline_git()
    local branchname = git_branch()
    if #branchname > 0 then
        return '[' .. branchname .. '] '
    else
        return ''
    end
end

function get_fileencoding()
    local file_encoding = '%{&fileencoding}'
    if #file_encoding > 0 then
        return '[' .. file_encoding .. '] '
    else
        return ''
    end
end

vim.opt.statusline = table.concat({
    -- '%#Type#',                   -- Changes to Type highlight Group
    -- '%#CursorColumn#',           -- Changes to CursorColomn highlight Group
    '%#Normal#',                                                 -- Changes to Normal highlight Group
    '%{v:lua.statusline_git()}',                                 -- git branch
    '%f',                                                        -- filename
    '%{get(b:,"gitsigns_status","")}',                           -- get git adds, removed, changes, requires gitsigns, blank otherwise
    '%#Type#%m',                                                 -- unsaved indicator (Type) hg group
    '%=',                                                        -- ALigns rest of elements to right
    -- '%#CursorColumn#',           -- Changes to CursorColomn highlight Group
    '%#Normal#',                                                 -- Changes to Normal highlight Group
    ' %y',                                                       -- filetype
    -- '[%{&fileencoding}]',        -- file encoding UTF-8, ascii
    '%{&fileencoding != "" ? "[" .. &fileencoding .. "]" : ""}', -- file encoding (only show if not blank)
    '[%{&fileformat}]',                                          -- file format UNIX LF, CRLF
    ' %l:%c'                                                     -- line and column
}, '')

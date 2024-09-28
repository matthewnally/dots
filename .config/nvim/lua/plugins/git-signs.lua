return {
    "lewis6991/gitsigns.nvim",
    opts = {
        status_formatter = function(status)
            local added, changed, removed = status.added, status.changed, status.removed
            local status_txt = {}
            if added and added > 0 then table.insert(status_txt, '+' .. added) end
            if changed and changed > 0 then table.insert(status_txt, '~' .. changed) end
            if removed and removed > 0 then table.insert(status_txt, '-' .. removed) end
            if #status_txt == 0 then
                return ""
            end
            return " (" .. table.concat(status_txt, ' ') .. ")"
        end

    }
}

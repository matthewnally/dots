return {
    "epwalsh/obsidian.nvim",
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/notes",
            },
        },
        -- Optional, customize how note IDs are generated given an optional title.
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            local time = os.time()

            -- Format the time in ISO 8601 format (YYYYMMDDTHHMMSSZ)
            local iso_time = os.date("!%Y%m%dT%H%M%S", time)
            return iso_time .. "-" .. suffix
        end,
        ---@param url string
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            -- vim.fn.jobstart({ "open", url }) -- Mac OS
            vim.fn.jobstart({ "xdg-open", url }) -- linux
            -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
            -- vim.ui.open(url) -- need Neovim 0.10.0+
        end,
    },
    keys = {
        { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>",    desc = "Find Notes" },
        { "<leader>fn", "<cmd>ObsidianQuickSwitch<cr>",    desc = "Find Notes" },
        { "<leader>nr", "<cmd>ObsidianSearch<cr>",         desc = "Find in Notes" },
        { "<leader>nt", "<cmd>ObsidianTags<cr>",           desc = "Search Tags" },
        { "<leader>nn", "<cmd>:e ~/notes/Fleeting.md<cr>", desc = "Open Fleeting Note" },

    },
    config = function(_, opts)
        require("obsidian").setup(opts)
        -- Define the custom highlights for markdown headers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                -- Link Treesitter markdown headers to Vimwiki-inspired highlight groups
                vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "Function" })   -- H1 -> Function
                vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "Type" })       -- H2 -> Type
                vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "String" })     -- H3 -> String
                vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { link = "Constant" })   -- H4 -> Constant
                vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { link = "Identifier" }) -- H5 -> Identifier
                vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { link = "Comment" })    -- H6 -> Comment
            end,
        })
    end,

}

return {
    "epwalsh/obsidian.nvim",
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/notes/notes",
            },
        },
        daily_notes = {
            folder = "01 Daily",
        }
    },
    keys = {
        { "<leader>fn", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Notes" },
        { "<leader>fN", "<cmd>ObsidianSearch<cr>",      desc = "Find in Notes" }

    }
}

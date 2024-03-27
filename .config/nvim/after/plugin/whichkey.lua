local wk = require("which-key")

wk.register({
    f = {
        name = "Find",
        f = "Find File",
        g = "Find Git File",
        r = "Find REGEX",
        b = "Find Buffer",
        h = "Find Help",
    },
    e = { name = "Explorer" },
    s = "Find and Replace",
    d = "Delete (Dont Yank)",
    p = {
        name = "Problem",
        f = "Toggle Quickfix"
    },
    x = {
        name = "Trouble",
        x = "Toggle Trouble",
        w = "Toggle Workspace Diagnostics",
        d = "Toggle Document Diagnositics",
        q = "Toggle Quickfix",
        l = "Toggle clist"
    },
    h = {
        name = "Harpoon",
        a = "Add to Harpoon List",
        h = "Toggle Harpoon Quick Menu",
        q = "Go to file 1",
        w = "Go to file 2",
        e = "Go to file 3",
        r = "Go to file 4",
        t = "Go to file 5",
    }
}, { prefix = "<leader>" })

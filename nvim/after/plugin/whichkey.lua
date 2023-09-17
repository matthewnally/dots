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
  e = {name = "Explorer"},
  s = "Find and Replace",
  d = "Delete (Dont Yank)",
  p = {
      name = "Problem",
      f = "Toggle Quickfix"
    }
}, { prefix = "<leader>" })

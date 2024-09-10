-- Enable mouse
vim.opt.mouse = "a"

-- Enable numbers and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Reloads buffers if the file changes
vim.opt.autoread = true

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Enable true color support
vim.opt.termguicolors = true

-- Keep at least 8 lines above and below the cursor
vim.opt.scrolloff = 8

-- Open splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set block and Insert Mode cursor
-- vim.opt.guicursor = { "n-v-c:block", "i-ci:ver25", "r-cr:hor20", "o:hor50" }

-- undodir
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


-- Color column
vim.o.colorcolumn = "80"

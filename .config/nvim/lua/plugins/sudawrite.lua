-- write sudo file with :SudaWrite
--
return {
    "lambdalisue/vim-suda",
    config = function()
        vim.keymap.set("c", "w!!", "SudaWrite<CR>")
    end,
}

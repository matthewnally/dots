require('catppuccin').setup({
    disable_background = true,
    highlight_overrides = {
        mocha = function(mocha)
            return {
                LineNr = { fg = mocha.teal },
            }
        end,
    },
})

function ColorMyPencils()
	vim.cmd.colorscheme("catppuccin-mocha")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()

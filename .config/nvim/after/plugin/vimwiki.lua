vim.keymap.set('n', '<leader>fw', require('telescope').extensions.vimwiki.vimwiki, { desc = 'Find in Wiki' })


-- vim.g.vimwiki_list = { { path = '~/notes/', syntax = 'markdown', ext = 'md' } }

vim.keymap.set('n', ']-', '<Plug>VimwikiNextLink')
vim.keymap.set('n', '[-', '<Plug>VimwikiPrevLink')
vim.keymap.set('n', 'glx', '<Plug>VimwikiToggleListItem')
vim.keymap.set('n', 'glx', '<Plug>VimwikiToggleRejectedListItem')

local header_colors = {
    VimWikiHeader1 = 'Function',
    VimWikiHeader2 = 'Type',
    VimWikiHeader3 = 'String',
    VimWikiHeader4 = 'Constant',
    VimWikiHeader5 = 'Identifier',
    VimWikiHeader6 = 'Comment',
}

for hlgroup, base_hlgroup in pairs(header_colors) do
    local fg_color = vim.fn.synIDattr(vim.fn.hlID(base_hlgroup), 'fg')
    vim.cmd('highlight ' .. hlgroup .. ' guifg=' .. fg_color)
end

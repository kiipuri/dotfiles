vim.g.mapleader = ","
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 200

vim.g.tokyonight_style = "night"
vim.api.nvim_command [[colorscheme tokyonight]]

vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.7

vim.api.nvim_command [[
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
]]

vim.diagnostic.config({
    virtual_text = false
})

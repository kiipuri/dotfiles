vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--vim.opt.clipboard = "unnamedplus"
vim.api.nvim_command [[set clipboard+=unnamedplus]]

require'plugins'
require'lsp-wrapper'

vim.g.tokyonight_style = "night"
vim.api.nvim_command [[colorscheme tokyonight]]
--vim.api.nvim_command [[colorscheme blue-moon]]
vim.api.nvim_set_keymap("n", "<C-n>", "<Esc>:NvimTreeToggle<CR>", {noremap = true})
vim.g.floaterm_keymap_toggle = "<C-t>"
vim.api.nvim_set_keymap("n", "<C-j>", "<Esc>:Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Tab>", "<Esc>:BufferNext<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<Esc>:BufferPrevious<CR>", {noremap = true})
--[[

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

--]]

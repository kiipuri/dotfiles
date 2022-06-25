require"user.options"
require"user.keymaps"
require"user.alpha"
require"user.plugins"
require"user.lsp-wrapper"
require"user.autocommands"
require"user.trouble"
require"user.treesitter"
require"user.colorizer"
require"user.lualine"
require"user.nvim-tree"
require"user.dap"
require"user.comment"
require"user.project-nvim"

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

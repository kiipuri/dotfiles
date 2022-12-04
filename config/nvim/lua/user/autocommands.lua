vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { ".Xresources" },
    callback = function()
        vim.api.nvim_command("silent !xrdb ~/.Xresources")
    end
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function()
        vim.api.nvim_command("silent !nvim +PackerSync")
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.rs", "*.lua" },
    callback = function()
        vim.lsp.buf.format()
    end
})

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

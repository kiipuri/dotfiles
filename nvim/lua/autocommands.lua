vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { ".Xresources" },
    callback = function ()
        vim.api.nvim_command("silent !xrdb ~/.Xresources")
    end
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function ()
        vim.api.nvim_command("silent !nvim +PackerSync")
    end
})

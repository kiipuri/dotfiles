vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.vue", "*.html", "*.js", "*.ts", "*.jsx", "*.tsx" },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        if vim.lsp.buf.server_ready() then
            vim.lsp.buf.format()
        end
    end,
})

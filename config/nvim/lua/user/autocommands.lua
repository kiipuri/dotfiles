vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { ".Xresources" },
	callback = function()
		vim.api.nvim_command("silent !xrdb ~/.Xresources")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "plugins.lua" },
	callback = function()
		vim.api.nvim_command("silent !nvim +PackerSync")
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = { "*.rs", "*.lua", "*.ts", "*.js", "*.vue" },
--     callback = function()
--         vim.lsp.buf.format()
--     end
-- })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.vue", "*.html", "*.js", "*.ts", "*.jsx", "*.tsx" },
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.html" },
	callback = function()
		vim.api.nvim_command("silent! Prettier")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.vue", "*.ts", "*.js", "*.jsx", "*.tsx" },
	callback = function()
		vim.api.nvim_command("silent! EslintFixAll")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		if vim.lsp.buf.server_ready() then
			vim.lsp.buf.format()
		end
	end,
})

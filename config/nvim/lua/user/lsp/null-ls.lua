-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
--     return
-- end
--
-- local null_ls_status_ok, null_ls = pcall(require, "null_ls")
-- if not null_ls_status_ok then
--     return
-- end
--
-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.completion.spell,
--     }
-- })

require("mason").setup()
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.flake8.with({
			extra_args = {
				"--max-line-length",
				"88",
			},
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.selene,
	},
})

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {"vim"},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        }
    }
}

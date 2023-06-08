local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

lspconfig.volar.setup {
    init_options = {
        typescript = {
            tsdk = "/usr/lib/node_modules/typescript/lib"
        }
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
}

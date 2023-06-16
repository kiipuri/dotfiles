local signs = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " ",
}

require("trouble").setup({
    signs = signs,
    use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
})

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

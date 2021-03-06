local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
    return
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

trouble.setup {
    auto_open = false,
    signs = signs
}

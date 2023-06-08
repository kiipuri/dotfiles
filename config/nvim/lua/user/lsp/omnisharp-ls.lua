local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- local pid = vim.fn.getpid()

lspconfig.omnisharp.setup {
    -- cmd = { "/home/kiipuri/.local/omnisharp/run", "--languageserver", "--hostPID", tostring(pid) };
    -- root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln");
    -- cmd = { "dotnet", "/home/kiipuri/.local/omnisharp/run" }
    cmd = { "omnisharp" },
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = false,
}

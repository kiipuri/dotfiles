local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

which_key.register({
    f = {
        name = "File",
        f = { "<Cmd>Telescope find_files hidden=true<CR>", "Find file" },
        p = { "<Cmd>Telescope projects<CR>", "Open projects" }
    },
    d = {
        name = "Dap",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
        l = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
        O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
        t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
        e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate word" }
    },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Refactor" },
    s = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
    t = "Toggle floating terminal",
    n = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
    b = { "<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown{previewer = false, initial_mode='normal'})<cr>",
        "Find buffers" },
    c = { "<cmd>Bdelete<cr>", "Close buffer" },

}, { prefix = "<leader>" })

which_key.register({
    g = {
        c = "Toggle linewise comment",
        b = "Toggle blockwise comment"
    }
})

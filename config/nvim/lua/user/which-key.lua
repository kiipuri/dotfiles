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
    t = {
        name = "Terminal",
        t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle floating terminal" },
        l = { "<cmd>ToggleTerm direction=vertical<cr>", "Toggle right terminal" },
        c = "Cargo run",
    },
    g = { "Lazygit" },
    n = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
    b = { "<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown{previewer = false, initial_mode='normal'})<cr>",
        "Find buffers" },
    c = { "<cmd>Bdelete<cr>", "Close buffer" },
    l = { name = "Lsp",
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        f = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Refactor" },
        s = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show line diagnostics" },
        c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    },
    -- x = { "<cmd>VimtexCompile<cr>", "Compile LaTeX" },
    x = { "<cmd>MakeTex<cr>", "Compile LaTeX" },
    h = { "<cmd>noh<cr>", "Disable highlight" },
    e = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    j = { name = "Harpoon",
        m = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", "Mark" },
        t = { "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", "Toggle menu" },
        f = { "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", "Open file 1" },
        d = { "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", "Open file 2" },
        s = { "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", "Open file 3" },
        a = { "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", "Open file 4" },
        o = { "<cmd>lua require'telescope.builtin'.find_files()<cr>", "Find files" },
    },

}, { prefix = "<leader>" })

which_key.register({
    g = {
        c = "Toggle linewise comment",
        b = "Toggle blockwise comment"
    },
    -- K = { "<cmd>m -1<cr>", "Move line up" },
})

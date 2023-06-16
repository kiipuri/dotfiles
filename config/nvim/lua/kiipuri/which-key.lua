local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

which_key.register({
    f = {
        name = "File",
        f = { "<Cmd>Telescope find_files hidden=true<CR>", "Find file" },
        g = { "<Cmd>Telescope git_files<CR>", "Find git file" },
        p = { "<Cmd>Telescope projects<CR>", "Open projects" },
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
        e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate word" },
    },
    t = {
        name = "Terminal",
        t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle floating terminal" },
        l = { "<cmd>ToggleTerm direction=vertical<cr>", "Toggle right terminal" },
        c = "Cargo run",
    },
    g = { "Lazygit" },
    b = {
        "<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown{previewer = false, initial_mode='normal'})<cr>",
        "Find buffers",
    },
    c = { "<cmd>Bdelete<cr>", "Close buffer" },
    l = {
        name = "Lsp",
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        f = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Refactor" },
        s = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show line diagnostics" },
        c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    },
    x = { "<cmd>MakeTex<cr>", "Compile LaTeX" },
    h = { "<cmd>noh<cr>", "Disable highlight" },
    e = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    j = {
        name = "Harpoon",
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
        b = "Toggle blockwise comment",
    },
    -- K = { "<cmd>m -1<cr>", "Move line up" },
})

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = false }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- keymap("n", "K", ":m -2<cr>gv", opts)
keymap("v", "K", ":m-2<cr>gv=gv", opts)
-- keymap("n", "J", ":m +1<cr>gv", opts)
keymap("v", "J", ":m'>+1<cr>gv=gv", opts)

vim.g.tex_building = false

function _MAKE_TEX()
    vim.g.tex_building = not vim.g.tex_building

    if vim.g.tex_building == false then
        print("Stopped building LaTeX")
        return
    end

    print("Building LaTeX")

    local fname = vim.fn.expand("%")
    local fbase = fname:sub(1, -5)

    local handle = io.popen("stat -c %Y " .. fname)
    local modified
    if handle ~= nil then
        modified = handle:read()
        handle:close()
    end

    local timer = vim.loop.new_timer()
    timer:start(0, 1000, function()
        handle = io.popen("stat -c %Y " .. fname)
        local modified2
        if handle ~= nil then
            modified2 = handle:read()
            handle:close()
        end

        if modified ~= modified2 then
            os.execute("NAME=" .. fbase .. " make")
            modified = modified2
        end

        if vim.g.tex_building == false then
            timer:close()
        end
    end)
end

vim.cmd("command! MakeTex lua _MAKE_TEX()")

-- Delete without yanking
vim.api.nvim_set_keymap("n", "<leader>diw", '"_diw', opts)

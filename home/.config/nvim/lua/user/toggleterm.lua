local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    size = 40,
    close_on_exit = true,
    direction = "float",
    float_opts = {
        border = "curved",
    }
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<leader>t", "<cmd>ToggleTerm<cr>", opts)
end

local Terminal = require "toggleterm.terminal".Terminal
local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
    },
    count = 99,
}

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local cargo_run = Terminal:new {
    cmd = "cargo run",
    hidden = true,
}

function _CARGO_RUN()
    cargo_run:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>lua _CARGO_RUN()<cr>", { noremap = true, silent = true })

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

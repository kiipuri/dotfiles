-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = false }

-- Normal --
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

-- Floaterm
vim.g.floaterm_keymap_toggle = "<Leader>t"

-- Add directory as project
function _ADD_CURR_DIR_TO_PROJECTS()
    local historyfile = require("project_nvim.utils.path").historyfile
    local curr_directory = vim.fn.expand("%:p:h")
    vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
end

vim.cmd("command! ProjectAddManually lua _ADD_CURR_DIR_TO_PROJECTS()")

-- Delete without yanking
vim.api.nvim_set_keymap("n", "<leader>diw", "\"_diw", opts)

-- Lspsaga
-- keymap("n", "<leader>r", "<cmd>Lspsaga rename<cr>", opts)
-- keymap("n", "<leader>s", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)

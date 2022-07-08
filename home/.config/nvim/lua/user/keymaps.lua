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

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- NvimTree
keymap("n", "<Leader>n", "<Cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<Leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>fp", "<Cmd>Telescope projects<CR>", opts)

-- Barbar
keymap("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<C-q>", "<Cmd>lua require'dapui'.close()<CR>|<Cmd>BufferClose<CR>", opts)

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

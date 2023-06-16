vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 200
vim.api.nvim_command([[set scrolloff=10]])
vim.opt.title = true

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_general_viewer = "zathura"
vim.g.vimtex_compiler_latexmk = {
    options = {
        "-synctex=0",
        "-outdir=temp",
    },
}
vim.g.vimtex_compiler_latexmk_engines = {
    _ = "-xelatex",
}

local status_ok, _ = pcall(vim.cmd, "colorscheme tokyonight")
if status_ok then
    vim.g.tokyonight_style = "night"
    vim.api.nvim_command([[colorscheme tokyonight-night]])
end

vim.diagnostic.config({
    virtual_text = false,
})

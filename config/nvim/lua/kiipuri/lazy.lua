local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/tokyonight.nvim",
    "folke/which-key.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",
    "ThePrimeagen/harpoon",
    "jose-elias-alvarez/null-ls.nvim",
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
    { "windwp/nvim-autopairs",   config = "require('nvim-autopairs').setup()" },
    "rcarriga/nvim-notify",
    { "numToStr/Comment.nvim", config = "require('comment').setup()" },
    "karb94/neoscroll.nvim",
    "norcalli/nvim-colorizer.lua",
    "nvim-treesitter/nvim-treesitter",
    "kyazdani42/nvim-web-devicons",
    "RRethy/vim-illuminate",
    "abecodes/tabout.nvim",
    "tpope/vim-surround",
    { "L3MON4D3/LuaSnip",      dependencies = { "rafamadriz/friendly-snippets" } },
    "folke/trouble.nvim",
    "stevearc/dressing.nvim",
    "akinsho/toggleterm.nvim",
    "kylechui/nvim-surround",
    "mbbill/undotree",
})

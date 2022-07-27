local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer = require "packer"
packer.init {}

packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use 'kyazdani42/blue-moon'
    use "folke/tokyonight.nvim"
    use 'neovim/nvim-lspconfig'
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "kyazdani42/nvim-web-devicons"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use "nvim-lualine/lualine.nvim"
    use "tree-sitter/tree-sitter-python"
    use "tree-sitter/tree-sitter-c"
    use "nvim-treesitter/nvim-treesitter"
    -- use "voldikss/vim-floaterm"
    use "norcalli/nvim-colorizer.lua"
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use "jiangmiao/auto-pairs"
    -- use "romgrk/barbar.nvim"
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use "rcarriga/nvim-dap-ui"
    use "numToStr/Comment.nvim"
    use "ahmedkhalf/project.nvim"
    use "RRethy/vim-illuminate"
    use "goolord/alpha-nvim"
    use "rafamadriz/friendly-snippets"
    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use "lambdalisue/suda.vim"
    use "folke/which-key.nvim"
    use "glepnir/lspsaga.nvim"
    use "simrat39/rust-tools.nvim"
    use "tpope/vim-surround"
    use "unblevable/quick-scope"
    use "abecodes/tabout.nvim"
    use { "michaelb/sniprun", run = "bash ./install.sh" }
    use "rcarriga/nvim-notify"
    use "stevearc/dressing.nvim"
    use "vimlab/split-term.vim"
    use "moll/vim-bbye"
    use { "glacambre/firenvim", run = function() vim.fn['firenvim#install'](0) end }
    use "akinsho/toggleterm.nvim"

    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)

local packer = require "packer"
packer.init {}

local use = packer.use
packer.reset()

packer.startup(function()
    use "wbthomason/packer.nvim"
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = {
            auto_reload_on_write = true,
        }
    }
    use 'kyazdani42/blue-moon'
    use "folke/tokyonight.nvim"
    use 'neovim/nvim-lspconfig'
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "kyazdani42/nvim-web-devicons"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require"trouble".setup {
                auto_open = true,
                auto_close = true,
            }
        end
    }
    use "nvim-lualine/lualine.nvim"
    use "tree-sitter/tree-sitter-python"
    use "tree-sitter/tree-sitter-c"
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function() require"nvim-treesitter.configs".setup {
            ensure_installed = { "lua", "python" },
            ignore_install = { "lua" },
            highlight = {
                enable = true
            }
        } end
    }
    use "voldikss/vim-floaterm"
    use "norcalli/nvim-colorizer.lua"
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "jiangmiao/auto-pairs"
    use "romgrk/barbar.nvim"
end)

require"colorizer".setup ()
require"lualine".setup {}
require"nvim-tree".setup {}

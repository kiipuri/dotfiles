local packer = require "packer"
packer.init {}

local use = packer.use
packer.reset()

require"alpha-dashboard"

packer.startup(function()
    use "wbthomason/packer.nvim"
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
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
            },
            autopairs = {
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
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use "rcarriga/nvim-dap-ui"
    use "numToStr/Comment.nvim"
    use "ahmedkhalf/project.nvim"
    use "RRethy/vim-illuminate"
    use {
        "goolord/alpha-nvim",
        config = function()
            require"alpha".setup(require"alpha.themes.dashboard".config)
        end
    }
end)

require"colorizer".setup ()
require"lualine".setup {}
require"nvim-tree".setup {
        auto_reload_on_write = true,
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true
        }
}
require"dapui".setup {}
require"dap-python".setup ("/usr/bin/python", {})
require"Comment".setup {}
require"project_nvim".setup {}
require"telescope".load_extension"projects"

function _ADD_CURR_DIR_TO_PROJECTS()
  local historyfile = require("project_nvim.utils.path").historyfile
  local curr_directory = vim.fn.expand("%:p:h")
  vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
end

vim.cmd("command! ProjectAddManually lua _ADD_CURR_DIR_TO_PROJECTS()")

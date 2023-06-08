local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer = require("packer")
packer.init({})

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("kyazdani42/blue-moon")
	use("folke/tokyonight.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("nvim-lualine/lualine.nvim")
	use("tree-sitter/tree-sitter-python")
	use("tree-sitter/tree-sitter-c")
	use("nvim-treesitter/nvim-treesitter")
	use("norcalli/nvim-colorizer.lua")
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use("rcarriga/nvim-dap-ui")
	use("numToStr/Comment.nvim")
	use("ahmedkhalf/project.nvim")
	use("RRethy/vim-illuminate")
	use("goolord/alpha-nvim")
	use("rafamadriz/friendly-snippets")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("lambdalisue/suda.vim")
	use("folke/which-key.nvim")
	use("simrat39/rust-tools.nvim")
	use("tpope/vim-surround")
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" },
	})
	use("rcarriga/nvim-notify")
	use("stevearc/dressing.nvim")
	use("moll/vim-bbye")
	use("akinsho/toggleterm.nvim")
	use("lervag/vimtex")
	use("karb94/neoscroll.nvim")
	use("ThePrimeagen/harpoon")
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate",
	})

	if packer_bootstrap then
		packer.sync()
	end
end)

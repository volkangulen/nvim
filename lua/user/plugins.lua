local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" })
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
	use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" })
	use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
	use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })
	use({ "folke/which-key.nvim", commit = "f11260251ad942ba1635db9bc25c2efaf75caf0a" })

	-- Transparency
	use({ "xiyaowong/nvim-transparent", commit = "1a3d7d3b7670fecbbfddd3fc999ddea5862ac3c2" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" })
	use({ "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" })
	use("doums/darcula")
	use("arcticicestudio/nord-vim")
	use("morhetz/gruvbox")
	use("sainnhe/gruvbox-material")
	use("NLKNguyen/papercolor-theme")
	use("gosukiwi/vim-atom-dark")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "tomasiser/vim-code-dark", commit = "f002d6d256a11c14a9de40c45a8ecb75b2292f8a" })

	-- Debugger
	use({ "mfussenegger/nvim-dap", commit = "61643680dcb771a29073cd432894e2f81a7c2ae3" })
	use({ "nvim-telescope/telescope-dap.nvim", commit = "b4134fff5cbaf3b876e6011212ed60646e56f060" })
	use({ "theHamsta/nvim-dap-virtual-text", commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4" })
	use({ "rcarriga/nvim-dap-ui", commit = "0f385f7f5268f408a546772c049271121b0d71c9" })
	use({ "mfussenegger/nvim-dap-python", commit = "27a0eff2bd3114269bb010d895b179e667e712bd" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "9bb8ee6e2d6ab3c8cc53323b79f05886bc722faa" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "45714c54fb61a61c74724f64ca3f728c30ae01d2" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", commit = "a910b4d50f7a32d2f9057d636418a16843094b7c" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters
	use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" }) -- You can run blocks of code like jupyter notebook.

	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })

	-- Poetry

	use({ "petobens/poet-v", commit = "cd4d2253f45cca679b88bf099698afb34855e84f" })

	-- --NVM
	-- use({ "marene/nvm.vim", commit = "bb3b524e1ef09977d7ba1a5870403a8b987f0ad8" })

	-- JAVA
	use({ "mfussenegger/nvim-jdtls", commit = "774a7714f9dcdfaa8d6d86831809ab941b2b7f26" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "d31c71c959348b7b15f7e69608a47aea05ed7bc6",
		-- run = function()
		-- 	require("nvim-treesitter.install").update({ with_sync = true })
		-- end,
	})
	-- Smooth scrolling
	use({ "psliwka/vim-smoothie", commit = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "2b4fc5e2ae8b546b1a2b4ab1bbc4283248e52a17" })

	use({ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" })

	use({ "hashivim/vim-terraform", commit = "f5d87cf6eebcd017a78bd6fd04b04c38a74920b4" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

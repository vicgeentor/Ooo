return {
	{
		"isovector/cornelis",
		name = "cornelis",
		ft = "agda",
		build = "",
		dependencies = { "neovimhaskell/nvim-hs.vim", "kana/vim-textobj-user" },
		version = "*",
		config = function()
			vim.g.cornelis_use_global_binary = 1

			vim.api.nvim_create_autocmd("QuitPre", {
				pattern = "*.agda",
				command = "CornelisCloseInfoWindows",
			})

			-- Auto-load on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.agda",
				command = "CornelisLoad",
			})

			-- Auto-load on open
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "agda",
				callback = function()
					vim.defer_fn(function()
						vim.cmd("CornelisLoad")
					end, 500)
				end,
			})
		end,
	},
}

return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_theme = "dark"
			-- vim.g.mkdp_preview_options = { disable_sync_scroll = 1 }

			vim.keymap.set("n", "<leader>md", function()
				vim.cmd("MarkdownPreview")
			end, { desc = "Markdown Preview dark" })
		end,
	},
}

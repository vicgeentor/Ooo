return {
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		config = function()
			require("typst-preview").setup({
				open_cmd = "zen --private-window %s",
			})

			vim.keymap.set("n", "<localLeader>t", "<cmd>TypstPreview<CR>", { desc = "Strudel Toggle Play/Pause" })
		end,
	},
}

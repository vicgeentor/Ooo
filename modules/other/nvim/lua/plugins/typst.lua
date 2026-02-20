return {
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		config = function()
			require("typst-preview").setup({
				open_cmd = "zen-twilight --private-window %s",
				-- open_cmd = "servo %s", -- might use this if some servo issues get fixed
			})

			vim.keymap.set("n", "<localLeader>t", "<cmd>TypstPreview<CR>", { desc = "Typst preview" })
		end,
	},
}

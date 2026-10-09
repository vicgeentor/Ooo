return {
	{
		"RRethy/base16-nvim",
		dependencies = { "Senal-D-A-Gunaratna/matugen.nvim" },
		config = function()
			require("matugen").setup()
		end,
	},
}

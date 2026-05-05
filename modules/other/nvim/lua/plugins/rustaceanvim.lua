return {
	{
		"mrcjkb/rustaceanvim",
		-- Setting a range to avoid being surprised by breaking changes
		version = "^9",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							completion = {
								callable = {
									snippets = "add_parentheses",
								},
							},
						},
					},
				},
			}
		end,
	},
}

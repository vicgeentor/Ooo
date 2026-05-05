return {
	{
		"saghen/blink.cmp",
		version = "1.*",

		opts = {
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			keymap = {
				preset = "default",
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
			},

			-- Auto show the documentation popup (otherwise trigger with 'C-space')
			completion = {
				documentation = { auto_show = true },
				accept = { auto_brackets = { enabled = false } },
			},

			sources = {
				default = { "lsp", "path", "buffer" },
			},

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}

return {
	"R-nvim/R.nvim",
	lazy = false,
	config = function()
		require("r").setup({
			hook = {
				on_filetype = function()
					vim.api.nvim_buf_set_keymap(0, "n", "✗", "<Plug>RDSendLine", {})
					vim.api.nvim_buf_set_keymap(0, "v", "✗", "<Plug>RSendSelection", {})
					vim.api.nvim_buf_set_keymap(0, "n", "✓", "<Plug>RDSendChunk", {})
					vim.api.nvim_buf_set_keymap(0, "v", "✓", "<Plug>RDSendChunk", {})
					vim.api.nvim_buf_set_keymap(0, "n", "<leader>f", "<Cmd>RFormat<CR>", {})
					vim.api.nvim_buf_set_keymap(
						0,
						"n",
						"<LocalLeader>sg",
						"<Cmd>RSourceDir ~/personal/R/RobDeBoer<CR>",
						{}
					)
				end,
			},
			R_args = { "--quiet", "--no-save" },
			min_editor_width = 20,
			rconsole_width = 50,
			rconsole_height = 4,
			auto_start = "always",
			objbr_auto_start = true,
			objbr_place = "console,below",
			objbr_opendf = true,
			objbr_openlist = false,
			config_tmux = false,
			pdfviewer = "okular",
			setwd = "nvim", -- working directory becomes the current nvim working directory
			chunk_hl = {
				bg = "none", -- Use a different background color
			},
		})
	end,
}

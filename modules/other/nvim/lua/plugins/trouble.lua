return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		cmd = "Trouble",
		keys = {
			-- Diagnostics
			{ "<leader>td", "<cmd>Trouble diagnostics toggle<cr>" },
			{ "[d", "<cmd>Trouble diagnostics prev jump=true<cr>" },
			{ "]d", "<cmd>Trouble diagnostics next jump=true<cr>" },

			-- Telescope
			{ "<leader>tt", "<cmd>Trouble telescope toggle<cr>" },
			{ "[t", "<cmd>Trouble telescope prev jump=true<cr>" },
			{ "]t", "<cmd>Trouble telescope next jump=true<cr>" },

			-- Todo comments
			{ "<leader>tc", "<cmd>Trouble todo toggle<cr>" },
			{ "[c", "<cmd>Trouble todo prev jump=true<cr>" },
			{ "]c", "<cmd>Trouble todo next jump=true<cr>" },
		},
	},
}

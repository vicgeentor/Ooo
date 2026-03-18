return {
	{
		"agda/cornelis",
		name = "cornelis",
		ft = "agda",
		build = "",
		dependencies = { "neovimhaskell/nvim-hs.vim", "kana/vim-textobj-user" },
		version = "*",
		config = function()
			-- Required for nix
			vim.g.cornelis_use_global_binary = 1

			-- Close the extra window when quitting inside an agda file
			vim.api.nvim_create_autocmd("QuitPre", {
				pattern = "*.agda",
				command = "CornelisCloseInfoWindows",
			})

			-- Keybindings
			local set = vim.keymap.set

			-- Core / buffer lifecycle
			set("n", "<localLeader>l", "<cmd>CornelisLoad<CR>", { desc = "Load and type-check buffer" })
			set("n", "<localLeader>?", "<cmd>CornelisGoals<CR>", { desc = "Show all goals" })
			set("n", "<localLeader>r", "<cmd>CornelisRestart<CR>", { desc = "Kill and restart the `agda` process" })
			set("n", "<localLeader>a", "<cmd>CornelisAbort<CR>", { desc = "Abort running command" })

			-- Goal / hole interaction
			set("n", "<localLeader><space>", "<cmd>CornelisGive<CR>", { desc = "Fill goal with hole contents" })
			set("n", "<localLeader>R", "<cmd>CornelisRefine<CR>", { desc = "Refine goal" })
			set(
				"n",
				"<localLeader>m",
				"<cmd>CornelisElaborate<CR>",
				{ desc = "Fill goal with normalized hole contents" }
			)
			set("n", "<localLeader>A", "<cmd>CornelisAuto<CR>", { desc = "Automatic proof search" })
			set("n", "<localLeader>c", "<cmd>CornelisMakeCase<CR>", { desc = "Case split" })

			-- Navigation in goals
			set("n", "<localLeader>f", "<cmd>CornelisNextGoal<CR>", { desc = "Jump to next goal" })
			set("n", "<localLeader>b", "<cmd>CornelisPrevGoal<CR>", { desc = "Jump to previous goal" })

			-- Type / context information
			set("n", "<localLeader>,", "<cmd>CornelisTypeContext<CR>", { desc = "Show goal type and context" })
			set(
				"n",
				"<localLeader>.",
				"<cmd>CornelisTypeContextInfer<CR>",
				{ desc = "Show goal type, context, and inferred type of hole contents" }
			)
			set("n", "<localLeader>d", "<cmd>CornelisTypeInfer<CR>", { desc = "Show inferred type of hole contents" })
			set("n", "<localLeader>n", "<cmd>CornelisNormalize<CR>", { desc = "Compute normal of hole contents" })

			-- Other useful commands
			set("n", "<localLeader>s", "<cmd>CornelisSolve<CR>", { desc = "Solve constraints" })
			set("n", "<localLeader>w", "<cmd>CornelisWhyInScope<CR>", { desc = "Show why given name is in scope" })
			set("n", "<localLeader>h", "<cmd>CornelisHelperFunc<CR>", { desc = 'Copy inferred type to register `"' })

			-- Less common / no direct Emacs equivalent
			set(
				"n",
				"<localLeader>g",
				"<cmd>CornelisGoToDefinition<CR>",
				{ desc = "Jump to definition of name at cursor" }
			)
			set("n", "<localLeader>q", "<cmd>CornelisQuestionToMeta<CR>", { desc = "Expand `?`-holes to `{! !}`" })
			set(
				"n",
				"<localLeader>i",
				"<cmd>CornelisInc<CR>",
				{ desc = "Like `<C-A>` but also targets sub- and superscripts" }
			)
			set(
				"n",
				"<localLeader>x",
				"<cmd>CornelisDec<CR>",
				{ desc = "Like `<C-X>` but also targets sub- and superscripts" }
			)
			set(
				"n",
				"<localLeader>z",
				"<cmd>CornelisCloseInfoWindows<CR>",
				{ desc = "Close (all) info windows cornelis has opened" }
			)
		end,
	},
}

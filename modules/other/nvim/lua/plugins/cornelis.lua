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
      vim.g.cornelis_max_size = 10

			-- Close the extra window when quitting inside an agda file
			vim.api.nvim_create_autocmd("QuitPre", {
				pattern = "*.agda",
				command = "CornelisCloseInfoWindows",
			})

			-- Note on textobjects
			-- iz/az: ⟨  and  ⟩
			-- ii/ai: ⦃  and  ⦄
			-- ih/ah: {! and !}

			-- Keybindings
			local set = vim.keymap.set

			set("n", "<C-c><C-l>", "<cmd>CornelisLoad<CR>", { desc = "Load and type-check buffer" })
			set("n", "<C-c>✉", "<cmd>CornelisGoals<CR>", { desc = "Show all goals" }) -- ✉ == <C-/> a.k.a. <C-?>
			set("n", "<C-c><C-x><C-r>", "<cmd>CornelisRestart<CR>", { desc = "Kill and restart the `agda` process" })
			set("n", "<C-c><C-x><C-a>", "<cmd>CornelisAbort<CR>", { desc = "Abort running command" })
			set("n", "<C-c><C-s>", "<cmd>CornelisSolve<CR>", { desc = "Solve constraints" })
			set("n", "<M-.>", "<cmd>CornelisGoToDefinition<CR>", { desc = "Jump to definition of name at cursor" })
			set("n", "gd", "<cmd>CornelisGoToDefinition<CR>", { desc = "Jump to definition of name at cursor" })
      -- Capital B because of tmux
			set("n", "<C-c><C-B>", "<cmd>CornelisPrevGoal<CR>", { desc = "Jump to previous goal" })
			set("n", "<C-c><C-f>", "<cmd>CornelisNextGoal<CR>", { desc = "Jump to next goal" })
			set("n", "<C-c><C-space>", "<cmd>CornelisGive<CR>", { desc = "Fill goal with hole contents" })
			set("n", "<C-c><C-r>", "<cmd>CornelisRefine<CR>", { desc = "Refine goal" })
			set("n", "<C-c><C-m>", "<cmd>CornelisElaborate<CR>", { desc = "Fill goal with normalized hole contents" })
			set("n", "<C-c><C-a>", "<cmd>CornelisAuto<CR>", { desc = "Automatic proof search" })
			set("n", "<C-c><C-c>", "<cmd>CornelisMakeCase<CR>", { desc = "Case split" })
			set("n", "<C-c>★", "<cmd>CornelisTypeContext<CR>", { desc = "Show goal type and context" }) -- ★ == <C-,>
			set("n", "<C-c><C-d>", "<cmd>CornelisTypeInfer<CR>", { desc = "Show inferred type of hole contents" })
			set(
				"n",
				"<C-c>󱞙", -- 󱞙 == <C-.>
				"<cmd>CornelisTypeContextInfer<CR>",
				{ desc = "Show goal type, context, and inferred type of hole contents" }
			)
			set("n", "<C-c><C-n>", "<cmd>CornelisNormalize<CR>", { desc = "Compute normal of hole contents" })
			set("n", "<C-c><C-w>", "<cmd>CornelisWhyInScope<CR>", { desc = "Show why given name is in scope" })
			set("n", "<C-c><C-h>", "<cmd>CornelisHelperFunc<CR>", { desc = 'Copy inferred type to register `"' })

			-- No direct Emacs equivalent
			set("n", "<C-c><C-q>", "<cmd>CornelisQuestionToMeta<CR>", { desc = "Expand `?`-holes to `{! !}`" })
			set(
				"n",
				"<C-c><C-i>",
				"<cmd>CornelisInc<CR>",
				{ desc = "Like `<C-A>` but also targets sub- and superscripts" }
			)
			set(
				"n",
				"<C-c><C-X>",
				"<cmd>CornelisDec<CR>",
				{ desc = "Like `<C-X>` but also targets sub- and superscripts" }
			)
			set(
				"n",
				"<C-c><C-z>",
				"<cmd>CornelisCloseInfoWindows<CR>",
				{ desc = "Close (all) info windows cornelis has opened" }
			)
		end,
	},
}

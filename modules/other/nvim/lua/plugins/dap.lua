return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		ft = { "cpp" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local set = vim.keymap.set

			-- keymaps
			set("n", "<localLeader>d", function()
				dap.continue()
			end, { desc = "Debug: Start/Continue" })
			set("n", "<localLeader>i", function()
				dap.step_into()
			end, { desc = "Debug: Step Into" })
			set("n", "<localLeader>o", function()
				dap.step_over()
			end, { desc = "Debug: Step Over" })
			set("n", "<localLeader>O", function()
				dap.step_out()
			end, { desc = "Debug: Step Out" })
			set("n", "<localLeader>b", function()
				dap.toggle_breakpoint()
			end, { desc = "Debug: Toggle Breakpoint" })
			set("n", "<localLeader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			set("n", "<localLeader>t", function()
				dapui.toggle()
			end, { desc = "Debug: toggle UI" })

			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- Adapters
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = "/home/vic/Documents/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7",
			}

			-- Configurations
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
				},
			}
		end,
	},
}

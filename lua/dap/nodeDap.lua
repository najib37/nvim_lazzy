return {
	"mxsdev/nvim-dap-vscode-js",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	lazy = false,
	config = function()
		require("dap-vscode-js").setup({
			-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
			debugger_path = "/home/vscode-js-debug", -- Path to vscode-js-debug installation.
			-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
			adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
			-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
			-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
		})
		require"dap".configurations.javascript = {
			{
				name = "node-terminal",
				type = "node-terminal",
				request = "attach",
				sourceMaps = true,
				trace = true,
				port = 9229,
				webRoot = "${workspaceFolder}"
			},
			{
				name = "pwa-node cli",
				type = "pwa-node",
				request = "attach",
				sourceMaps = true,
				trace = true,
				port = 9229,
				webRoot = "${workspaceFolder}"
			}
			-- to be completed when added to the actual config
		}
	end
}

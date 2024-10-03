local colorscheme = "dracula"
local dracula = require("dracula")
local colors = require("dracula").colors()

dracula.setup({
	overrides = {
		LspDiagnosticsUnderlineError = { fg = colors.red, underline = true },
		LspDiagnosticsUnderlineWarning = { fg = colors.yellow, underline = true },
		LspDiagnosticsUnderlineInformation = { fg = colors.cyan, underline = true },
		LspDiagnosticsUnderlineHint = { fg = colors.cyan, underline = true },

		DiagnosticUnderlineError = { underline = true, sp = colors.red },
		DiagnosticUnderlineWarn = { underline = true, sp = colors.yellow },
		DiagnosticUnderlineInfo = { underline = true, sp = colors.cyan },
		DiagnosticUnderlineHint = { underline = true, sp = colors.cyan },
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

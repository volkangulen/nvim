local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- DEBUG
keymap("i", "<leader>`", ':lua require"copilot".copilot#Accept<CR>', opts)

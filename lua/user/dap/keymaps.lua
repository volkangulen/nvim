local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- DEBUG
keymap("n", "<F9>", ':lua require"dap".toggle_breakpoint()<CR>', opts)
keymap("n", "<leader><F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>1", ':lua require"dap".step_out()<CR>', opts)
keymap("n", "<leader>2", ':lua require"dap".step_into()<CR>', opts)
keymap("n", "<leader>3", ':lua require"dap".step_over()<CR>', opts)
keymap("n", "<leader>4", ':lua require"dap".continue()<CR>', opts)
keymap("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>', opts)
keymap("n", "<leader>dk", ':lua require"dap".up()<CR>', opts)
keymap("n", "<leader>dj", ':lua require"dap".down()<CR>', opts)
keymap("n", "<leader>dc", ':lua require"dap".terminate()<CR>', opts)
keymap("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', opts)
keymap("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)
keymap("n", "<leader>da", ':lua require"user.dap.dap".attach()<CR>', opts)
keymap("n", "<leader>dA", ':lua require"user.dap.dap".attachToRemote()<CR>', opts)
keymap("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>', opts)
keymap("v", "<leader>di", ':lua require"dap.ui.variables".visual_hover()<CR>', opts)
keymap("n", "<leader>d/", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', opts)
keymap("n", "<leader>dl", ':lua require"dap.ext.vscode".load_launchjs()<CR>', opts)

-- nvim-telescope/telescope-dap.nvim
keymap("n", "<leader>ds", ":Telescope dap frames<CR>", opts)
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
keymap("n", "<leader>db", ":Telescope dap list_breakpoints<CR>", opts)

keymap("n", "<leader>dq", ':lua require"dapui".toggle()<CR>', opts)

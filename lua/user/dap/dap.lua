local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
-- local utils_ok, utils = pcall(require, "user.dap.utils")
-- if not utils_ok then
-- 	return
-- end

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { "/opt/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		program = "${cwd}/src/main.ts",
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}
dap.set_log_level("TRACE")
dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "none" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "🛑", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "•", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapBreakpointRejected", { text = "•", texthl = "blue", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "•", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

local function debugJest(testName, filename)
	print("starting " .. testName .. " in " .. filename)
	dap.run({
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "--inspect-brk", "/usr/local/bin/jest", "--no-coverage", "-t", testName, "--", filename },
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
		console = "integratedTerminal",
		port = 9229,
	})
end

local function attach()
	print("attaching")
	dap.run({
		type = "node2",
		request = "attach",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	})
end

local function attachToRemote(port)
	print("attaching to remote " .. port)
	dap.run({
		type = "node2",
		request = "attach",
		address = "127.0.0.1",
		port = port,
		localRoot = vim.fn.getcwd(),
		-- -- remoteRoot = "/home/vcap/app",
		remoteRoot = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	})
end

return {
	debugJest = debugJest,
	attach = attach,
	attachToRemote = attachToRemote,
}

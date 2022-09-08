local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
	return
end

local function getPythonPath()
	-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
	-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
	-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
	local cwd = vim.fn.getcwd()
	if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		return cwd .. "/venv/bin/python"
	elseif vim.fn.executable(cwd .. "../venv/bin/python") == 1 then
		return cwd .. "../venv/bin/python"
	else
		return "/usr/bin/python"
	end
end
dap_python.setup(getPythonPath())

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local yamllint = {
	method = null_ls.methods.FORMATTING,
	filetypes = { "yaml", "yaml.docker-compose" },
	generator = null_ls.formatter({
		command = "yamllint",
		args = { "-c", vim.fn.getcwd() .. "/.yamllint" },
	}),
}

null_ls.setup({

	debug = true,
	sources = {
		formatting.prettier.with({
			extra_args = { "--config-path", vim.fn.getcwd() .. "/.prettierrc" },
		}),
		yamllint,
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.stylua,
		formatting.prettier,
		formatting.google_java_format,
		-- diagnostics.flake8.with({
		-- 	prefer_local = ".flake8",
		-- }),
		diagnostics.pylint.with({
			_ENV = function(params)
				return { PYTHONPATH = params.root }
			end,
		}),
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
	           augroup LspFormatting
	               autocmd! * <buffer>
	               autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }
	           augroup END
	           ]])
		end
	end,
})

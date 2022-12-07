local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({

	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = { "--config-path", vim.fn.getcwd() .. "/.prettierrc" },
		}),
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.stylua,
		formatting.prettier,
		formatting.google_java_format,
		diagnostics.flake8.with({
			prefer_local = ".flake8",
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

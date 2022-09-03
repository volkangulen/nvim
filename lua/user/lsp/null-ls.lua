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
			-- extra_args = {
			-- 	"--single-quote",
			-- 	-- "--jsx-single-quote",
			-- 	"--tab-width 2",
			-- 	"--print-width 100",
			-- 	"--trailing-comma all",
			-- },
		}),
		formatting.black.with({
			extra_args = { "--fast", "--config-path", vim.fn.getcwd() .. "/.pyproject.toml" },
		}),
		formatting.stylua,
		formatting.prettier,
		formatting.google_java_format,
		diagnostics.flake8.with({
			extra_args = { "--config-path", vim.fn.getcwd() .. "/.flake8" },
		}),
	},
	-- on_attach = function(client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd([[
	--            augroup LspFormatting
	--                autocmd! * <buffer>
	--                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	--            augroup END
	--            ]])
	-- 	end
	-- end,
})

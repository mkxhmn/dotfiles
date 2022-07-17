local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml", "md", "yaml", "yml" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,

		diagnostics.eslint,
		diagnostics.cspell.with({
			filetypes = {
				"bash",
				"css",
				"lua",
				"docker",
				"go",
				"rust",
				"json",
				"yaml",
				"markdown",
				"typescriptreact",
				"typescript",
				"javascript",
				"javascriptreact",
			},
			extra_args = {
				"--config",
				vim.fn.expand("~/.dotfiles/cspell/cspell.json"),
				"--show-suggestions",
        "-v"
			},
		}),

		code_actions.eslint,
		code_actions.gitsigns,
	},
})

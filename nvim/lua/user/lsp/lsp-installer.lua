local typescript_ok, typescript = pcall(require, "typescript")
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"bashls",
	"cssls",
	"emmet_ls",
	"gopls",
	"yamlls",
	"html",
	"jsonls",
	"marksman",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"vimls",
	"tsserver",
}

lsp_installer.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"emmet_ls",
		"gopls",
		"yamlls",
		"html",
		"jsonls",
		"marksman",
		"pyright",
		"rust_analyze",
		"sumneko_lua",
		"tsserver",
		"vimls",
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "yamlls" then
		local yamlls_opts = require("user.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	if server == "tsserver" and typescript_ok then
		local handlers = require("user.lsp.handlers")
		typescript.setup({
			disable_commands = false,
			debug = false,
			server = {
				capabilities = opts.capabilities,
				on_attach = opts.on_attach,
				handlers = handlers.handlers,
			},
		})
	end

	if server ~= "tsserver" then
		lspconfig[server].setup(opts)
	end
end

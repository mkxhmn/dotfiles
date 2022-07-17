local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}

local relative_path_from_root = function()
	local path = vim.fn.expand("%")
	local workspace = vim.lsp.buf.list_workspace_folders()

	if workspace[1] ~= nil then
		return path:gsub("%" .. workspace[1], "")
	end

	return path
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = "",
		disabled_filetypes = { "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { diagnostics, "%=", relative_path_from_root },
		lualine_x = { diff, filetype },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
})

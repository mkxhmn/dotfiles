local status_ok, onedark = pcall(require, "onedark")
if status_ok then
	onedark.setup({
		style = "deep",
		transparent = true,
	})
	onedark.load()
end

local status_ok_kanagawa, kanagawa = pcall(require, "kanagawa")
if status_ok_kanagawa then
	kanagawa.setup({
		commentStyle = { italic = true },
		keywordStyle = { italic = true, bold = true },
		transparent = true, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	})
end

local status_ok_tokyonight, tokyonight = pcall(require, "tokyonight")
if status_ok_tokyonight then
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_transparent =true
end

vim.cmd("colorscheme kanagawa")

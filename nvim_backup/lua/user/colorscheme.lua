local colorscheme = "kanagawa"

local status_ok, _ = pcall(vim.cmd, "colorscheme kanagawa")
if not status_ok then
  return
end

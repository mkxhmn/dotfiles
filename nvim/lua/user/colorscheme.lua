local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

onedark.setup({
  style = "deep"
})

onedark.load()

local status_onedarkpro_ok, onedarkpro = pcall(require, "onedarkpro")

if not status_onedarkpro_ok then
  return
end

onedarkpro.setup({
  theme="onedark_vivid"
})


vim.cmd("colorscheme onedark")


local status_ok, colorizer = pcall(require, "colorizer")

if not status_ok then
	return "unable to setup colorizer"
end

colorizer.setup({
  "*",
  "!vim",
  "!js",
  "!ts",
})

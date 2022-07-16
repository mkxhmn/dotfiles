return {
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
			},
			schemas = {
				["https://json.schemastore.org/github-action.json"] = "/.github/workflows/*.yml",
			},
		},
	},
}

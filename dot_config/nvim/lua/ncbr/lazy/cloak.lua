return {
	"laytan/cloak.nvim",
	opts = {
		enabled = true,
		cloak_character = "*",

		highlight_group = "Comment",
		patterns = {
			{
				file_pattern = {
					".env*",
					"wrangler.toml",
					".dev.vars",
					"*.properties",
				},
				cloak_pattern = "=.+",
			},
		},
	},
}

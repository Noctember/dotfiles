return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	commit = "*",
	priority = 50, -- lower then colorscheme
	opts = {
		options = {
			indicator = {
				style = "none",
			},
			separator_style = { "", "" },
			offsets = {
				{
					filetype = "NvimTree",
					text = "   Nvim Tree",
					text_align = "left",
					highlight = "Directory",
					separator = "│",
				},
				{
					filetype = "undotree",
					text = "   Undotree",
					text_align = "left",
					highlight = "Directory",
					separator = "│",
				},
			},
		},
	},
}

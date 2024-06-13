return {
	'echasnovski/mini.statusline',
	opts = {
		use_icons = true,
	},
	config = function ()
		local sl = require('mini.statusline')
		sl.setup {
			use_icons = true,
		}

		sl.section_location = function (args)
			return '%2l:%-2v'
		end
	end
}

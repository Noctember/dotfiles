return {
	'echasnovski/mini.statusline',
	opts = {
		use_icons = true,
	},
	config = function ()
		local sl = require('mini.statusline')

		sl.section_location = function ()
			return '%2l:%-2v'
		end
	end
}

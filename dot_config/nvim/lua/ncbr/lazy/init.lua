return {
	'eandrju/cellular-automaton.nvim',
	'wakatime/vim-wakatime',
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true
	},
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		opts = {
			signs = false
		}
	},
	{
		'xvzc/chezmoi.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
		},
	},
	{
		'pocco81/auto-save.nvim',
		event = 'InsertEnter',
		opts = {
			enabled = true,
		},
	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'User FilePost',
		opts = {
		},
	}
}

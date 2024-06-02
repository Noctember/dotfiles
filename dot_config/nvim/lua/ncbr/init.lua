require('ncbr.set')
require('ncbr.lazy_init')
require('ncbr.remap')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})
local ncbr_group = augroup('ncbr', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

autocmd('LspAttach', {
	group = ncbr_group,
	callback = function (event)
		local opts = { buffer = event.buf }
		local map = vim.keymap.set

		map('n', 'gd', vim.lsp.buf.definition, opts)
		map('n', 'gi', vim.lsp.buf.implementation, opts)
		map('n', 'gr', vim.lsp.buf.references, opts)
		map('n', '<C-.>', require('actions-preview').code_actions, opts)

		map('n', '<leader>F', function ()
			require('conform').format {
				lsp_fallback = true,
				quiet = true,
			}
		end)
	end
})

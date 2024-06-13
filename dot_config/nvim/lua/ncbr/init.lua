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


-- local mygroup = augroup('ziglings', { clear = true })
-- autocmd({"BufEnter"}, {
--     pattern = { "[0123456789][0123456789][0123456789]_*.zig" },
--     group = mygroup,
--     callback = function(t)
--         local file = vim.fn.fnamemodify(t.file, ":t")
--         local n = file:sub(0, 3)
--         n = string.format("%i", n)
--         -- vim.o.makeprg = 'zig build -Dn=' .. n
-- 
--         local nf = vim.fn.glob(string.format("exercises/%03i_*", n+1))
--         local pf = vim.fn.glob(string.format("exercises/%03i_*", n-1))
-- 
--         vim.keymap.set('n', '<leader>n', '<cmd>e ' .. nf .. '<cr>')
--         vim.keymap.set('n', '<leader>p', '<cmd>e ' .. pf .. '<cr>')
-- 
--         vim.keymap.set('n', '<leader>m', '<cmd>vert sp term://zig build -Dn=' .. n .. '<cr>')
--     end,
-- })

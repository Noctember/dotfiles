local map = vim.keymap.set

map('n', 'Q', '<nop>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- map({"n", "v"}, "<leader>y", [["+y]])
-- map("n", "<leader>Y", [["+Y]])

map('n', '<C-k>', '<cmd>cnext<CR>zz')
map('n', '<C-j>', '<cmd>cprev<CR>zz')
map('n', '<leader>k', '<cmd>lnext<CR>zz')
map('n', '<leader>j', '<cmd>lprev<CR>zz')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')

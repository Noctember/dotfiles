vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.undordir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.colorcolumn = '80'

vim.g.mapleader = ' '

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

if jit.os == "Windows" then
	vim.g.undotree_DiffCommand = "git diff"
end

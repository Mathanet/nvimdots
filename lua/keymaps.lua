vim.g.mapleader = " "

-- https://github.com/
-- vim.keymap.set({mode}, {lhs}, {rhs}, )
local silent = { silent = true }
vim.keymap.set('n', 'Q', ':q<cr>', silent)
vim.keymap.set('n', 'S', ':w<cr>', silent)
vim.keymap.set('n', '<C-h>', '<C-w>h', silent)
vim.keymap.set('n', '<C-j>', '<C-w>j', silent)
vim.keymap.set('n', '<C-k>', '<C-w>k', silent)
vim.keymap.set('n', '<C-l>', '<C-w>l', silent)
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<leader>so', ':source %<cr>', { silent = true })
vim.keymap.set('n', '<leader>h', ':nohl<cr>', { silent = true })
vim.keymap.set('n', 'g=', 'ggVG=<c-o>', { desc = "File Formated" })

-- use <up> and <down> to move up or down in command line's pop up menu
vim.keymap.set('c', '<down>', function()
	if vim.fn.pumvisible() == 1 then return '<c-n>' end
	return '<down>'
end, { expr = true })
vim.keymap.set('c', '<up>', function()
	if vim.fn.pumvisible() == 1 then return '<c-p>' end
	return '<up>'
end, { expr = true })

-- Window & splits
vim.keymap.set('n', '<leader>sk', ':set nosplitbelow<cr>:split<cr>:set splitbelow<cr>', { silent = true })
vim.keymap.set('n', '<leader>sj', ':split<cr>', { silent = true })
vim.keymap.set('n', '<leader>sl', ':vsplit<cr>', { silent = true })
vim.keymap.set('n', '<leader>sh', ':set nosplitright<cr>:vsplit<cr>:set splitright<cr>', { silent = true })

vim.keymap.set('n', '<A-]>', ':vertical resize +2<cr>', { silent = true })
vim.keymap.set('n', '<A-[>', ':vertical resize -2<cr>', { silent = true })
vim.keymap.set('n', "<A-'>", ':resize +2<cr>', { silent = true })
vim.keymap.set('n', '<A-;>', ':resize -2<cr>', { silent = true })

-- Tabs
vim.keymap.set('n', '<leader>tn', ':tabe<cr>', silent)
vim.keymap.set('n', '<leader>th', ':-tabnext<cr>', silent)
vim.keymap.set('n', '<leader>tl', ':+tabnext<cr>', silent)
vim.keymap.set('n', '<leader>ts', ':tab split<cr>', silent)

return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function() -- :h bufferline-configuration
		require('bufferline').setup{
			options = {
				mode = "buffers",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = '|', -- use a "true" to enable the default, or set your own character
					}
				}
			}
		}
		vim.keymap.set('n', '<a-h>', ':BufferLineCyclePrev<cr>', { silent = true })
		vim.keymap.set('n', '<a-l>', ':BufferLineCycleNext<cr>', { silent = true })
	end,
}

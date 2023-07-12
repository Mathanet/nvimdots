return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function() -- :h bufferline-configuration
		require('bufferline').setup{
			options = {
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
	end,
}

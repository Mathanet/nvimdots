local mocha = require("catppuccin.palettes").get_palette("mocha")
return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require('hlchunk').setup({
			chunk = {
				enable = true,
				use_treesitter = true,
				style = mocha.yellow,
				chars = {
					right_arrow = "➤",
				}
			},
			indent = {
				enable = true,
				use_treesitter = false,
				chars = { "│" }, -- more code can be found in https://unicodeplus.com/
				style = {mocha.surface0},
			},
			blank = {
				enable = false,
			},
			line_num = {
				style = mocha.subtext0,
			}
		})
	end
}

return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		'kevinhwang91/promise-async',
	},
	config = function ()
		-- folds
		vim.opt.foldcolumn = '1' -- '0' is not bad
		vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true

		vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
		vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

		require('ufo').setup({
			provider_selector = nil
		})
	end
}


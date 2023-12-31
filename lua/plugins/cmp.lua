return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require('luasnip')
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(
					0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<CR>'] = function(fallback)
						if cmp.visible() then
							cmp.confirm()
						else
							fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
						end
					end,
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
							-- they way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					['<C-Space>'] = cmp.mapping.complete(),
				}),
				sources =	cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
					{ name = 'buffer' },
				}),
				experimental = {
					ghost_text = true,
				},
			}

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
					{ name = 'cmdline' },
				})
			})
		end
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end
	},
}

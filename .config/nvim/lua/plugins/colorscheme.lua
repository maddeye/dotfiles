return {
	{
		"nordtheme/vim",
		priority = 1000, -- make sure to load this before all others
		config = function()
			--load colorscheme
			vim.cmd([[colorscheme nord]])
		end,
	},
}

local opt = vim.opt

opt.termguicolors = true

opt.ignorecase = true
opt.smartcase = true

opt.wrap = false
--opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"

opt.number = true
opt.relativenumber = true

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.incsearch = true

opt.updatetime = 50

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.clipboard:append('unnamedplus')

opt.splitright = true
opt.splitbelow = true

--opt.list = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.isfname:append("@-@")

opt.updatetime = 50

vim.g.mapleader = " "

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

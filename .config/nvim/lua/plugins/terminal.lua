return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-t>]],
      direction = "float",
    })

    vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
  end,
}

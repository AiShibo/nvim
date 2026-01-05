return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      open_mapping = [[<leader>tt]],
      start_in_insert = true,
      shade_terminals = false,
    })
  end,
}


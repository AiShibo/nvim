return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      open_mapping = nil,
      start_in_insert = false,
      shade_terminals = false,
    })

    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {
      silent = true,
      desc = "Toggle terminal",
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      group = vim.api.nvim_create_augroup("ToggletermKeymaps", { clear = true }),
      pattern = "term://*toggleterm#*",
      callback = function(event)
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
          buffer = event.buf,
          silent = true,
          desc = "Exit terminal mode",
        })
      end,
    })
  end,
}

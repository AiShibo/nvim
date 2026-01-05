return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,

      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },

      window = {
        position = "left",
        width = 32,
      },
    })

    vim.keymap.set(
      "n",
      "<leader>e",
      "<cmd>Neotree toggle<CR>",
      { silent = true, desc = "Explorer (neo-tree)" }
    )
  end,
}



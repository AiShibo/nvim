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
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        indent = {
          with_expanders = false,
          indent_marker = "|",
          last_indent_marker = "|",
        },
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "U",
            ignored = "I",
            unstaged = "?",
            staged = "S",
            conflict = "!",
          },
        },
      },

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

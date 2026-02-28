return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2500,
      background_colour = "#000000",
      stages = "static",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      lsp = {
        progress = { enabled = false },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    config = function(_, opts)
      require("notify").setup({
        timeout = 2500,
        background_colour = "#000000",
        stages = "static",
      })
      vim.notify = require("notify")
      require("noice").setup(opts)
    end,
  },
}

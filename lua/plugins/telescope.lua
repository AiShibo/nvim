return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        initial_mode = "normal",
        sorting_strategy = "ascending",
        selection_strategy = "reset",
        layout_config = {
          prompt_position = "top",
        },
      },
      extensions = {
        file_browser = {
          initial_mode = "normal",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
        },
      },
    })

    telescope.load_extension("file_browser")

    vim.keymap.set( "n", "<leader>ff", "<cmd>Telescope file_browser<CR>", 
	    { silent = true, desc = "Search files (browser)" })
    vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })

    vim.keymap.set("n", "<leader>sg", function()
	    require("telescope.builtin").live_grep()
    end, { desc = "Live grep (content search)" })

  end,
}

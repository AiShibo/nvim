return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local tag = "I"
          if level:match("error") then
            tag = "E"
          elseif level:match("warning") then
            tag = "W"
          end
          return string.format(" %s%d", tag, count)
        end,
        indicator = { style = "none" },
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = "thin",
        always_show_bufferline = true,
      },
    })

    -- Always operate on the main (non-sidebar) window so the left file tree
    -- doesn't get replaced by buffer switching.
    local function focus_main_win()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.bo[buf].filetype
        if ft ~= "neo-tree" and ft ~= "NvimTree" then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
    end

    local function main_then(cmd)
      return function()
        focus_main_win()
        vim.cmd(cmd)
      end
    end

    -- Navigation (always in main window)
    vim.keymap.set("n", "<S-l>", main_then("BufferLineCycleNext"), { silent = true, desc = "Next buffer" })
    vim.keymap.set("n", "<S-h>", main_then("BufferLineCyclePrev"), { silent = true, desc = "Prev buffer" })

    -- Close buffers (bufferline native commands; always in main window)
    vim.keymap.set("n", "<leader>dr", main_then("BufferLineCloseRight"),
      { silent = true, desc = "Close buffers to the right" })

    vim.keymap.set("n", "<leader>dl", main_then("BufferLineCloseLeft"),
      { silent = true, desc = "Close buffers to the left" })

    vim.keymap.set("n", "<leader>do", main_then("BufferLineCloseOthers"),
      { silent = true, desc = "Close other buffers" })

    vim.keymap.set("n", "<leader>da", main_then("BufferLineCloseAll"),
      { silent = true, desc = "Close all buffers" })

    -- Delete current buffer
    vim.keymap.set("n", "<leader>bd", main_then("bdelete"),
      { silent = true, desc = "Delete current buffer" })
  end,
}

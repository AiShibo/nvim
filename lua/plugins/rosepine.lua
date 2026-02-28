return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    local state_file = vim.fn.stdpath("state") .. "/theme-mode.txt"

    local function read_mode()
      if vim.fn.filereadable(state_file) == 0 then
        return "dark"
      end
      local lines = vim.fn.readfile(state_file)
      if #lines > 0 and (lines[1] == "light" or lines[1] == "dark") then
        return lines[1]
      end
      return "dark"
    end

    local function write_mode(mode)
      vim.fn.mkdir(vim.fn.fnamemodify(state_file, ":h"), "p")
      vim.fn.writefile({ mode }, state_file)
    end

    local function apply_mode(mode)
      local is_light = mode == "light"
      vim.o.background = is_light and "light" or "dark"

      require("rose-pine").setup({
        variant = is_light and "dawn" or "moon",
        disable_background = false,
        disable_float_background = false,
        palette = {
          moon = {
            base = "#0a0a0a",
            surface = "#121212",
            overlay = "#1b1b1b",
            muted = "#8f8f8f",
            subtle = "#b4b4b4",
            text = "#f1f1f1",
            none = "NONE",
          },
          dawn = {
            base = "#f7f2e8",
            surface = "#efe7d8",
            overlay = "#e4dac8",
            muted = "#6f655a",
            subtle = "#554c43",
            text = "#1f1a14",
            none = "NONE",
          },
        },
      })

      vim.cmd.colorscheme("rose-pine")

      if is_light then
        local hl = vim.api.nvim_set_hl
        hl(0, "Normal", { fg = "#1f1a14", bg = "#f7f2e8" })
        hl(0, "NormalNC", { fg = "#2a241d", bg = "#f4ecdd" })
        hl(0, "SignColumn", { bg = "#f7f2e8" })
        hl(0, "LineNr", { fg = "#8d7f70", bg = "#f7f2e8" })
        hl(0, "CursorLineNr", { fg = "#3d342b", bg = "#efe7d8", bold = true })
        hl(0, "StatusLine", { fg = "#2e261e", bg = "#e4dac8", bold = true })
        hl(0, "StatusLineNC", { fg = "#7a6e5f", bg = "#efe7d8" })
        hl(0, "WinBar", { fg = "#2e261e", bg = "#e4dac8", bold = true })
        hl(0, "WinBarNC", { fg = "#7a6e5f", bg = "#efe7d8" })
        hl(0, "TabLine", { fg = "#6f655a", bg = "#efe7d8" })
        hl(0, "TabLineSel", { fg = "#1f1a14", bg = "#e4dac8", bold = true })
      end

      pcall(function()
        require("lualine").refresh()
      end)
    end

    local current_mode = read_mode()
    apply_mode(current_mode)

    vim.api.nvim_create_user_command("ThemeToggle", function()
      current_mode = current_mode == "dark" and "light" or "dark"
      apply_mode(current_mode)
      write_mode(current_mode)
      vim.notify("Theme: " .. current_mode, vim.log.levels.INFO)
    end, { desc = "Toggle between dark and light theme" })

    vim.keymap.set("n", "<leader>tw", "<cmd>ThemeToggle<CR>", {
      silent = true,
      desc = "Toggle theme (dark/light)",
    })
  end,
}

return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      disable_background = true, -- keep terminal background
      disable_float_background = true,
      palette = {
        moon = {
          base = "#0b1020",
          surface = "#111b2e",
          overlay = "#16223a",
          muted = "#7b8da3",
          subtle = "#9bb2c8",
          text = "#d9e8f5",
          love = "#ff7aa2",
          gold = "#ffd166",
          rose = "#8de3ff",
          pine = "#65d6ad",
          foam = "#8cc2ff",
          iris = "#c4a7ff",
          highlight_low = "#0f172a",
          highlight_med = "#152038",
          highlight_high = "#1a2a48",
          none = "NONE",
        },
      },
    })

    vim.cmd.colorscheme("rose-pine")

    -- Extra safety: force transparent for common groups (some plugins override)
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("TransparentBG", { clear = true }),
      callback = function()
        for _, g in ipairs({
          "Normal",
          "NormalNC",
          "NormalFloat",
          "SignColumn",
          "FoldColumn",
          "EndOfBuffer",
          "MsgArea",
        }) do
          vim.api.nvim_set_hl(0, g, { bg = "NONE" })
        end
      end,
    })
  end,
}

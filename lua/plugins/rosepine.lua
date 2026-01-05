return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      disable_background = true, -- keep terminal background
      disable_float_background = true,
    })

    vim.cmd.colorscheme("rose-pine-moon")

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


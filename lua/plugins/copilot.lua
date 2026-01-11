return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("n", "<leader>ifr", "<cmd>Copilot enable<CR>", { silent = true, desc = "Enable Copilot" })
    vim.keymap.set("n", "<leader>vfr", "<cmd>Copilot disable<CR>", { silent = true, desc = "Disable Copilot" })
  end,
}

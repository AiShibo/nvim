return {
  "kamykn/spelunker.vim",
  config = function()
    vim.o.spell = true
    vim.o.spelllang = "en_us"
    vim.g.spelunker_check_type = 1
    vim.g.spelunker_highlight_type = 1
    vim.g.spelunker_highlight_theme = "SpellBad"
    vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "red" })
  end,
}

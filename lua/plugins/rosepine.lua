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
            base    = "#f9f9fb",
            surface = "#f0eef5",
            overlay = "#e6e3ee",
            muted   = "#9893a5",
            subtle  = "#6e6a86",
            text    = "#24213a",
            love    = "#b4637a",
            gold    = "#ea9d34",
            rose    = "#d7827e",
            pine    = "#286983",
            foam    = "#56949f",
            iris    = "#907aa9",
            none    = "NONE",
          },
        },
      })

      vim.cmd.colorscheme("rose-pine")

      if is_light then
        local hl = vim.api.nvim_set_hl
        local bg      = "#f9f9fb"
        local surface = "#f0eef5"
        local overlay = "#e6e3ee"
        local fg      = "#24213a"
        local fgmuted = "#6e6a86"
        local fgdim   = "#9893a5"

        -- Base UI
        hl(0, "Normal",        { fg = fg,      bg = bg })
        hl(0, "NormalNC",      { fg = fg,      bg = surface })
        hl(0, "NormalFloat",   { fg = fg,      bg = overlay })
        hl(0, "FloatBorder",   { fg = fgdim,   bg = overlay })
        hl(0, "SignColumn",    { bg = bg })
        hl(0, "CursorLine",    { bg = surface })
        hl(0, "ColorColumn",   { bg = surface })

        -- Line numbers
        hl(0, "LineNr",        { fg = fgdim,   bg = bg })
        hl(0, "CursorLineNr",  { fg = "#907aa9", bg = surface, bold = true })

        -- Status / winbar
        hl(0, "StatusLine",    { fg = fg,      bg = overlay, bold = false })
        hl(0, "StatusLineNC",  { fg = fgdim,   bg = surface })
        hl(0, "WinBar",        { fg = fgmuted, bg = surface })
        hl(0, "WinBarNC",      { fg = fgdim,   bg = bg })
        hl(0, "TabLine",       { fg = fgdim,   bg = surface })
        hl(0, "TabLineSel",    { fg = fg,      bg = overlay, bold = true })
        hl(0, "TabLineFill",   { bg = surface })

        -- Pmenu (autocomplete)
        hl(0, "Pmenu",         { fg = fg,      bg = overlay })
        hl(0, "PmenuSel",      { fg = bg,      bg = "#907aa9", bold = true })
        hl(0, "PmenuSbar",     { bg = surface })
        hl(0, "PmenuThumb",    { bg = fgdim })

        -- Cursor
        hl(0, "Cursor",        { fg = "#faf8f5", bg = "#b4637a" })
        hl(0, "CursorIM",      { fg = "#faf8f5", bg = "#b4637a" })
        hl(0, "lCursor",       { fg = "#faf8f5", bg = "#b4637a" })
        vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50-Cursor"

        -- Search / selection
        hl(0, "Visual",        { bg = "#ddd8f0" })
        hl(0, "Search",        { fg = "#24213a", bg = "#f4d8a1", bold = true })
        hl(0, "IncSearch",     { fg = "#faf8f5", bg = "#ea9d34", bold = true })

        -- Syntax
        hl(0, "Comment",       { fg = "#a8a4be", italic = true })
        hl(0, "Keyword",       { fg = "#b4637a", bold = true })
        hl(0, "Conditional",   { fg = "#b4637a", bold = true })
        hl(0, "Repeat",        { fg = "#b4637a", bold = true })
        hl(0, "Function",      { fg = "#286983", bold = true })
        hl(0, "String",        { fg = "#56949f" })
        hl(0, "Number",        { fg = "#ea9d34" })
        hl(0, "Boolean",       { fg = "#ea9d34", bold = true })
        hl(0, "Type",          { fg = "#907aa9" })
        hl(0, "Identifier",    { fg = fg })
        hl(0, "Operator",      { fg = "#d7827e" })
        hl(0, "Constant",      { fg = "#ea9d34" })
        hl(0, "PreProc",       { fg = "#d7827e" })
        hl(0, "Special",       { fg = "#d7827e" })

        -- Treesitter
        hl(0, "@keyword",           { fg = "#b4637a", bold = true })
        hl(0, "@keyword.function",  { fg = "#b4637a", bold = true })
        hl(0, "@keyword.return",    { fg = "#b4637a", bold = true })
        hl(0, "@function",          { fg = "#286983", bold = true })
        hl(0, "@function.builtin",  { fg = "#286983" })
        hl(0, "@method",            { fg = "#286983" })
        hl(0, "@string",            { fg = "#56949f" })
        hl(0, "@number",            { fg = "#ea9d34" })
        hl(0, "@boolean",           { fg = "#ea9d34", bold = true })
        hl(0, "@type",              { fg = "#907aa9" })
        hl(0, "@type.builtin",      { fg = "#907aa9", bold = true })
        hl(0, "@variable",          { fg = fg })
        hl(0, "@parameter",         { fg = "#56949f" })
        hl(0, "@property",          { fg = "#286983" })
        hl(0, "@comment",           { fg = "#a8a4be", italic = true })
        hl(0, "@operator",          { fg = "#d7827e" })
        hl(0, "@punctuation",       { fg = fgmuted })
        hl(0, "@constant",          { fg = "#ea9d34" })
        hl(0, "@constant.builtin",  { fg = "#ea9d34", bold = true })
        hl(0, "@tag",               { fg = "#b4637a" })
        hl(0, "@tag.attribute",     { fg = "#ea9d34" })

        -- Git signs
        hl(0, "GitSignsAdd",    { fg = "#3d8c5e" })
        hl(0, "GitSignsChange", { fg = "#ea9d34" })
        hl(0, "GitSignsDelete", { fg = "#b4637a" })

        -- Borders / separators
        hl(0, "VertSplit",     { fg = overlay, bg = bg })
        hl(0, "WinSeparator", { fg = overlay })
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

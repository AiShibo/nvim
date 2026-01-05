-- ~/.config/nvim/lua/config/options.lua
-- Global options (recommended baseline)

local opt = vim.opt

-- Leader keys (set early)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs / indentation: 4 spaces
opt.expandtab = true      -- use spaces instead of tabs
opt.tabstop = 4           -- a <Tab> counts as 4 spaces
opt.shiftwidth = 4        -- indent width
opt.softtabstop = 4       -- <Tab>/<BS> insert-mode behavior
opt.smartindent = true
opt.autoindent = true

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Clipboard (share with OS clipboard)
opt.clipboard = "unnamedplus"

-- Mouse (optional; disable if you hate it)
opt.mouse = "a"

-- Undo / backup / swap (recommended)
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Faster updates / better responsiveness
opt.updatetime = 200
opt.timeoutlen = 400

-- Completion behavior
opt.completeopt = { "menu", "menuone", "noselect" }

-- Whitespace display (optional)
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- More natural command-line completion
opt.wildmode = { "longest:full", "full" }

-- Safer splits when closing
opt.hidden = true

-- Keep indentation consistent when using >> and <<
opt.shiftround = true


vim.opt.list = false
vim.opt.listchars = {}



-- Add keymap for switching between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Window right" })


-- add keybinding for window splitting
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { silent = true, desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>",  { silent = true, desc = "Horizontal split" })
vim.opt.splitright = true
vim.opt.splitbelow = true

-- make lualine span the entiew terminal window
vim.opt.laststatus = 3


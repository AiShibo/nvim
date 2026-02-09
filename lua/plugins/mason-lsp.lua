return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },

  config = function(_, opts)
    -- keep mason-lspconfig's default setup
    require("mason-lspconfig").setup(opts)

    -- LSP keymaps (buffer-local) when a server attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
      callback = function(event)
        local bufnr = event.buf
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            noremap = true,
            desc = desc,
          })
        end

        -- Navigation / info
        map("n", "gd", vim.lsp.buf.definition, "LSP definition")
        map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
        map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
        map("n", "gr", vim.lsp.buf.references, "LSP references")
        map("n", "K", vim.lsp.buf.hover, "LSP hover")
        map("n", "<C-k>", vim.lsp.buf.signature_help, "LSP signature help")

        -- Actions
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action")

        -- Diagnostics
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("n", "<leader>de", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics list")

        -- Formatting
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, "Format buffer")
      end,
    })
  end,
}

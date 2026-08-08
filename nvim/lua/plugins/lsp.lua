return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      "j-hui/fidget.nvim",
    },

    config = function()
      local cmp = require("cmp")

      require("mason").setup()
      require("fidget").setup({})

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP servers
      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })


      vim.lsp.enable("gopls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("lua_ls")


      -- Autocomplete
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),

          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),

          ["<C-Space>"] = cmp.mapping.complete(),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })


      -- Diagnostics
      vim.diagnostic.config({
        virtual_text = {
          prefix = "■",
          spacing = 4,
        },
        signs = true,
        underline = true,

        float = {
          border = "rounded",
          source = "always",
        },
      })
    end,
  },
}

return {
  --mason wont work without explicity calling thi
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  }, 

  {

    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("nvim-cmp-lsp").default_capabilities())
    end,
    opts = {
      ensure_installed = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        'jdtls','lua_ls','pyright','clangd', "cmake", 'rust_analyzer', 'html'
      },

      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup() {
            capabilities = capabilities
          }
        end,
        -- space for custom handlers (ie lua_lsp)
        -- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false
    opts = {
      sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
    },
  },

  {"mfussenegger/nvim-jdtls", lazy = true}
  "hrsh7th/cmp-nvim-lsp",
  "neovim/nvim-lspconfig",

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp-nvim-lsp")
  end
}
   

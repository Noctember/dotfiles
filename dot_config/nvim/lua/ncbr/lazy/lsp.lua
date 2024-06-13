return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'whoissethdaniel/mason-tool-installer.nvim',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    'folke/neodev.nvim',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'j-hui/fidget.nvim',
    'nanotee/sqls.nvim',

    'b0o/schemastore.nvim',
    'stevearc/conform.nvim',
  },
  config = function()
    require('neodev').setup {}

    local cmp = require 'cmp'
    local cmp_lsp = require 'cmp_nvim_lsp'
    local capabilities =
      vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    require('fidget').setup {}

    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'stylua',
      },
    }
    require('mason-lspconfig').setup {
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'jsonls',
      },

      handlers = {
        function(server_name) -- default handler (optional)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
          }
        end,

        ['lua_ls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = 'Lua 5.1' },
                diagnostics = {
                  globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
                },
              },
            },
          }
        end,

        ['yamlls'] = function()
          require('lspconfig').yamlls.setup {
            settings = {
              yaml = {
                schemaStore = {
                  -- You must disable built-in schemaStore support if you want to use
                  -- this plugin and its advanced options like `ignore`.
                  enable = false,
                  -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                  url = '',
                },
                schemas = require('schemastore').yaml.schemas(),
              },
            },
          }
        end,

        ['jsonls'] = function()
          require('lspconfig').jsonls.setup {
            settings = {
              json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
              },
            },
          }
        end,

        ['sqls'] = function()
          require('lspconfig').sqls.setup {
            on_attach = function(client, bufnr)
              require('sqls').on_attach(client, bufnr) -- require sqls.nvim
            end,

            settings = {
              sqls = {
                connections = {
                  {
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=postgres dbname=untitled sslmode=disable',
                  },
                },
              },
            },
          }
        end,
      },
    }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete(),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      }),
    }

    vim.diagnostic.config {
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }

    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    }
  end,
}

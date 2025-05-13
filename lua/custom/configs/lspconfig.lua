local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  --init_options = {
  --  preferences = {
  --    disableSuggestions = true
  --  }
  --}
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
          languages = { 'vue' },
        },
      },
    },
    settings = {
      typescript = {
        tsserver = {
          useSyntaxServer = false,
        },
        inlayHints = {
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
    }
  }
}

lspconfig.dartls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "dart" },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" }
}

local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    vue = {
      require("formatter.filetypes.vue").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    dart = {
      require("formatter.filetypes.dart").prettier
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M

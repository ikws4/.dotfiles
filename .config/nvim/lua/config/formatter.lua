require("formatter").setup {
  logging = false,
  filetype = {
    typescript = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            vim.api.nvim_buf_get_name(0),
            "-",
          },
          stdin = true,
        }
      end,
    },
  },
}

vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.ts,*.js,*.lua FormatWrite
    augroup END
  ]],
  true
)

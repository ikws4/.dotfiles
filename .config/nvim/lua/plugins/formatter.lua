return function()
	require("formatter").setup({
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
			lua = {
				function()
					return {
						exe = "stylua",
						args = {
							"--indent-width",
							2,
							"--indent-type",
							"Spaces",
							"--stdin-filepath",
							vim.api.nvim_buf_get_name(0),
							"-",
						},
						stdin = true,
					}
				end,
			},
		},
	})

	vim.api.nvim_exec(
		[[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.ts,*.lua FormatWrite
    augroup END
    ]],
		true
	)
end

local M = {
    name = 'amazonq',
    url = 'ssh://git.amazon.com/pkg/AmazonQNVim',
    opts = {
      ssoStartUrl = 'https://amzn.awsapps.com/start',
      -- Note: It's normally not necessary to change default `lsp_server_cmd`.
      -- lsp_server_cmd = {
      --   'node',
      --   vim.fn.stdpath('data') .. '/lazy/AmazonQNVim/language-server/build/aws-lsp-codewhisperer-token-binary.js',
      --   '--stdio',
      -- },
    },
}

function M.config()
	require("amazonq").setup{
		-- Command passed to `vim.lsp` to start Q LSP. Amazon -- Q LSP is
		-- a NodeJS program, which must be started with `--stdio` flag.
		lsp_server_cmd = { 'node', 'path/to/aws-lsp-codewhisperer-token-binary.js', '--stdio' },
		-- IAM Identity Center portal for organisation.
		ssoStartUrl = 'https://view.awsapps.com/start',
		inline_suggest = true,
		-- List of filetypes where the Q will be activated.
		-- Docs: https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/q-language-ide-support.html
		-- Note: These must be valid Nvim filetypes. For example, Q supports "shell",
		-- but in the filetype name is "sh" (also "bash").
		filetypes = {
			'amazonq', 'bash', 'java', 'python', 'typescript', 'javascript', 'csharp', 'ruby', 'kotlin', 'sh', 'sql', 'c',
			'cpp', 'go', 'rust', 'lua',
		},
		-- Window split direction. Default is "vertical", also accepts "horizontal".
		window_direction = 'vertical',
		-- Window width when window_direction=vertical, or height when window_direction=horizontal.
		window_size = '80',
		-- Enable debug mode (for development).
		debug = false,
	}
end

return M

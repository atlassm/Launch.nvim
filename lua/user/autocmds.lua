vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

-- Function to write yanked text directly to a new file
local function write_yanked_text_to_file()
	-- Get yanked text from register (assuming register "0" for yank)
	local file_path = os.getenv("HOME") .. "/my_folder/yanks"
	local yanked_text = vim.fn.getreg("0")

	-- Ensure the yanked text is not empty
	if yanked_text == "" then
		print("No text yanked")
		return
	end

	-- Open the file in write mode
	local file = io.open(file_path, "w")

	-- Ensure the file is successfully opened
	if not file then
		print("Error opening file: " .. file_path)
		return
	end

	-- Write the yanked text to the file
	file:write(yanked_text)

	-- Close the file
	file:close()
end

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
	write_yanked_text_to_file()
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   callback = function()
--     local status_ok, luasnip = pcall(require, "luasnip")
--     if not status_ok then
--       return
--     end
--     if luasnip.expand_or_jumpable() then
--       -- ask maintainer for option to make this silent
--       -- luasnip.unlink_current()
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--
--     end
--   end,
-- })

-- Set tabstop and shiftwidth to 4 for other files (default setting)
vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function()
		if vim.bo.filetype == 'lua' then
			vim.opt_local.tabstop = 2
			vim.opt_local.shiftwidth = 2
		else
			vim.opt_local.tabstop = 4
			vim.opt_local.shiftwidth = 4
		end
	end
})

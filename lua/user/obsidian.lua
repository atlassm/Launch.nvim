local M = {
  "epwalsh/obsidian.nvim",
   lazy = true,
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
}

function M.config()
  local obsidian = require "obsidian"
  obsidian.setup {
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/shlomime_obsidian_vault/",
				}
			},
		},
}
end

return M


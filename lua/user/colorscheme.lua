local M = {
  -- "LunarVim/darkplus.nvim",
  "catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  -- vim.cmd.colorscheme "darkplus"
  vim.cmd.colorscheme "catppuccin"
  vim.g.catppuccin_flavor = "mocha" -- or "latte", "frappe", "macchiato"
end

return M

-- return {
--   "wnkz/monoglow.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- 	config = function ()
-- 		vim.cmd.colorscheme "monoglow-z"
-- 	end,
-- }

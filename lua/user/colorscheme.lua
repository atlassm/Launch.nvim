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
-- -- Set background colors for diff highlighting
-- vim.cmd('highlight DiffAdd guibg=#00cc00')
-- vim.cmd('highlight DiffChange guibg=#001C36')
-- vim.cmd('highlight DiffDelete guibg=#280000')
end

return M

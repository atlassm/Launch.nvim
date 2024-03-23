local M = {
  "ojroques/nvim-osc52",
}

function M.config()
-- vim.keymap.set('n', '<leader>y', return require('osc52').copy_operator, { expr = true })
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
-- vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
  vim.keymap.set("n", "<leader>y", function() return require("osc52").copy_operator() end, { expr = true })
  -- vim.keymap.set("v", "<leader>y", function() return require("osc52").copy_visual() end)

  -- local wk = require "which-key"
  -- wk.register {
  --   ["<leader>y"] = { "<cmd>lua return require('osc52').copy_operator<cr>", "copy to clipboard" },
  -- }
end

return M

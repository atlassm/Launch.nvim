local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<s-u>", "<cmd>lua require('user.harpoon').rm_file()<cr>", opts)
  keymap("n", "<s-m>", "<cmd>lua require('user.harpoon').mark_file()<cr>", opts)
  keymap("n", "<s-tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  harpoon - marked file"
end

function M.rm_file()
  require("harpoon.mark").rm_file()
  require("harpoon.mark").remove_empty_tail()
  vim.notify "󱡅  harpoon - removed file"
end

-- this one has no keymap, need to add in the future
function M.clear_all()
  require("harpoon.mark").clear_all()
  vim.notify "󱡅  harpoon - cleared all"
end

return M

local M = {
  "sindrets/diffview.nvim",
}

function M.config()

  local wk = require "which-key"
  wk.register {
    ["<leader>gdo"] = { "<cmd>DiffviewOpen<cr>", "Diff view Git Diff Open" },
    ["<leader>gdc"] = { "<cmd>DiffviewClose<cr>", "Diff view Git Diff Close" },
    ["<leader>gfh"] = { "<cmd>DiffviewFileHistory %<cr>", "diff view Git File History" },
    ["<leader>grh"] = { "<cmd>DiffviewFileHistory<cr>", "diff view Git Repo History" },
  }
  local diffview = require "diffview"
  diffview.setup {}

end

return M

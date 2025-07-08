local M = {
  "folke/which-key.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    window = {  -- Use window instead of win
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    -- Remove delay and filter which are causing issues
    ignore_missing = true,  -- Use this instead of filter
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  -- Register group labels using the old format (more reliable)
  local mappings = {
    b = { name = "Buffers" },
    f = { name = "Find" },
    g = { name = "Git" },
    l = { name = "LSP" },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M

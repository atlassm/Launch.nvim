require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
spec "user.colorscheme"
-- spec "user.devicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.vim-auto-save"
spec "user.tagbar"
spec "user.diffview"
spec "user.vim-be-good"
spec "user.lspconfig"
spec "user.cmp"
spec "user.telescope"
-- spec "user.none-ls"
spec "user.illuminate" -- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
spec "user.gitsigns"
spec "user.vim-fugitive"
spec "user.whichkey"

-- spec "user.nvimtree"
spec "user.comment"
spec "user.lualine"
-- spec "user.navic"
-- spec "user.breadcrumbs"
spec "user.trailertrash"
spec "user.harpoon"
-- spec "user.neotest"
-- spec "user.autopairs" -- this is for setting a complementary sign (for instance "" instead of ")

-- spec "user.neogit"
spec "user.alpha"
-- --spec "user.project"
spec "user.indentline"
-- spec "user.toggleterm"
-- spec "user.nvim-nio"
-- spec "user.vim-tmux-navigator"
spec "user.oil"
require "user.lazy"

-- if string.match(vim.fn.getcwd(), "alpha3") then
-- 	vim.cmd("source /home/shlomime/my_folder/nvim_ws/alpha3_session.vim")
-- end

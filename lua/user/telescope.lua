local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "nvim-telescope/telescope-live-grep-args.nvim" ,
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
}

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

function M.config()
	local wk = require "which-key"
	wk.register {
		["<leader><Space>"] = { "<cmd>Telescope buffers previewer=true<cr>", "Opened buffers" },
		["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
		["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text (live_grep)" },
		["<leader>fs"] = { "<cmd>Telescope grep_string<cr>", "Find String (grep_string)" },
		["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
		["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
		["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
		["<leader>bn"] = { "<cmd>bn<cr>", "next buffer" },
		["<leader>bp"] = { "<cmd>bp<cr>", "prev buffer" },
		--    ["<leader>*"] = { ":%s/\<C-r><C-w>\>/", "Substitute" },
	}

	local icons = require "user.icons"
	local actions = require "telescope.actions"
	local function execute_norm(prompt_bufnr)
	  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'n', true)
end

	require("telescope").setup {
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "relative" },
			color_devicons = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
				"--glob=!part-support/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-c>"] = execute_norm,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			initial_mode = "normal",
			--      live_grep = {
			--        theme = "dropdown",
			--      },

			grep_string = {
				--        theme = "dropdown",
				initial_mode = "normal",
			},

			live_grep = {
				--        theme = "dropdown",
				initial_mode = "insert",
			},
			find_files = {
				path_display = {"absolute"},
				--        theme = "dropdown",
				--        previewer = false,
			},
			oldfiles = {
				initial_mode = "normal",
			},
			buffers = {
				--        theme = "dropdown",
				previewer = true,
				initial_mode = "normal",
				-- scroll_strategy = "cycle", -- not cycling through list --[[ limit ]]
				scroll_strategy = "limit", -- not cycling through list --[[ limit ]]
				sorting_strategy = "descending",
				sort_lastused = true, -- more logical
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				previewer = true,

				-- theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				-- theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				-- theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				-- theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	}

	require("telescope").load_extension("live_grep_args")

	local tb = require('telescope.builtin')

	keymap('n', "<C-f>", ':Telescope current_buffer_fuzzy_find<cr>', { noremap = true, silent = true, desc = "current buffer fzf"})
	keymap('n', 'q:', ':Telescope command_history<cr>', { noremap = true, silent = true, desc = "open command line history"})

	-- keymap('v', '<space>g', function()
	-- 	local text = vim.getVisualSelection()
	-- 	tb.current_buffer_fuzzy_find({ default_text = text })
	-- end, opts)

	keymap('v', '<leader>ft', function()
		local text = vim.getVisualSelection()
		tb.live_grep({ default_text = text })
	end, opts)

end

return M

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ChangeBackground changes the background mode based on macOS's `Appearance
-- setting. 
--local function change_background()
--  local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
--  m = m:gsub("%s+", "") -- trim whitespace
--  if m == "Dark" then
--    vim.o.background = "dark" 
--  else
--    vim.o.background = "light" 
--  end
--end

----------------
--- plugins ---
----------------
require("lazy").setup({

	-- colorscheme
	{ 
		"ellisonleao/gruvbox.nvim", 
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function ()
			--change_background()
			require("gruvbox").setup({
				contrast = "hard"
			})
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	-- dashboard 	
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
			}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

}) -- end of plrgins 

----------------
--- SETTINGS ---
----------------

vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true	-- turn on relative line numbers
vim.opt.showmatch = true     -- Highlight matching parenthesis
vim.opt.showmode = true      -- don't show which mode disabled for PowerLine
vim.opt.autowrite = true     -- Automatically save before :next, :make etc.
vim.opt.title = true         -- set terminal title
vim.opt.autochdir = true     -- Change CWD when I open a file
vim.cmd('set path+=**')	     -- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.ignorecase = true	-- enable case insensitive searching
vim.opt.smartcase = true	-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false	-- disable all highlighted search results
vim.opt.incsearch = true	-- enable incremental searching
vim.opt.wrap = true		    -- enable text wrapping
vim.opt.tabstop = 4		    -- tabs=4spaces
vim.opt.shiftwidth = 4  
vim.opt.fileencoding = "utf-8"	-- encoding set to utf-8
vim.opt.pumheight = 10		    -- number of items in popup menu
vim.opt.scrolloff = 8		    -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8	     -- scroll page when cursor is 8 spaces from left/right

vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'  -- Copy/paste to system clipboard
vim.opt.swapfile = false           -- Don't use swapfile
vim.opt.ignorecase = true          -- Search case insensitive...
vim.opt.smartcase = true           -- ... but not it begins with upper case 
vim.opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"
vim.cmd('set wildmenu')			-- enable wildmenu

-- netrw
vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw


--statusline
vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021"
vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=none guifg=white"
vim.o.statusline = " "
				.. " "
				.. " "
				.. "%l"
				.. " "
				.. " %#StatusType#"
				.. "<< "
				.. "%Y" 
				.. "  "
				.. " >>"
				.. "%#StatusFile#"
				.. "<< "
				.. "%F"
				.. " >>"
				.. "%#StatusModified#"
				.. " "
				.. "%m"
				.. " "
				.. "%#StatusNorm#"
				.. "%="
				.. "%#StatusBuffer#"
				.. "<< "
				.. "  "
				.. "%n"
				.. " >>"
				.. "%#StatusLocation#"
				.. "<< "
				.. "燐 "
				.. "%l,%c"
				.. " >>"
				.. "%#StatusPercent#"
				.. "<< "
				.. "%p%% "
				.. " >> "

----------------
-- KEYS 
----------------

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")	-- reload neovim config

-- easy split generation
map("n", "<leader>v", ":vsplit")				-- space+v creates a veritcal split
map("n", "<leader>s", ":split")					-- space+s creates a horizontal split

-- buffer navigation
map("n", "<Tab>", ":bnext <CR>")				-- Tab goes to next buffer

-- open netrw in 25% split 
map("n", "<leader>e", ":25Lex<CR>")

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")



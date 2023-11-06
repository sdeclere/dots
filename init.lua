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

	-- statusline
	{ 
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require("lualine").setup({
				options = { theme = 'gruvbox' },
				sections = {
					lualine_c = {
						{
							'filename',
							file_status = true, -- displays file status (readonly status, modified status)
							path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
						}
					}
				}
			})
		end,
	},
	

}) -- end of plugins 

----------------
--- SETTINGS ---
----------------

vim.opt.number = true        -- Show line numbers
vim.opt.showmatch = true     -- Highlight matching parenthesis
vim.opt.autowrite = true     -- Automatically save before :next, :make etc.
vim.opt.autochdir = true     -- Change CWD when I open a file

vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'  -- Copy/paste to system clipboard
vim.opt.swapfile = false           -- Don't use swapfile
vim.opt.ignorecase = true          -- Search case insensitive...
vim.opt.smartcase = true           -- ... but not it begins with upper case 
vim.opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"

----------------
-- KEYS 
----------------

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


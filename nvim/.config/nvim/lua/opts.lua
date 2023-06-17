--[[ opts.lua ]]

local vim = vim

-- [[ Context ]]
vim.opt.number = true                -- bool: Show line numbers
vim.opt.relativenumber = true        -- bool: Show relative line numbers
vim.opt.scrolloff = 4                -- int:  Min num lines of context
vim.opt.cursorline = true            -- bool: Highlight the current line
vim.opt.signcolumn = "yes"           -- str:  Show the sign column
vim.opt.colorcolumn = '80'           -- str:  Show col for max line length

-- [[ Filetypes ]]
vim.opt.encoding = 'utf8'            -- str:  String encoding to use
vim.opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
vim.opt.syntax = "ON"                -- str:  Allow syntax highlighting
vim.opt.termguicolors = true         -- bool: If term supports ui color then enable
vim.opt.guicursor = ""

-- [[ Search ]]
vim.opt.ignorecase = true            -- bool: Ignore case in search patterns
vim.opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
vim.opt.incsearch = true             -- bool: Use incremental search
vim.opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
vim.opt.tabstop = 4                  -- num:  Number of spaces tabs count for
vim.opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
vim.opt.shiftwidth = 4               -- num:  Size of an indent
vim.opt.expandtab = true             -- bool: Use spaces instead of tabs
vim.opt.fixendofline = true          -- bool: Restore EOL at end of file if missing

-- [[ Text Display ]]
vim.opt.wrap = false                 -- bool: Wrap lines longer than width of window
vim.opt.linebreak = true             -- bool: Wrap lines at character in 'breakat'
vim.opt.breakindent = true           -- bool: Wrapped lines continue visually indented
vim.opt.showbreak = "> "             -- str:  String to put at start of wrapped lines

-- [[ Splits ]]
vim.opt.splitright = true            -- bool: Place new window to right of current one
vim.opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ Files ]]
vim.opt.backup = false               -- bool: Do not keep backup backup file...
vim.opt.writebackup = true           -- bool: ...unless while file is being written
vim.opt.backupdir = vim.fn.stdpath("state") .. "/nvim/backup//"

vim.opt.swapfile = false             -- bool: Do not use a swapfile for the buffer
vim.opt.directory = vim.fn.stdpath("state") .. "/nvim/swap//"

vim.opt.undofile = true              -- bool: Keep undo history between sessions
vim.opt.undodir = vim.fn.stdpath("state") .. "/nvim/undo//"

vim.opt.confirm = true               -- bool: Confirm actions on unsaved buffers

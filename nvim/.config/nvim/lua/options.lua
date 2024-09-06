-- [[ options.lua ]]

local vim = vim

-- [[ Context ]]


-- [[ Files ]]
vim.opt.encoding = 'utf8'            -- String encoding to use
vim.opt.fileencoding = 'utf8'        -- File encoding to use
vim.opt.confirm = true               -- Confirm actions on unsaved buffers

vim.opt.backup = false               -- Do not keep backup backup file...
vim.opt.writebackup = true           -- ...unless while file is being written
vim.opt.backupcopy = "yes"           -- Make copy and overwrite original
vim.opt.backupdir = vim.fn.stdpath("state") .. "/nvim/backup//"

vim.opt.swapfile = false             -- Do not use a swapfile for the buffer
vim.opt.directory = vim.fn.stdpath("state") .. "/nvim/swap//"

vim.opt.undofile = true              -- Keep undo history between sessions
vim.opt.undodir = vim.fn.stdpath("state") .. "/nvim/undo//"


-- [[ Search ]]
vim.opt.ignorecase = true            -- Ignore case in search patterns
vim.opt.smartcase = true             -- Override ignorecase if search contains capitals
vim.opt.incsearch = true             -- Use incremental search, i.e. search as characters are entered
vim.opt.hlsearch = false             -- Highlight search matches


-- [[ Theme ]]
vim.opt.syntax = "ON"                -- Allow syntax highlighting
vim.opt.termguicolors = true         -- If term supports ui color then enable
vim.opt.guicursor = ""


-- [[ User Interface ]]
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.scrolloff = 4                -- Min num lines of context
vim.opt.cursorline = true            -- Highlight the current line
vim.opt.signcolumn = "yes"           -- Show the sign column
vim.opt.colorcolumn = '80'           -- Show column to indicate max line length

vim.opt.wrap = false                 -- Wrap lines longer than width of window
vim.opt.linebreak = true             -- Wrap lines at character in 'breakat'
vim.opt.breakindent = true           -- Wrapped lines continue visually indented
vim.opt.showbreak = "> "             -- String to put at start of wrapped lines

vim.opt.splitright = true            -- Place new window to right of current one
vim.opt.splitbelow = true            -- Place new window below the current one


-- [[ Whitespace ]]
vim.opt.tabstop = 4                  -- Number of spaces tabs count for
vim.opt.softtabstop = 4              -- Number of spaces tabs count for in insert mode
vim.opt.shiftwidth = 4               -- Size of an indent
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.fixendofline = true          -- Restore EOL at end of file if missing

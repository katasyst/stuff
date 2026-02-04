-- Pure Neovim options (no LazyVim)

local opt = vim.opt

-- Netrw (built-in file explorer)
vim.g.netrw_banner = 0        -- Hide banner
vim.g.netrw_liststyle = 3     -- Tree style view
vim.g.netrw_browse_split = 0  -- Open in same window
vim.g.netrw_winsize = 25      -- Width percentage
vim.g.netrw_altv = 1          -- Open splits to the right

-- Editor basics
opt.number = true             -- Line numbers
opt.relativenumber = true     -- Relative line numbers
opt.numberwidth = 4           -- Min width for line number column
opt.cursorline = true         -- Highlight current line
opt.wrap = false              -- No line wrap
opt.mouse = "a"               -- Enable mouse
opt.clipboard = "unnamedplus" -- System clipboard
opt.confirm = true            -- Confirm before closing unsaved

-- Indentation
opt.expandtab = true          -- Spaces instead of tabs
opt.shiftwidth = 4            -- Indent size
opt.tabstop = 4               -- Tab size
opt.smartindent = true        -- Smart indentation

-- Search
opt.ignorecase = true         -- Case insensitive search
opt.smartcase = true          -- Unless uppercase used
opt.hlsearch = true           -- Highlight search
opt.incsearch = true          -- Incremental search

-- Display
opt.termguicolors = true      -- True color support
opt.signcolumn = "yes"        -- Always show sign column
opt.scrolloff = 8             -- Lines above/below cursor
opt.sidescrolloff = 8         -- Columns left/right of cursor
opt.showmode = false          -- Don't show mode (we know)
opt.showcmd = true            -- Show partial command
opt.laststatus = 2            -- Always show statusline
opt.cmdheight = 1             -- Command line height

-- Splits
opt.splitbelow = true         -- New splits below
opt.splitright = true         -- New splits right

-- Undo (session only, no persistence)
opt.undofile = false          -- No persistent undo (clears on close)
opt.undolevels = 1000         -- Undo history within session

-- Performance
opt.updatetime = 250          -- Faster updates
opt.timeoutlen = 400          -- Key sequence timeout
opt.lazyredraw = false        -- Don't redraw during macros
opt.synmaxcol = 240           -- Max syntax highlight column

-- Files
opt.swapfile = false          -- No swap files
opt.backup = false            -- No backup files
opt.autoread = true           -- Auto reload changed files

-- Completion (built-in)
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10            -- Popup menu height

-- Invisible characters (disabled)
opt.list = false

-- Folding (treesitter will override via autocmd when available)
opt.foldmethod = "manual"
opt.foldlevel = 99            -- Start with all folds open

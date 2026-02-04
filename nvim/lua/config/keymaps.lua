-- Keymaps for pure Neovim (no LazyVim)

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File Explorer (netrw) - close dashboard first if open
local function open_explorer()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == "dashboard" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
  vim.cmd("Ex")
end

map("n", "<leader>e", open_explorer, "Open file explorer")
map("n", "<leader>E", ":Vex<CR>", "Open file explorer (vertical split)")

-- Quick save (Ctrl+S)
map("n", "<C-s>", "<cmd>w<cr>", "Save file")
map("i", "<C-s>", "<esc><cmd>w<cr>a", "Save file (insert mode)")

-- Save and quit
map("n", "<C-x>", "<cmd>wq<cr>", "Save and quit")

-- Quit without saving
map("n", "<C-S-q>", "<cmd>q!<cr>", "Quit without saving")

-- Quit (ask to save)
map("n", "<C-q>", "<cmd>q<cr>", "Quit")

-- New file
map("n", "<C-n>", "<cmd>enew<cr>", "New file")

-- Force save
map("n", "<C-S-s>", "<cmd>w!<cr>", "Force save")

-- Buffer navigation
map("n", "<S-l>", "<cmd>bnext<cr>", "Next buffer")
map("n", "<S-h>", "<cmd>bprev<cr>", "Previous buffer")
map("n", "<leader>l", ":ls<CR>", "List buffers")
map("n", "<leader>b", ":ls<CR>:b ", "Switch buffer")

-- Window navigation
map("n", "<C-h>", "<C-w>h", "Go left window")
map("n", "<C-j>", "<C-w>j", "Go down window")
map("n", "<C-k>", "<C-w>k", "Go up window")
map("n", "<C-l>", "<C-w>l", "Go right window")

-- Window resizing (Ctrl+Arrow)
map("n", "<C-Up>", "<C-w>+", "Increase window height")
map("n", "<C-Down>", "<C-w>-", "Decrease window height")
map("n", "<C-Right>", "<C-w>>", "Increase window width")
map("n", "<C-Left>", "<C-w><", "Decrease window width")
map("n", "<C-w>=", "<C-w>=", "Equalize window sizes")

-- Window splits
map("n", "<leader>v", "<cmd>vsplit<cr>", "Vertical split")
map("n", "<leader>s", "<cmd>split<cr>", "Horizontal split")

-- Close windows/buffers
map("n", "<leader>x", "<cmd>bd<cr>", "Close buffer")
map("n", "<leader>X", "<cmd>bd!<cr>", "Force close buffer")
map("n", "<A-w>", "<cmd>bd<cr>", "Close buffer (Alt+W)")
map("n", "<C-W>o", "<cmd>only<cr>", "Close other windows")

-- Terminal
local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
  else
    if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
      vim.cmd("belowright split")
      vim.cmd("resize 12")
      vim.api.nvim_win_set_buf(0, terminal_buf)
      terminal_win = vim.api.nvim_get_current_win()
    else
      vim.cmd("belowright split | terminal powershell")
      vim.cmd("resize 12")
      terminal_buf = vim.api.nvim_get_current_buf()
      terminal_win = vim.api.nvim_get_current_win()
    end
    vim.cmd("startinsert")
  end
end

_G.toggle_terminal = toggle_terminal

map("n", "<A-t>", toggle_terminal, "Toggle terminal")
map("t", "<A-t>", "<C-\\><C-n><cmd>lua toggle_terminal()<cr>", "Toggle terminal")
map("n", "<leader>t", toggle_terminal, "Toggle terminal")

-- Terminal mode mappings
map("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode")
map("t", "<C-h>", "<C-\\><C-n><C-w>h", "Go left (from terminal)")
map("t", "<C-j>", "<C-\\><C-n><C-w>j", "Go down (from terminal)")
map("t", "<C-k>", "<C-\\><C-n><C-w>k", "Go up (from terminal)")
map("t", "<C-l>", "<C-\\><C-n><C-w>l", "Go right (from terminal)")

-- Built-in completion (Ctrl+N/P already work, but remap for insert mode clarity)
-- Ctrl+N = next completion from buffer words
-- Ctrl+P = previous completion from buffer words

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

-- Better indent
map("v", "<", "<gv", "Indent left and reselect")
map("v", ">", ">gv", "Indent right and reselect")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", "Move line down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move line up")

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz", "Page down centered")
map("n", "<C-u>", "<C-u>zz", "Page up centered")
map("n", "n", "nzzzv", "Next search centered")
map("n", "N", "Nzzzv", "Prev search centered")

-- Disable K (man lookup)
map("n", "K", "<Nop>", "Disabled")

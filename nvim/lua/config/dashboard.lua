-- Minimal ASCII dashboard - no plugins, pure Lua
local M = {}

local header = {
  "",
  "",
  "  ∧,,,∧",
  " (  ̳• · • ̳)",
  " /    づ♡  meow~",
  "",
  "   ██████╗  ██████╗  ██████╗  ██████╗ ██╗     ███████╗",
  "  ██╔════╝ ██╔═══██╗██╔═══██╗██╔════╝ ██║     ██╔════╝",
  "  ██║  ███╗██║   ██║██║   ██║██║  ███╗██║     █████╗  ",
  "  ██║   ██║██║   ██║██║   ██║██║   ██║██║     ██╔══╝  ",
  "  ╚██████╔╝╚██████╔╝╚██████╔╝╚██████╔╝███████╗███████╗",
  "   ╚═════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝",
  "",
  "        ૮ ˶ᵔ ᵕ ᵔ˶ ა  [ Kata ]  ₍ᐢ..ᐢ₎♡",
  "",
  "   ～～～～～～～～～～～～～～～～～～～～～",
  "",
  "   [e]  New file",
  "   [f]  Find file",
  "   [r]  Recent files",
  "   [q]  Quit",
  "",
}

local shortcuts = {
  { key = "e", action = "enew" },
  { key = "f", action = "Ex" },
  { key = "r", action = "browse oldfiles" },
  { key = "q", action = "qa" },
}

local function center_block(lines, width)
  -- Find the widest line
  local max_width = 0
  for _, line in ipairs(lines) do
    local w = vim.fn.strdisplaywidth(line)
    if w > max_width then max_width = w end
  end
  -- Calculate single padding based on widest line
  local padding = math.floor((width - max_width) / 2)
  local pad_str = string.rep(" ", math.max(0, padding))
  -- Apply same padding to all lines
  local centered = {}
  for _, line in ipairs(lines) do
    table.insert(centered, pad_str .. line)
  end
  return centered
end

local function close_dashboard()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == "dashboard" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end 

local function render()
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  local width = vim.api.nvim_win_get_width(win)
  local height = vim.api.nvim_win_get_height(win)

  -- Build content
  local lines = vim.deepcopy(header)

  -- Center vertically
  local pad_top = math.floor((height - #lines) / 2)
  local content = {}
  for _ = 1, math.max(0, pad_top) do
    table.insert(content, "")
  end
  for _, line in ipairs(center_block(lines, width)) do
    table.insert(content, line)
  end

  -- Set buffer content
  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  vim.bo[buf].modifiable = false
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "dashboard"

  -- Set keymaps: close dashboard first, then execute action
  for _, item in ipairs(shortcuts) do
    vim.keymap.set("n", item.key, function()
      close_dashboard()
      vim.cmd(item.action)
    end, { buffer = buf, silent = true })
  end

  -- Disable line numbers and other UI elements
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn = "no"
  vim.wo[win].colorcolumn = ""
  vim.wo[win].cursorline = false
end

local function is_buffer_empty(buf)
  if not vim.api.nvim_buf_is_valid(buf) then return true end
  local name = vim.api.nvim_buf_get_name(buf)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local is_empty = name == "" and #lines <= 1 and (lines[1] or "") == ""
  local ft = vim.bo[buf].filetype
  return is_empty and ft ~= "dashboard" and ft ~= "netrw"
end

local function show_dashboard_if_empty()
  -- Check if we should show dashboard (no real buffers left)
  local dominated_by_empty = true
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      local name = vim.api.nvim_buf_get_name(buf)
      local ft = vim.bo[buf].filetype
      if name ~= "" or ft == "netrw" then
        dominated_by_empty = false
        break
      end
    end
  end
  if dominated_by_empty then
    render()
  end
end

local function restore_window_options()
  local win = vim.api.nvim_get_current_win()
  vim.wo[win].number = true
  vim.wo[win].relativenumber = true
  vim.wo[win].signcolumn = "yes"
  vim.wo[win].cursorline = true
end

function M.setup()
  -- Show on VimEnter
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
        render()
      end
    end,
  })

  -- Restore window options when leaving dashboard
  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
      if vim.bo.filetype == "dashboard" then
        vim.schedule(restore_window_options)
      end
    end,
  })

  -- Also restore on FileType (when opening a real file)
  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      if args.match ~= "dashboard" and args.match ~= "netrw" then
        restore_window_options()
      end
    end,
  })

  -- Show dashboard when last buffer is closed
  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function()
      vim.schedule(function()
        local bufs = vim.tbl_filter(function(buf)
          return vim.api.nvim_buf_is_valid(buf)
            and vim.bo[buf].buflisted
            and vim.bo[buf].filetype ~= "dashboard"
        end, vim.api.nvim_list_bufs())

        if #bufs == 0 then
          vim.cmd("enew")
          render()
        end
      end)
    end,
  })
end

return M

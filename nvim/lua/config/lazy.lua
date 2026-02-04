-- Minimal lazy.nvim setup - only Treesitter for syntax highlighting
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Windows: add tree-sitter CLI and set CC before lazy loads plugins
if vim.fn.has("win32") == 1 then
  local ts_path = vim.fn.expand("~/treesitter")
  if vim.fn.isdirectory(ts_path) == 1 then
    vim.env.PATH = ts_path .. ";" .. vim.env.PATH
  end
  if not vim.env.CC then
    if vim.fn.executable("gcc") == 1 then
      vim.env.CC = "gcc"
    elseif vim.fn.executable("zig") == 1 then
      vim.env.CC = "zig cc"
    end
  end
end

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- New API: just install parsers, highlighting is via vim.treesitter.start()
      local parsers = {
        "lua", "python", "go", "rust",
        "javascript", "typescript",
        "json", "yaml", "toml", "markdown",
        "html", "css", "bash",
      }

      -- Install parsers (async, no-op if already installed)
      require("nvim-treesitter").install(parsers)

      -- Auto-enable treesitter highlighting for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}, {
  checker = { enabled = false },
  change_detection = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})


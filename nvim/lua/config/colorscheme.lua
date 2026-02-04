-- mixed colour

local colors = {
  bg = "#1A1A1A",
  fg = "#E8ECF0",            -- brighter foreground
  cursor = "#87C3FF",
  selection = "#2E2E2E",

  bright_black = "#6B7280",  -- brighter for better visibility
  bright_blue = "#93CFFF",   -- brighter blue
  bright_cyan = "#7FDBCA",   -- more vibrant cyan
  bright_green = "#B8D89C",  -- brighter green
  bright_purple = "#D4A4D9", -- brighter purple
  bright_red = "#E57A84",    -- brighter red
  bright_white = "#F0F4F8",  -- brighter white
  bright_yellow = "#F5D08A", -- brighter yellow

  dark_black = "#1F1F1F",
  dark_blue = "#1E252B",
  dark_green = "#272E22",
  dark_red = "#361B1E",
  dark_yellow = "#30291C",

  black = "#2A2A2A",
  blue = "#93CFFF",          -- brighter
  cyan = "#7FDBCA",          -- brighter
  green = "#B8D89C",         -- brighter
  purple = "#B8A4F8",        -- brighter
  red = "#E57A84",           -- brighter
  white = "#F0F4F8",         -- brighter
  yellow = "#FFD19A",        -- brighter, more orange-ish
}

-- Terminal colors
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.purple
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_purple
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- General UI
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg })
hi("FloatBorder", { fg = colors.bright_black })
hi("Cursor", { fg = colors.bg, bg = colors.cursor })
hi("CursorLine", { bg = colors.dark_black })
hi("CursorColumn", { bg = colors.dark_black })
hi("CursorLineNr", { fg = colors.purple })
hi("LineNr", { fg = colors.bright_black })
hi("SignColumn", { fg = colors.bright_black })
hi("ColorColumn", { bg = colors.bg })
hi("Visual", { bg = colors.selection })
hi("VisualNOS", { fg = colors.bg, bg = colors.yellow })
hi("Search", { fg = colors.yellow, bg = colors.dark_yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.yellow })
hi("CurSearch", { fg = colors.bg, bg = colors.yellow })
hi("MatchParen", { fg = colors.yellow, bg = colors.dark_yellow, bold = true })
hi("NonText", { fg = colors.bright_black })
hi("SpecialKey", { fg = colors.bright_black })
hi("Folded", { fg = colors.bright_black })
hi("FoldColumn", { fg = colors.bright_black })
hi("Directory", { fg = colors.blue })

-- Status line
hi("StatusLine", { fg = colors.fg, bg = colors.black })
hi("StatusLineNC", { fg = colors.bright_black, bg = colors.bg })
hi("WinSeparator", { fg = colors.black })
hi("VertSplit", { fg = colors.black })

-- Popup menu
hi("Pmenu", { fg = colors.white })
hi("PmenuSel", { fg = colors.black, bg = colors.blue })
hi("PmenuSbar", { bg = colors.black })
hi("PmenuThumb", { fg = colors.black, bg = colors.blue })

-- Messages
hi("Title", { fg = colors.blue, bold = true })
hi("ModeMsg", { fg = colors.green })
hi("MoreMsg", { fg = colors.cyan })
hi("Question", { fg = colors.cyan })
hi("WarningMsg", { fg = colors.yellow })
hi("ErrorMsg", { fg = colors.red })
hi("Error", { fg = colors.red, bg = colors.dark_red })

-- Netrw (file explorer)
hi("netrwDir", { fg = colors.blue })
hi("netrwClassify", { fg = colors.blue })
hi("netrwLink", { fg = colors.purple })
hi("netrwSymLink", { fg = colors.purple })
hi("netrwExe", { fg = colors.green })
hi("netrwComment", { fg = colors.bright_black })
hi("netrwList", { fg = colors.fg })
hi("netrwTreeBar", { fg = colors.black })

-- Diff
hi("DiffAdd", { bg = colors.dark_green })
hi("DiffChange", { bg = colors.dark_yellow })
hi("DiffDelete", { bg = colors.dark_red })
hi("DiffText", { bg = colors.dark_blue })
hi("diffAdded", { fg = colors.green })
hi("diffRemoved", { fg = colors.red })
hi("diffChanged", { fg = colors.yellow })
hi("Added", { fg = colors.green })
hi("Removed", { fg = colors.red })
hi("Changed", { fg = colors.yellow })

-- Git signs
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })
hi("DiagnosticOk", { fg = colors.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

-- Spell
hi("SpellBad", { fg = colors.red, underline = true })
hi("SpellCap", { fg = colors.blue, underline = true })
hi("SpellLocal", { fg = colors.cyan, underline = true })
hi("SpellRare", { fg = colors.purple, underline = true })

-- Syntax - Standard
hi("Comment", { fg = colors.bright_black, italic = true })
hi("String", { fg = colors.bright_purple })
hi("Character", { fg = colors.yellow })
hi("Number", { fg = colors.yellow })
hi("Boolean", { fg = colors.bright_yellow })
hi("Float", { fg = colors.yellow })
hi("Identifier", { fg = colors.cyan })
hi("Function", { fg = colors.bright_blue, bold = true })
hi("Statement", { fg = colors.purple })
hi("Conditional", { fg = colors.purple })
hi("Repeat", { fg = colors.purple })
hi("Label", { fg = colors.blue })
hi("Operator", { fg = colors.cyan })
hi("Keyword", { fg = colors.bright_cyan })
hi("Exception", { fg = colors.purple })
hi("PreProc", { fg = colors.purple })
hi("Include", { fg = colors.purple })
hi("Define", { fg = colors.purple })
hi("Macro", { fg = colors.purple })
hi("PreCondit", { fg = colors.purple })
hi("Type", { fg = colors.purple })
hi("StorageClass", { fg = colors.purple })
hi("Structure", { fg = colors.purple })
hi("Typedef", { fg = colors.purple })
hi("Special", { fg = colors.purple })
hi("SpecialChar", { fg = colors.yellow })
hi("Tag", { fg = colors.purple })
hi("Delimiter", { fg = colors.fg })
hi("SpecialComment", { fg = colors.bright_black })
hi("Debug", { fg = colors.red })
hi("Underlined", { fg = colors.blue, underline = true })
hi("Constant", { fg = colors.purple })
hi("Todo", { fg = colors.purple, bold = true })

-- Treesitter
hi("@variable", { fg = colors.cyan })                    -- variables like df, value
hi("@variable.builtin", { fg = colors.bright_cyan })     -- self, cls
hi("@variable.parameter", { fg = colors.yellow })        -- function parameters
hi("@variable.parameter.builtin", { fg = colors.bright_cyan })
hi("@variable.member", { fg = colors.bright_red })       -- object members
hi("@constant", { fg = colors.bright_yellow })
hi("@constant.builtin", { fg = colors.bright_yellow })   -- True, False, None
hi("@module", { fg = colors.blue })                      -- pd, np, pf
hi("@module.builtin", { fg = colors.blue })
hi("@label", { fg = colors.purple })
hi("@label.builtin", { fg = colors.purple })
hi("@delimiter", { fg = colors.bright_white })
hi("@string", { fg = colors.bright_purple })             -- strings back to purple
hi("@string.builtin", { fg = colors.bright_purple })
hi("@string.regex", { fg = colors.bright_purple })
hi("@string.regexp", { fg = colors.bright_purple })
hi("@string.special", { fg = colors.purple })
hi("@string.documentation", { fg = colors.bright_black, italic = true })
hi("@string.escape", { fg = colors.yellow })
hi("@string.special.url", { fg = colors.bright_blue })
hi("@character", { fg = colors.bright_purple })
hi("@character.special", { fg = colors.yellow })
hi("@boolean", { fg = colors.bright_yellow })            -- True, False
hi("@number", { fg = colors.bright_yellow })             -- numbers
hi("@number.float", { fg = colors.bright_yellow })
hi("@type", { fg = colors.purple })                      -- DataFrame, etc
hi("@type.builtin", { fg = colors.purple })
hi("@attribute", { fg = colors.bright_purple })          -- decorators
hi("@attribute.builtin", { fg = colors.bright_purple })
hi("@property", { fg = colors.bright_red })              -- .index, .columns, .values
hi("@field", { fg = colors.bright_red })
hi("@function", { fg = colors.bright_blue, bold = true })
hi("@function.builtin", { fg = colors.bright_blue, bold = true })
hi("@function.call", { fg = colors.bright_blue })        -- method calls
hi("@function.method", { fg = colors.bright_blue })
hi("@function.method.call", { fg = colors.bright_blue })
hi("@constructor", { fg = colors.purple })
hi("@operator", { fg = colors.cyan })                    -- =, *, etc
hi("@keyword", { fg = colors.purple, bold = true })      -- for, in, if, etc
hi("@keyword.function", { fg = colors.purple, bold = true })
hi("@keyword.return", { fg = colors.purple, bold = true })
hi("@keyword.import", { fg = colors.purple })            -- import, from
hi("@keyword.conditional", { fg = colors.purple, bold = true })
hi("@keyword.repeat", { fg = colors.purple, bold = true })  -- for, while
hi("@keyword.exception", { fg = colors.purple, bold = true })
hi("@keyword.operator", { fg = colors.purple })          -- and, or, not, in
hi("@punctuation", { fg = colors.bright_white })
hi("@punctuation.bracket", { fg = colors.bright_white }) -- (), [], {}
hi("@punctuation.delimiter", { fg = colors.bright_white }) -- ,, :
hi("@punctuation.special", { fg = colors.cyan })
hi("@comment", { fg = colors.bright_black, italic = true })
hi("@comment.error", { fg = colors.red })
hi("@comment.warning", { fg = colors.yellow })
hi("@comment.note", { fg = colors.blue })
hi("@comment.todo", { fg = colors.yellow, bold = true })
hi("@tag", { fg = colors.red })
hi("@tag.builtin", { fg = colors.red })
hi("@tag.attribute", { fg = colors.yellow })
hi("@tag.delimiter", { fg = colors.bright_white })

-- Markdown
hi("@markup", { fg = colors.blue })
hi("@markup.strong", { bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.strikethrough", { strikethrough = true })
hi("@markup.underline", { underline = true })
hi("@markup.heading", { fg = colors.purple, bold = true })
hi("@markup.link", { fg = colors.cyan, underline = true })
hi("@markup.link.label.markdown_inline", { fg = colors.bright_cyan, bold = true })

-- Diff
hi("@diff", { fg = colors.bright_black })
hi("@diff.plus", { fg = colors.green })
hi("@diff.minus", { fg = colors.red })
hi("@diff.delta", { fg = colors.yellow })

-- Python specific (important for proper highlighting)
hi("@variable.python", { fg = colors.cyan })
hi("@variable.member.python", { fg = colors.bright_red })  -- .index, .columns, .values
hi("@function.call.python", { fg = colors.bright_blue })   -- function calls
hi("@function.method.call.python", { fg = colors.bright_blue })  -- .pct_change(), .pivot()
hi("@function.builtin.python", { fg = colors.yellow, bold = true })  -- print, len, etc
hi("@module.python", { fg = colors.blue })                 -- pd, np, pf
hi("@module.builtin.python", { fg = colors.blue })
hi("@type.python", { fg = colors.purple })                 -- DataFrame, etc
hi("@type.builtin.python", { fg = colors.purple })         -- int, str, list, etc
hi("@keyword.python", { fg = colors.purple, bold = true })
hi("@keyword.operator.python", { fg = colors.purple })     -- and, or, not, in, is
hi("@keyword.import.python", { fg = colors.purple })       -- import, from
hi("@keyword.return.python", { fg = colors.purple, bold = true })
hi("@keyword.repeat.python", { fg = colors.purple, bold = true })  -- for, while
hi("@keyword.conditional.python", { fg = colors.purple, bold = true })  -- if, elif, else
hi("@attribute.python", { fg = colors.bright_purple })     -- decorators @
hi("@attribute.builtin.python", { fg = colors.bright_purple })
hi("@constructor.python", { fg = colors.purple })          -- Class()
hi("@constant.builtin.python", { fg = colors.bright_yellow })  -- True, False, None
hi("@punctuation.delimiter.python", { fg = colors.bright_white })  -- . , :
hi("@punctuation.bracket.python", { fg = colors.bright_white })    -- () [] {}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "acme"

local bg = "#ffffea"
local fg = "#000000"
local cterm_bg = 230
local cterm_fg = 232

local highlights = {
    Normal = { bg = bg, fg = fg, ctermbg = cterm_bg, ctermfg = cterm_fg },
    NonText = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
    StatusLine = { bg = "#aeeeee", fg = fg, ctermbg = 159, ctermfg = cterm_fg },
    StatusLineNC = { bg = "#eaffff", fg = fg, ctermbg = 194, ctermfg = cterm_fg },
    WildMenu = { bg = fg, fg = "#eaffff", ctermbg = 0, ctermfg = 159 },
    VertSplit = { bg = bg, fg = fg, ctermbg = 159, ctermfg = cterm_fg },
    Folded = { bg = "#cccc7c", fg = fg, italic = true, ctermbg = 187, ctermfg = cterm_fg, cterm = { italic = true } },
    FoldColumn = { bg = "#fcfcce", fg = fg, ctermbg = 229, ctermfg = cterm_fg },
    Conceal = { bg = bg, fg = fg, ctermbg = cterm_bg, ctermfg = cterm_fg },
    LineNr = { bg = bg, fg = "#505050", italic = true, ctermbg = cterm_bg, ctermfg = 239, cterm = { italic = true } },
    Visual = { bg = fg, fg = bg, ctermbg = cterm_fg, ctermfg = cterm_bg },
    CursorLine = { bg = "#ffffca", fg = fg, ctermbg = 230, ctermfg = cterm_fg },
    Pmenu = { bg = bg, fg = fg, ctermbg = cterm_bg, ctermfg = cterm_fg },
    PmenuSel = { bg = fg, fg = bg, ctermbg = cterm_fg, ctermfg = cterm_bg },

    Statement = { bg = bg, fg = fg, italic = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { italic = true } },
    Identifier = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
    Type = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
    PreProc = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
    Constant = { bg = bg, fg = "#101010", bold = true, ctermbg = cterm_bg, ctermfg = 233, cterm = { italic = true } },
    Comment = { bg = bg, fg = "#303030", italic = true, ctermbg = cterm_bg, ctermfg = 236, cterm = { italic = true } },
    Special = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
    SpecialKey = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
    Directory = { bg = bg, fg = fg, bold = true, ctermbg = cterm_bg, ctermfg = cterm_fg, cterm = { bold = true } },
}

for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end

local links = {
    Title = "Directory",
    MoreMsg = "Comment",
    Question = "Comment",
    vimFunction = "Identifier",

    ["@variable"] = "Identifier",
    ["@function"] = "Identifier",
    ["@keyword"] = "Statement",
    ["@string"] = "Constant",
    ["@number"] = "Constant",
    ["@type"] = "Type",
    ["@property"] = "Identifier",
    ["@comment"] = "Comment",
    ["@operator"] = "Normal",
    ["@punctuation"] = "Normal",
}

for new_group, old_group in pairs(links) do
    vim.api.nvim_set_hl(0, new_group, { link = old_group })
end

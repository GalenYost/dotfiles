-- plugins
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.nvim' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',       version = 'main' },
    { src = 'https://github.com/stevearc/oil.nvim.git' },
    { src = 'https://github.com/rebelot/kanagawa.nvim' },
})

require 'options'
require 'lsp'

-- kanagawa
require 'kanagawa'.setup {
    compile = false,
    commentStyle = { italic = false },
    keywordStyle = { italic = false },
    statementStyle = { bold = false },
    theme = "dragon",
    background = {
        dark = "dragon",
        light = "lotus"
    },
    overrides = function (colors)
        local theme = colors.theme
        local editor_bg = theme.ui.bg

        return {
            LineNr = { bg = editor_bg },
            CursorLineNr = { bg = editor_bg },
            SignColumn = { bg = editor_bg },

            -- mini completion
            Pmenu = { bg = editor_bg, fg = theme.ui.fg },
            PmenuSel = { bg = theme.ui.bg_p1, fg = theme.ui.fg_bold },
            PmenuKind = { bg = editor_bg, fg = theme.ui.fg_dim },
            PmenuKindSel = { bg = theme.ui.bg_p1, fg = theme.ui.fg_bold },
            PmenuExtra = { bg = editor_bg, fg = theme.ui.fg_dim },
            PmenuSbar = { bg = editor_bg },
            PmenuThumb = { bg = theme.ui.bg_p1 },
        }
    end,
}

vim.cmd.colorscheme 'kanagawa'

-- oil
function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then return vim.fn.fnamemodify(dir, ":~")
    else return vim.api.nvim_buf_get_name(0)
    end
end

require 'oil'.setup {
    default_file_explorer = true,
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    delete_to_trash = false,
    skip_confirm_for_simple_edits = false,
    view_options = {
        show_hidden = true,
    },
    win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
    },
    keymaps = {
        ["yp"] = {
            desc = "Yank current directory path",
            callback = function()
                local dir = require("oil").get_current_dir()
                if dir then
                    vim.fn.setreg('"', dir)
                    vim.fn.setreg('+', dir)
                    vim.notify("Yanked: " .. dir, vim.log.levels.INFO, { title = "oil.nvim" })
                else
                    vim.notify("No directory found", vim.log.levels.WARN, { title = "oil.nvim" })
                end
            end,
        },
    },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>')

-- fzf
vim.keymap.set("n", "<leader>f", require 'fzf-lua'.files, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>g", require 'fzf-lua'.live_grep, { silent = true, noremap = true })

-- mini
require 'mini.misc'.setup_termbg_sync()
require 'mini.misc'.setup_restore_cursor()
require 'mini.comment'.setup {
    mappings = {
        comment_line = "<leader>c",
        comment_visual = "<leader>c",
    },
}

require('mini.completion').setup {
    delay = { info = 100000000 },
    lsp_completion = {
        auto_setup = true,
    },
    window = {
        info = { border = 'solid' },
        signature = { border = 'solid' },
    },
}

-- tree-sitter
require 'nvim-treesitter'.setup {
    ensure_installed = {
        'c', 'cpp', 'lua',
        'java',
        'json', 'rust', 'zig',
        'html', 'css', 'markdown',
        'svelte', 'javascript',
        'typescript',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
}

-- keybinds

-- bind nohlsearch to ESC
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch)

-- indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- autocmd
-- no autocomment on new line
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_autocomment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end
})

-- remove search highlight on insert/cmdline enter
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
    callback = vim.schedule_wrap(function()
        vim.cmd.nohlsearch()
    end),
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "svelte",
        "prisma",
        "javascript",
        "typescript",
        "java",
    },
    callback = function()
        vim.treesitter.start()
    end,
})

-- lsp
require "tiny-inline-diagnostic".setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = { "utf-16" }

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_markers = { ".git", ".clang-format", "compile_commands.json" },
})
vim.lsp.enable("clangd")

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { "*.lua" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})
vim.lsp.enable("lua_ls")

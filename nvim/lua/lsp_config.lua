-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local lspkind = require('lspkind')

local lsp = require('lspconfig')
local types = require("cmp.types")
local str = require("cmp.utils.str")
local cmp = require('cmp')
cmp.setup({
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    experimental = { native_menu = false, ghost_text = false },
    formatting = {
        format = lspkind.cmp_format({
            before = function(entry, vim_item)
                local word = entry:get_insert_text()
                if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                    word = vim.lsp.util.parse_snippet(word)
                end
                word = str.oneline(word)
                if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                    word = word .. " ..."
                end
                vim_item.abbr = word
                return vim_item
            end
        })
    },
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = { winhightligth = "Normal:Pmenu, FloatBorder:Pmenu, Search:None",
            col_offset = 3,
            side_padding = 0 },
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip', option = { show_autosnippets = true } }, -- For luasnip users.
        { name = 'buffer' }
    }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local flags = { debounce_text_changes = 150 }
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>r', vim.diagnostic.setloclist, opts)

-- vim.diagnostic.configuration
vim.diagnostic.config(
    {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
    }
)

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
    bind = true,
    handler_opts = {
        border = "double",
    },
    floating_window_above_cur_line = true,
    floating_window_off_x = 10,
    floating_window_off_y = 10,
    hint_prefix = "☛  "
}

local custom_attach = function()
    vim.api.nvim_buf_set_option(vim.api.nvim_get_current_buf(), 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)
    vim.keymap.set('v', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space><F3>', '<cmd>lua vim.lsp.buf.format({timeout_ms = 10000})<CR>', bufopts)
    vim.keymap.set('v', '<space><F2>', '<cmd>lua vim.lsp.buf.format({timeout_ms = 10000})<CR>', bufopts)
    -- require('highlighting').setup(vim.lsp.get_active_clients()[1].server_capabilities)
    vim.o.updaterime = 50
    require('diagnostic_float').init()
end

local signs = { Error = "✘", Warn = "⚠ ", Hint = "☛ ", Info = "🛈 " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp.pylsp.setup { on_attach = custom_attach,
    cmd = { "pylsp", "-v", "--log-file", "/tmp/nvim-pylsp.log" },
    capabilities = capabilities,
    flags = flags,
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                pycodestyle = { maxLineLength = 100, enabled = false },
                pylint = { enabled = false },
                pylsp_mypy = { enabled = true, live_mode = true, strict = true },
                yapf = { enabled = true },
                ruff = {enabled = true, lineLength = 100, config = "/home/oscar/ruff.toml"},
                rope_autoimport = {enabled = true}

            }
        }
    }
}

lsp.lua_ls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

lsp.tsserver.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = flags,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = { hostInfo = "neovim" },
    root_dir = function() return vim.loop.cwd()
    end
})


lsp.clangd.setup({
    on_attach = custom_attach,
    cmd = { "clangd-15" }
})

lsp.gopls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = flags,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                nilness = true,
                useany = true,
                unusedwrite = true,
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    }
})

lsp.html.setup {
    capabilities = capabilities
}



local status, null_ls = pcall(require, "null-ls")
if (not status) then return end
null_ls.register( { sources = { null_ls.builtins.formatting.prettierd } })
local status, prettier = pcall(require, "prettierd")
if (not status) then return end

prettier.setup({
    bin = 'prettierd',
    filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less",
    }

})

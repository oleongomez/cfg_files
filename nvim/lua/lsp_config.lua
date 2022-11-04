vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local lspkind = require('lspkind')

local lsp = require('lspconfig')

local cmp = require('cmp')
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            cb = function(entry, vim_item)
                local word = entry.get_insert_text()
                if entry.completion_item.insertTextFormat == vim.types.lsp.insertTextFormat.Snippet then
                    word = vim.lsp.util.parse_snippet(word)
                end
                word = str.oneline(word)
                if entry.completion_item.insertTextFormat == vim.types.lsp.insertTextFormat.Snippet then
                    word = word .. "->"
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
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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
        { name = 'vsnip' }, -- For vsnip users.
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
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
local custom_attach = function()
    vim.api.nvim_buf_set_option(vim.api.nvim_get_current_buf(), 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
    vim.keymap.set('n', '<leader><F3>', vim.lsp.buf.format, bufopts)
    vim.keymap.set('v', '<leader><F2>', vim.lsp.buf.format, bufopts)
end

local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "♣" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp.pylsp.setup { on_attach = custom_attach,
    cmd = {"pylsp", "-v", "--log-file", "/tmp/nvim-pylsp.log"},
    capabilities = capabilities,
    flags = flags,
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                pycodestyle = { maxLineLength = 100, enabled = true },
                pylint = { enabled = false },
                pylsp_mypy = { enabled = true, live_mode = true, strict = true },
                yapf = { enabled = true }

            }
        }
    }
}

require 'lspconfig'.sumneko_lua.setup {
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

require 'lspconfig'.tsserver.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = flags,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = { hostInfo = "neovim" }
})


local lspconfig = require 'lspconfig'
lspconfig.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math" };
        };
    }
}
require 'lspconfig'.ccls.setup {}
require 'lspconfig'.gopls.setup({
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
require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
})

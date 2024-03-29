require("plugins").setup()
require("lsp_config")

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoread = true
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--vim.opt.backspace=2
vim.opt.spell = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.undofile = true
vim.wo.signcolumn = 'yes'
vim.o.termguicolors = true
-- Key Mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<c-h>", "<c-w><c-h>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-j>", "<c-w><c-j>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-k>", "<c-w><c-k>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-l>", "<c-w><c-l>", { noremap = true })

vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>qa", ":qa<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>qq", ":q!<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<cr>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<cr>==", { noremap = true })

vim.api.nvim_set_keymap("v", "<leader>j", ":m '>+1<cr>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>k", ":m '<-2<cr>gv=gv", { noremap = true })

--clipboard
vim.opt.clipboard['unnamed'] = plus

-- Color scheme
vim.cmd "colorscheme nord"

-- tree-sitter modules
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "rust", "python", "jsonnet", "yaml", "go", "bash", "cpp", "css", "javascript", "typescript" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "lua" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        --    disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

require("telescope").setup { defaults = { file_ignore_patterns = { ".git", ".pylint_cache", ".mypy_cache",
    ".pytest_cache", "__pycache__" } } }
-- Telescope keybindings
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fe", ":Telescope file_browser hidden=true<CR>", { noremap = true })

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'filename', path = 1 } },
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

local disable_filetype = { "TelescopePrompt" }
local disable_in_macro = false -- disable when recording or executing a macro
local disable_in_visualblock = false -- disable when insert after visual block mode
local ignored_next_char = [=[[%w%%%'%[%"%.]]=]
local enable_moveright = true
local enable_afterquote = true -- add bracket pairs after quote
local enable_check_bracket_line = true --- check bracket in same line
local enable_bracket_in_quote = true --
local enable_abbr = false -- trigger abbreviation
local break_undo = true -- switch for basic rule break undo sequence
local check_ts = false
local map_cr = true
local map_bs = true -- map the <BS> key
local map_c_h = false -- Map the <C-h> key to delete a pair
local map_c_w = false -- map <c-w> to delete a pair if possible


local vimspector_conf = require('vimspector_conf')
vim.api.nvim_set_keymap("n", "<leader><F4>", '<cmd>lua require("vimspector_conf").generate_debug_profile()<CR>',
    { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vR", '<cmd> call vimspector#RunToCursor()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vc", '<cmd> call vimspector#Continue()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vi", '<cmd> call vimspector#StepInto()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vo", '<cmd> call vimspector#StepOver()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vs", '<cmd> call vimspector#Launch()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vt", '<cmd> call vimspector#ToogleBreakpoint()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vu", '<cmd> call vimspector#StepOut()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vS", '<cmd> call vimspector#Stop()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vr", '<cmd> call vimspector#Restart()<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vx", '<cmd>VimspectorReset<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vH", '<cmd>lua require("vimspector_conf").toogle_human_mode()<CR>',
    { noremap = true })
require("luasnip.loaders.from_vscode").lazy_load()

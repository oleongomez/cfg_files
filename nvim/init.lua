require("plugins").setup()
require("lsp_config")

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop=4      
vim.opt.shiftwidth=4
vim.opt.autoread = true
--vim.opt.backspace=2
vim.opt.spell = true
vim.opt.nu =  true
vim.opt.rnu =  true
vim.opt.undofile = true

-- Key Mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n","<c-h>","<c-w><c-h>",{noremap = true})
vim.api.nvim_set_keymap("n","<c-j>","<c-w><c-j>",{noremap = true})
vim.api.nvim_set_keymap("n","<c-k>","<c-w><c-k>",{noremap = true})
vim.api.nvim_set_keymap("n","<c-l>","<c-w><c-l>",{noremap = true})

vim.api.nvim_set_keymap("n",";",":",{noremap = true})

vim.api.nvim_set_keymap("n","<leader>w",":w<cr>",{noremap = true})
vim.api.nvim_set_keymap("n","<leader>q",":q<cr>",{noremap = true})


vim.api.nvim_set_keymap("n","<F3>",":set hlsearch!<cr>",{noremap = true})
vim.api.nvim_set_keymap("n","<F2>",":buffers<CR>:buffer<space>",{noremap = true})

vim.api.nvim_set_keymap("n","<leader>j",":m .+1<cr>==",{noremap = true})
vim.api.nvim_set_keymap("n","<leader>k",":m .-2<cr>==",{noremap = true})

vim.api.nvim_set_keymap("v","<leader>j",":m '>+1<cr>gv=gv",{noremap = true})
vim.api.nvim_set_keymap("v","<leader>k",":m '<-2<cr>gv=gv",{noremap = true})

vim.api.nvim_set_keymap("n","<leader>s",":CtrlP ./<cr><c-d>",{noremap = true}) 

-- Color scheme
vim.cmd "colorscheme everforest"

-- tree-sitter modules
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python", "json", "yaml", "go", "bash", "cpp", "css" , "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
--  ignore_install = { "javascript" },

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

-- Telescope keybindings
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", {noremap = true})

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

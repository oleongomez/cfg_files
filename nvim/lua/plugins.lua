local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end

    -- Plugins
    local function plugins(use)
        -- LSP
        local use = require('packer').use
        require('packer').startup(function()
            use({ 'jose-elias-alvarez/null-ls.nvim' })
            use('MunifTanjim/prettier.nvim')
            use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
            use { "williamboman/nvim-lsp-installer" }
            use { "ray-x/lsp_signature.nvim", }
            use {
                "puremourning/vimspector",
                cmd = { "VimspectorInstall", "VimspectorUpdate" },
                fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
                config = function()
                    require("config.vimspector").setup()
                end,
            }
            use 'wbthomason/packer.nvim' -- Package manager
            use { 'neovim/nvim-lspconfig' } -- Configurations for Nvim LSP
            use { 'oleongomez/vim-commenter' }
            use { 'tpope/vim-surround' }
            use { 'hrsh7th/cmp-nvim-lsp' }
            use { 'hrsh7th/cmp-buffer' }
            use { 'hrsh7th/cmp-path' }
            use { 'hrsh7th/cmp-cmdline' }
            use { 'hrsh7th/nvim-cmp' }
            use { 'hrsh7th/cmp-vsnip' }
            --use { 'hrsh7th/vim-vsnip' }
            --use { 'hrsh7th/vim-vsnip-integ' }
            use { 'nvim-treesitter/nvim-treesitter',
                run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
            use { 'kyazdani42/nvim-web-devicons' }
            use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
            use { 'tell-k/vim-autopep8' }
            use {
                'nvim-telescope/telescope.nvim', branch = 'master',
                requires = { { 'nvim-lua/plenary.nvim' } }
            }
            use {
                "windwp/nvim-autopairs",
                config = function() require("nvim-autopairs").setup({
                        disable_filetype = { "TelescopePrompt" },
                        disable_in_macro = false, -- disable when recording or executing a macro,
                        disable_in_visualblock = false, -- disable when insert after visual block mode,
                        ignored_next_char = [=[[%w%%%'%[%"%.]]=],
                        enable_moveright = true,
                        enable_afterquote = true, -- add bracket pairs after quote,
                        enable_check_bracket_line = true, --- check bracket in same line,
                        enable_bracket_in_quote = true, --,
                        enable_abbr = false, -- trigger abbreviation,
                        break_undo = true, -- switch for basic rule break undo sequence,
                        check_ts = false,
                        map_cr = true,
                        map_bs = true, -- map the <BS> key,
                        map_c_h = false, -- Map the <C-h> key to delete a pair,
                        map_c_w = false -- map <c-w> to delete a pair if possible,
                    })
                end
            }
            use { 'saadparwaiz1/cmp_luasnip' }
            use "rafamadriz/friendly-snippets"
            use "onsails/lspkind-nvim"
            use 'shaunsingh/nord.nvim'
            use { "nvim-telescope/telescope-file-browser.nvim" }
            use { "f-person/git-blame.nvim" }
            use {
                "startup-nvim/startup.nvim",
                config = function()
                    require("startup").setup{
                        theme = "evil",
  options = {
      mapping_keys = true, -- display mapping (e.g. <leader>ff)

      -- if < 0 fraction of screen width
      -- if > 0 numbers of column
      cursor_column = 0.5,

      empty_lines_between_mappings = true, -- add an empty line between mapping/commands
      disable_statuslines = true, -- disable status-, buffer- and tablines
      paddings = {1,2}, -- amount of empty lines before each section (must be equal to amount of sections)
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2", -- the color of folded sections
      -- this can also be changed with the `StartupFoldedSection` highlight group
  },
}
                end,
            }
        end)

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    packer_init()

    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)
end

return M

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- https://github.com/wbthomason/packer.nvim
-- `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'navarasu/onedark.nvim'

    use {
        'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = { { 'nvim-lua/plenary.nvim' } }

    }

    -- use { 'majutsushi/tagbar' }               -- code structure
    use { 'Yggdroot/indentLine' }                -- see indentation
    use { 'windwp/nvim-autopairs' } -- auto close brackets, etc.

    -- use { 'tpope/vim-fugitive' }                 -- git integration
    -- use { 'junegunn/gv.vim' }                    -- commit history
    -- use 'neovim/nvim-lspconfig'                  -- Collection of configurations for built-in LSP client
    -- use 'williamboman/mason.nvim'                -- Manage external editor tooling i.e LSP servers
    -- use 'williamboman/mason-lspconfig.nvim'      -- Automatically install language servers to stdpath

    use {                                        -- filesystem navigation
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'-- filesystem icons
    }
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })
end)

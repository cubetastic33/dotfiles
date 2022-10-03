-- Packer plugins

return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- colorscheme
    use "olimorris/onedarkpro.nvim"
    use {"catppuccin/nvim", as = "catppuccin"}
    -- fish syntax highlighting
    use {"nickeb96/fish.vim", ft = 'fish'}
    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    -- buffer line
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    -- git signs
    use {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim"}

    -- telescope
    use {"nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim"}
    -- brackets
    use "windwp/nvim-autopairs"
    -- autocompletion
    use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
    use "hrsh7th/nvim-cmp" -- Autocompletion plugin
    use "hrsh7th/cmp-buffer" -- Buffer source for nvim-cmp
    use "hrsh7th/cmp-path" -- Paths source for nvim-cmp
    use { "hrsh7th/cmp-nvim-lua", ft = "lua" } -- Lua source for nvim-cmp
    use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
    use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
    use "L3MON4D3/LuaSnip" -- Snippets plugin
    -- language servers
    use "simrat39/rust-tools.nvim"
end)

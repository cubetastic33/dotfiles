-- Packer plugin management

local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd "packadd packer.nvim"
end

return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- colorscheme
    use "tjdevries/colorbuddy.nvim"
    use "Th3Whit3Wolf/one-nvim"
    -- icons
    use "kyazdani42/nvim-web-devicons"
    -- status line
    use "famiu/feline.nvim"
    use {
        "hoob3rt/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    -- buffer line
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    -- git signs
    use {
	"lewis6991/gitsigns.nvim",
	requires = "nvim-lua/plenary.nvim",
	config = function()
            require('gitsigns').setup()
    	end
    }
    -- language servers
    use "neovim/nvim-lspconfig"
    use "simrat39/rust-tools.nvim"
    use "latex-lsp/texlab"
    -- autocompletion
    use {"ms-jpq/coq_nvim", branch = "coq"}
    use {"ms-jpq/coq.artifacts", branch = "artifacts"}
end)

-- Main neovim config file

require "plugins"
require "keymaps"
require "autocommands"
-- require "statusline"

-- global options
vim.o.shell = "sh"  -- set shell to sh because we need POSIX compliance for some features
vim.o.fillchars = "eob: "

-- window-local options
vim.wo.number = true  -- current line will show the absolute line number
vim.wo.relativenumber = true  -- other lines will show relative line numbers

-- buffer-local options
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

-- colorscheme
vim.opt.termguicolors = true
vim.g.colors_name = "one-nvim"
-- transparent background
vim.g.one_nvim_transparent_bg = true
vim.cmd "au VimEnter * highlight SignColumn guibg=0"
vim.cmd "au VimEnter * highlight CursorLineNr guibg=0"

-- status line
require "lualine".setup{options = {theme = "horizon"}}

-- buffer line
require "bufferline".setup{
    options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
    }
}

-- language servers
require "rust-tools".setup{}
local lsp = require "lspconfig"
local coq = require "coq"
lsp.pyright.setup(coq.lsp_ensure_capabilities{})
lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities{})
lsp.clangd.setup(coq.lsp_ensure_capabilities{})
lsp.texlab.setup(coq.lsp_ensure_capabilities{
    settings = {
        texlab = {
            build = {
                args = {"%f", "--synctex", "--keep-logs", "--keep-intermediates"},
                executable = "tectonic",
                onSave = true,
            }
        }
    }
})


-- start coq
vim.cmd "autocmd VimEnter * COQnow -s"

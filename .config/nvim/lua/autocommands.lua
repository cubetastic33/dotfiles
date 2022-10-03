-- Autocommands

-- File type associations
local file_associations = vim.api.nvim_create_augroup("file_associations", {})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = file_associations,
    pattern = "*.rasi",
    command = "setf css",
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = file_associations,
    pattern = "*.tera",
    command = "setf html",
})

-- Set tab width to 2 spaces for certain file types
local tab_length = vim.api.nvim_create_augroup("tab_length", {})
vim.api.nvim_create_autocmd({"FileType"}, {
    group = tab_length,
    pattern = "html,css,scss,javascript*,typescript*",
    command = "setlocal sw=2 sts=2 expandtab",
})

-- Run :PackerCompile whenever plugins.lua is updated
local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    group = packer_user_config,
    pattern = "*plugins.lua",
    command = "source <afile> | PackerCompile",
})

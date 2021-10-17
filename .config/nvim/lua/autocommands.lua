-- Autocommands

-- File type associations
vim.cmd([[
    au BufNewFile,BufRead /*.rasi setf css
    au BufNewFile,BufRead /*.tera setf html
]])

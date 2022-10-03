-- Keymaps

local map = vim.api.nvim_set_keymap
noremap = { noremap = true }

-- map jk to go to normal mode from insert mode
map("i", "jk", "<Esc>", {})

-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " "

-- clear search result highlights
map("n", "<leader><Esc>", ":nohlsearch<cr>", noremap)
-- buffer navigation
map("n", "<leader>n", ":bnext<cr>", noremap)
map("n", "<TAB>", ":bnext<cr>", noremap)
map("n", "<leader>p", ":bprev<cr>", noremap)
map("n", "<S-TAB>", ":bprev<cr>", noremap)
map("n", "<leader>q", ":bd<cr>", noremap)
-- map leader w to write
map("n", "<leader>w", ":w<cr>", noremap)
-- map ctrl + c to copy selection to system clipboard
map("v", "<C-c>", "\"+y", noremap)
-- redo macro 'q'
map("n", "<leader>r", "@q", noremap)

-- telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", noremap)
map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", noremap)
map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", noremap)
map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", noremap)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", noremap)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", noremap)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", noremap)

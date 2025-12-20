-- Core editor keymaps (non-plugin specific)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<space>ae", ":!ansible-vault encrypt %<CR>", { desc = "[A]nsible [E]ncrypt" })
vim.keymap.set("n", "<space>ad", ":!ansible-vault decrypt %<CR>", { desc = "[A]nsible [D]ecrypt" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix" })

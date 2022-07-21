local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>hh", "<cmd>lua require('harpoon.mark').toggle_quick_menu()<CR>", opts)
keymap("n", "J", "<cmd>lua require('harpoon.mark').nav_next()<CR>", opts)
keymap("n", "<leader>hh", "<cmd>lua require('harpoon.mark').nav_prev()<CR>", opts)

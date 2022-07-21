local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "J", "<cmd>lua require('harpoon.ui').nav_next()<CR>", opts)
keymap("n", "F", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", opts)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- insert mode
keymap("i", "jk", "<ESC>", opts)

-- debugging plugin
keymap("n", "tb", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "tc", "<Cmd>lua require("dap").continue()<CR>")


local toggleterm = require("user.toggleterm")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local key = U.make_key({ noremap = true, silent = true })

-- insert mode
key("i", "jk", "<esc>")

-- debugging plugin
key("n", "tb", "<Cmd>lua require('dap').toggle_breakpoint()<CR>")
key("n", "tc", "<Cmd>lua require('dap').continue()<CR>")

-- terminal
key("n", "<leader>tt", toggleterm.toggleDefault)

filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
filetype plugin on

call plug#begin()
" better look
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Colorschemes
Plug 'rakr/vim-one'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'tobi-wan-kenobi/zengarden'

" Lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

" Misc helper stuff
Plug 'windwp/nvim-autopairs'
Plug 'ojroques/nvim-bufdel'
Plug 'karb94/neoscroll.nvim'

" Auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

set termguicolors
lua << EOF
require('nvim-autopairs').setup{}
require('neoscroll').setup()
local colors = {
  bg = '#282828',
  black = '#282828',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}
require("bufferline").setup{}
require('feline').setup({
    theme = colors,
})

EOF

set completeopt=menu,menuone,noselect

colorscheme one

lua <<EOF
local dap = require("dap")
local dapui = require("dapui")
dapui.setup({
    icons = { collapsed = "⮞", expanded = "⮟" },
    sidebar = {
        elements = {
            { id = "breakpoints", size = 0.1 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.1 },
            { id = "scopes", size = 0.55 },
        },
        size = 44,
        tray = {
            size = 8,
        },
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.python = {
    type = "executable";
    command = "python";
    args = { "-m", "debugpy.adapter" };
}
dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";

        program = "/home/user/Rare/rare/__main__.py";
        pythonPath = "/usr/bin/python";
    },
}
EOF

lua << EOF

require("lsp")
require("options")

EOF

let mapleader = " "

vnoremap <S-k> <Cmd>lua require("dapui").eval()<CR>
nnoremap tb <Cmd>lua require("dap").toggle_breakpoint()<CR>
nnoremap tc <Cmd>lua require("dap").continue()<CR>
nnoremap tt <Cmd>lua require("dap").step_over()<CR>
nnoremap ti <Cmd>lua require("dap").step_into()<CR>
nnoremap tq <Cmd>lua require("dap").terminate()<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-s> :w<CR>
nnoremap <TAB> :BufferLineCycleNext<CR>
nnoremap <S-Tab> :BufferLineCyclePrev<CR>
nnoremap <silent><S-t> :tabnew<CR>
nnoremap <silent><leader>x :BufDel<CR>

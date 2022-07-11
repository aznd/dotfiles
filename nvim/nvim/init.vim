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

" For debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Terminal
Plug 'akinsho/toggleterm.nvim'

call plug#end()

colorscheme onedarker

lua << EOF

require("user.options")
require("user.utils")
require("user.lsp")
require("user.keys")
require("user.toggleterm")
require("user.dap")
require'nvim-tree'.setup()
require('nvim-autopairs').setup{}
require('neoscroll').setup()
require("bufferline").setup{}
require('feline').setup()

EOF

let mapleader = " "

vnoremap <S-k> <Cmd>lua require("dapui").eval()<CR>
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
nnoremap <C-n> :NvimTreeFocus<CR>
nnoremap <C-s> :w<CR>
nnoremap <TAB> :BufferLineCycleNext<CR>
nnoremap <S-Tab> :BufferLineCyclePrev<CR>
nnoremap <silent><S-t> :tabnew<CR>
nnoremap <silent><leader>x :BufDel<CR>
nnoremap <C-S-n> :NvimTreeFocus<CR>

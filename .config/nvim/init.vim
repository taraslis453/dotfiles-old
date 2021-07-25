call plug#begin(stdpath('data') . 'vimplug')
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-compe'
    " Plug 'L3MON4D3/LuaSnip' 
    Plug 'rafamadriz/friendly-snippets'
    Plug 'hrsh7th/vim-vsnip'
    " customization theming
    Plug 'mhinz/vim-startify'
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons
    Plug 'ryanoasis/vim-devicons'
    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
    Plug 'romgrk/barbar.nvim'
    Plug 'kevinhwang91/nvim-bqf'
    Plug 'folke/trouble.nvim'

    " syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/playground'
    Plug 'RRethy/nvim-treesitter-textsubjects'
    Plug 'sainnhe/gruvbox-material'
    Plug 'norcalli/nvim-colorizer.lua'

    " text editing, motions
    Plug 'phaazon/hop.nvim'
    Plug 'unblevable/quick-scope'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'tpope/vim-commentary'


    Plug 'tpope/vim-surround'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'andymass/vim-matchup'
    Plug 'psliwka/vim-smoothie'
    Plug 'windwp/nvim-autopairs'
    " Plug 'chaoren/vim-wordmotion'
    "prettier
    Plug 'sbdchd/neoformat'

    " git 
    Plug 'lewis6991/gitsigns.nvim'   
    Plug 'sindrets/diffview.nvim'

    " file navigation
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'  
    Plug 'folke/todo-comments.nvim'

    " buffers 
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'simeji/winresizer'
    Plug 'rmagatti/auto-session'
    Plug 'numToStr/FTerm.nvim'
    Plug 'dosimple/workspace.vim'
    " etc
    Plug 'wakatime/vim-wakatime'
    Plug 'tpope/vim-repeat'
    Plug 'liuchengxu/vim-which-key'
call plug#end()
" TODO snippets, quickfix
source $HOME/.config/nvim/plug-config/barbar.vim
set number " number of line
set hidden
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab "табы пробеламим
set softtabstop=2 "2 пробела в табе
set autoindent
set linebreak
" ignore text case when search
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set noerrorbells
" search when you type
set incsearch
set termguicolors
set updatetime=50
" always the same cursor
set guicursor=
set t_Co=256 "поддержка 256 цветов в терминале
let g:mapleader=","
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
syntax on "syntax higligth

colorscheme gruvbox-material
" transparent bg
" hi Normal guibg=NONE ctermbg=NONE

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set langmap+=ЖжЭэХхЪъ;\:\;\"\'{[}]
set mousehide "hide coursore when type text
set mouse=a "mouse поддержка
set termencoding=utf-8
set encoding=utf-8 " Кодировка файлов по умолчанию
" for system clipboard "+y copy to global 
" +p paste 
set clipboard+=unnamedplus
" leader space
" insert blank line shift enter before current line enter 
nmap <CR> o<Esc>

" quick scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

nnoremap \ :noh<return>
" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(2000, funcref('s:empty_message'))
augroup END

" set leader key to ,
let g:mapleader=","

" >> Telescope bindings
nnoremap <Leader>pp :lua require'telescope.builtin'.builtin{}<CR>

" most recentuly used files
nnoremap <Leader>m :lua require'telescope.builtin'.oldfiles{}<CR>


" find in current buffer
nnoremap <Leader>/ :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' :lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>gf :lua require'telescope.builtin'.git_files{}<CR>

" pick color scheme
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>

nnoremap <space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <space>gs :lua require('telescope.builtin').git_status()<CR>
nnoremap <space>ff <cmd>Telescope find_files<Cr>
nnoremap <space>fg <cmd>Telescope live_grep<Cr>
nnoremap <space>fb <cmd>Telescope buffers<Cr>
nnoremap <space>fh <cmd>Telescope help_tags<Cr>

" formatter on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat prettier
augroup END

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [g <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> ]g <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gi <cmd>lua vim.lsp_organize_imports()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

" neoformat 
nnoremap <silent> gp    <cmd>Neoformat prettier<CR>
lua <<EOF
  require("lsp")
  require("treesitter")
  require("statusbar")
  require("completion")
  require('autopairs')
  require("_telescope")
EOF

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  require("trouble").setup{}
  require'FTerm'.setup({
      dimensions  = {
          height = 0.8,
          width = 0.8,
          x = 0.5,
          y = 0.5
      },
      border = 'single' -- or 'double'
  })

  -- Keybinding
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

local gitui = require 'FTerm.terminal':new():setup{
    cmd = 'gitui',
    dimensions = {height = 0.9, width = 0.9},
}

-- Create LazyGit Terminal
local term = require("FTerm.terminal")
local lazy = term:new():setup({
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle lazygit in a floating terminal
function _G.__fterm_lazygit()
    lazy:toggle()
end
map('n', '<A-l>', '<CMD>lua _G.__fterm_lazygit()<CR>', opts)


EOF
lua << EOF
local opts = {
  log_level = 'info',
  auto_session_enable_last_session = true,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil
}

require('auto-session').setup(opts)
require('nvim-autopairs').setup()
require 'colorizer'.setup()
local status_ok, colorizer = pcall(require, "colorizer")
colorizer.setup({ "*" }, {
  RGB = true, -- #RGB hex codes
  RRGGBB = true, -- #RRGGBB hex codes
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn = true, -- CSS rgb() and rgba() functions
  hsl_fn = true, -- CSS hsl() and hsla() functions
  css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  namess = true, -- "Name" codes like Blue
})
EOF

let g:nvim_tree_auto_open = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_update_cwd = 1 
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_width = 50
" let g:nvim_tree_follow = 1
lua <<EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
      { key = "s",                        cb = tree_cb("vsplit") },
      { key = "i",                        cb = tree_cb("split") },
      { key = "t",                        cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "P",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "<S-CR>",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "K",                            cb = tree_cb("first_sibling") },
      { key = "J",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[g",                           cb = tree_cb("prev_git_item") },
      { key = "]g",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "q",                            cb = tree_cb("close") },
      { key = "g?",                           cb = tree_cb("toggle_help") },
    }
    require'hop'.setup()

    vim.api.nvim_set_keymap('n', 's', ":HopChar2<cr>", {silent = true})
    vim.api.nvim_set_keymap('n', 'S', ":HopWord<cr>", {silent = true})
    require('gitsigns').setup()
    local cb = require'diffview.config'.diffview_callback
    require'diffview'.setup {
      diff_binaries = false,    -- Show diffs for binaries
      file_panel = {
        width = 35,
        use_icons = true        -- Requires nvim-web-devicons
      },
      key_bindings = {
        disable_defaults = false,                   -- Disable the default key bindings
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        view = {
          ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
          ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
          ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
          ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
        },
        file_panel = {
          ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
          ["<down>"]        = cb("next_entry"),
          ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
          ["<up>"]          = cb("prev_entry"),
          ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
          ["o"]             = cb("select_entry"),
          ["<2-LeftMouse>"] = cb("select_entry"),
          ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
          ["S"]             = cb("stage_all"),          -- Stage all entries.
          ["U"]             = cb("unstage_all"),        -- Unstage all entries.
          ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
          ["<tab>"]         = cb("select_next_entry"),
          ["<s-tab>"]       = cb("select_prev_entry"),
          ["<leader>e"]     = cb("focus_files"),
          ["<leader>b"]     = cb("toggle_files"),
        }
      }
}
EOF

nnoremap <C-v> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" let g:wordmotion_nomap = 1
" nmap w          <Plug>WordMotion_w
" nmap b          <Plug>WordMotion_b
" nmap gE         <Plug>WordMotion_gE
" omap aW         <Plug>WordMotion_aW
" cmap <C-R><C-W> <Plug>WordMotion_<C-R><C-W>

nnoremap <leader>do <cmd>DiffviewOpen<cr>
nnoremap <leader>dc <cmd>DiffviewClose<cr>

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" " Jump forward or backward
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
map <silent> <M-1> :WS 1<CR>
map <silent> <M-2> :WS 2<CR>
map <silent> <M-3> :WS 3<CR>
map <silent> <M-4> :WS 4<CR>
map <silent> <M-5> :WS 5<CR>
map <silent> <M-6> :WS 6<CR>
map <silent> <M-7> :WS 7<CR>
map <silent> <M-8> :WS 8<CR>
map <silent> <M-9> :WS 9<CR>
map <silent> <M-0> :WS 10<CR>
imap <M-1> <C-O><M-1>
imap <M-2> <C-O><M-2>
imap <M-3> <C-O><M-3>
imap <M-4> <C-O><M-4>
imap <M-5> <C-O><M-5>
imap <M-6> <C-O><M-6>
imap <M-7> <C-O><M-7>
imap <M-8> <C-O><M-8>
imap <M-9> <C-O><M-9>
imap <M-0> <C-O><M-0>

" Alternate between current and previous workspaces
map <silent> <M-`> :call WS_Backforth()<CR>
imap <M-`> <C-O><M-`>

" Show info line about workspaces
map <silent> <F1> :echo WS_Line()<CR>
imap <F1> <C-O><F1>

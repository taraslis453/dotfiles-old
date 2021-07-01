call plug#begin(stdpath('data') . 'vimplug')
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-compe'
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
    " Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'ap/vim-css-color'

    " text editing, motions
    Plug 'https://github.com/easymotion/vim-easymotion.git'
    Plug 'unblevable/quick-scope'
    Plug 'justinmk/vim-sneak'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'alvan/vim-closetag'
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'andymass/vim-matchup'
    Plug 'psliwka/vim-smoothie'
    Plug 'cohama/lexima.vim'
    "prettier
    Plug 'sbdchd/neoformat'

    " git 
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " file navigation
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'  
    Plug 'folke/todo-comments.nvim'

    " buffers 
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'simeji/winresizer'
    Plug 'rmagatti/auto-session'
    Plug 'numToStr/FTerm.nvim'

    " etc
    Plug 'wakatime/vim-wakatime'
    Plug 'tpope/vim-repeat'
    Plug 'liuchengxu/vim-which-key'
call plug#end()
" TODO snippets, quickfix
source $HOME/.config/nvim/plug-config/vim-closetag.vim
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

"easymotion
" easy motion on one leader trigger
map <Leader> <Plug>(easymotion-prefix)

" quick scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

"vim-sneak
highlight Sneak guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight SneakScope guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
hi! link Sneak Search
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

map gS <Plug>Sneak_,
map gs <Plug>Sneak_;
" Cool prompts
 let g:sneak#prompt = '🕵'
 let g:sneak#prompt = '🔎'

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
nnoremap <Leader>f :lua require'telescope.builtin'.git_files{}<CR>

" pick color scheme
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>

nnoremap <space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
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
EOF
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

let NERDSpaceDelims=1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_hide_dotfiles = 1
lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["<CR>"] = ":YourVimFunction()<cr>",
      ["u"] = ":lua require'some_module'.some_function()<cr>",

      -- default mappings
      ["<CR>"]           = tree_cb("edit"),
      ["o"]              = tree_cb("edit"),
      ["<2-LeftMouse>"]  = tree_cb("edit"),
      ["<2-RightMouse>"] = tree_cb("cd"),
      ["l"]          = tree_cb("cd"),
      ["s"]          = tree_cb("vsplit"),
      ["i"]          = tree_cb("split"),
      ["t"]          = tree_cb("tabnew"),
      ["<"]              = tree_cb("prev_sibling"),
      [">"]              = tree_cb("next_sibling"),
      ["<BS>"]           = tree_cb("close_node"),
      ["<S-CR>"]         = tree_cb("close_node"),
      ["<Tab>"]          = tree_cb("preview"),
      ["I"]              = tree_cb("toggle_ignored"),
      ["H"]              = tree_cb("toggle_dotfiles"),
      ["R"]              = tree_cb("refresh"),
      ["a"]              = tree_cb("create"),
      ["d"]              = tree_cb("remove"),
      ["r"]              = tree_cb("rename"),
      ["<C-r>"]          = tree_cb("full_rename"),
      ["x"]              = tree_cb("cut"),
      ["c"]              = tree_cb("copy"),
      ["p"]              = tree_cb("paste"),
      ["y"]              = tree_cb("copy_name"),
      ["Y"]              = tree_cb("copy_path"),
      ["gy"]             = tree_cb("copy_absolute_path"),
      ["[g"]             = tree_cb("prev_git_item"),
      ["]g"]             = tree_cb("next_git_item"),
      ["-"]              = tree_cb("dir_up"),
      ["q"]              = tree_cb("close"),
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

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk

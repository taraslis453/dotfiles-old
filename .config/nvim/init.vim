call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    " Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'flazz/vim-colorschemes'
    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

    Plug 'nikvdp/neomux'

    Plug 'tpope/vim-ragtag'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'

    Plug 'tomtom/tcomment_vim' 
    Plug 'scrooloose/nerdtree'
    Plug 'https://github.com/easymotion/vim-easymotion.git'
    Plug 'unblevable/quick-scope'
    Plug 'justinmk/vim-sneak'

    Plug 'alvan/vim-closetag'
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'mhinz/vim-startify'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-commentary'
    Plug 'folke/todo-comments.nvim'
    Plug 'wakatime/vim-wakatime'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

    Plug 'psliwka/vim-smoothie'
    Plug 'romgrk/barbar.nvim'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'andymass/vim-matchup'
    Plug 'terryma/vim-expand-region'

    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    Plug 'simeji/winresizer'
    Plug 'styled-components/vim-styled-components'

    Plug 'folke/trouble.nvim'
    Plug 'sbdchd/neoformat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'iamcco/diagnostic-languageserver'
call plug#end()

source $HOME/.config/nvim/plug-config/barbar.vim

source $HOME/.config/nvim/plug-config/nerd-tree.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim
source $HOME/.config/nvim/plug-config/barbar.vim
luafile ~/.config/nvim/plug-config/telescope.lua

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
set noerrorbells
" search when you type
set incsearch
set termguicolors
set updatetime=50
" always the same cursor
set guicursor=
set t_Co=256 "поддержка 256 цветов в терминале
let g:mapleader=","

syntax on "syntax higligth
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

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
" Show folds after exit
augroup AutoSaveFolds
autocmd!
autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
autocmd BufWinEnter ?* silent! loadview
augroup end

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

" find buffer
nnoremap ; :lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' :lua require'telescope.builtin'.marks{}<CR>

" git files
" nnoremap <Leader>f :lua require'telescope.builtin'.git_files{}<CR>

" pick color scheme
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>

nnoremap <space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <space>ff <cmd>Telescope find_files<Cr>
nnoremap <space>fg <cmd>Telescope live_grep<Cr>
nnoremap <space>fb <cmd>Telescope buffers<Cr>
nnoremap <space>fh <cmd>Telescope help_tags<Cr>

" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci :call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci :call NERDComment('n', 'toggle')<CR>


" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [g <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> ]g <cmd>Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <F2>    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>
" open terminal 
nnoremap <silent> <A-t> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> 
" open lazygit 
nnoremap <silent> <A-g> <cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR> 

" alt + esc close 
tnoremap <silent> <A-Esc> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat prettier
augroup END

lua <<EOF
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
EOF

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local nvim_lsp = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {usePlaceholders = true}
}

nvim_lsp.diagnosticls.setup {
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint"
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = {
          ".eslitrc.js",
          "package.json"
        },
        debounce = 100,
        args = {
          "--cache",
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
}

EOF


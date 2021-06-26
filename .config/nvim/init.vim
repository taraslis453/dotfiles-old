call plug#begin(stdpath('data') . 'vimplug')
    " LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'kabouzeid/nvim-lspinstall'
    " Plug 'glepnir/lspsaga.nvim'
    " Plug 'hrsh7th/nvim-compe'

    " customization theming
    Plug 'mhinz/vim-startify'
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'romgrk/barbar.nvim'
    Plug 'folke/trouble.nvim'

    " syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'morhetz/gruvbox'
    Plug 'ap/vim-css-color'
    " TODO remove if work without
    Plug 'styled-components/vim-styled-components'
    " TODO figure out what is it
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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
    " TODO what is it
    Plug 'terryma/vim-expand-region'

    " git 
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " file navigation
    Plug 'scrooloose/nerdtree'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'  
    Plug 'folke/todo-comments.nvim'

    " buffers 
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'simeji/winresizer'

    " etc
    " TODO remove if doesnt used 
    Plug 'tpope/vim-repeat'
    Plug 'wakatime/vim-wakatime'
call plug#end()

source $HOME/.config/nvim/plug-config/coc-nvim.vim
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
let g:gruvbox_contrast_dark = 'hard'
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

let g:airline_theme='base16_gruvbox_dark_hard'

lua <<EOF
-- require("lsp")
require("treesitter")
-- require("statusbar")
-- require("completion")
EOF

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

let NERDSpaceDelims=1

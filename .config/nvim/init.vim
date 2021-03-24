source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/nerd-tree.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim
source $HOME/.config/nvim/plug-config/coc-nvim.vim
source $HOME/.config/nvim/plug-config/barbar.vim
source $HOME/.config/nvim/plug-config/telescope.vim
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

let g:airline_theme='base16_gruvbox_dark_hard'
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

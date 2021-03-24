nnoremap <leader><leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader><leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader><leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader><leader>fh <cmd>Telescope help_tags<cr>

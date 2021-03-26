nnoremap <leader><leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader><leader>ff <cmd>Telescope find_files<Cr>
nnoremap <leader><leader>fg <cmd>Telescope live_grep<Cr>
nnoremap <leader><leader>fb <cmd>Telescope buffers<Cr>
nnoremap <leader><leader>fh <cmd>Telescope help_tags<Cr>

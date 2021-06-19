nnoremap <space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <space>ff <cmd>Telescope find_files<Cr>
nnoremap <space>fg <cmd>Telescope live_grep<Cr>
nnoremap <space>fb <cmd>Telescope buffers<Cr>
nnoremap <space>fh <cmd>Telescope help_tags<Cr>

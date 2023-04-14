vim.cmd [[
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  " augroup vimtex_group
  "   autocmd!
  "   autocmd FileType tex call vimtex#init()
  " augroup end
]]

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*" },
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})

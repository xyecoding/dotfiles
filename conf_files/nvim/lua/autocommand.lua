vim.cmd [[
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  " augroup vimtex_group
  "   autocmd!
  "   autocmd FileType tex vim.cmd 'call vimtex#init()'
  " augroup end
]]

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*" },
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
}
)

lvim.autocommands = {
  {
    "BufEnter", -- see `:h autocmd-events`
    {
      -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.tex" }, -- see `:h autocmd-events`
      command = "call vimtex#init()",
    }
  },
}

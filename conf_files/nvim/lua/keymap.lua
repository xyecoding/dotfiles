-- local _, actions = pcall(require, "telescope.actions")
lvim.keys.insert_mode["<c-l>"] = "<right>"
lvim.keys.normal_mode["0"] = "^"
lvim.keys.insert_mode["jj"] = false
lvim.keys.insert_mode["jk"] = false
lvim.keys.insert_mode["kj"] = false
lvim.keys.normal_mode["<c-p>"] = ":lua require('neoclip.fzf')()<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<c-up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<c-q>"] = ":q<cr>"
-- lvim.builtin.telescope.defaults.mappings = {
--   i = {
--     ["<c-j>"] = actions.move_selection_next,
--     ["<c-k>"] = actions.move_selection_previous,
--     ["<c-n>"] = actions.cycle_history_next,
--     ["<c-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<c-j>"] = actions.move_selection_next,
--     ["<c-k>"] = actions.move_selection_previous,
--   },
-- }


local cmp = require("cmp")
local luasnip = require("luasnip")
local jumpable = require("lvim.core.cmp").methods.jumpable

lvim.builtin.cmp.mapping = {
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if jumpable() then
      luasnip.jump(1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}


-- vim.api.nvim_set_keymap('i', '<S-Tab>', '<cmd>luasnip.jump(-1)<Cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<Tab>', '<cmd>luasnip.jump(1)<Cr>', { noremap = true, silent = true })
-- vim.cmd [[
-- inoremap <silent> <S-Tab> <cmd>luasnip.jump(-1)<Cr>
-- inoremap <silent> <Tab> <cmd>luasnip.jump(1)<Cr>

-- snoremap <silent> <Tab> <cmd>luasnip.jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>luasnip.jump(-1)<Cr>]]

-- lvim.builtin.which_key.mappings["w"] = { "<cmd>w<CR>", "Save" }
-- lvim.builtin.which_key.mappings["q"] = { "<cmd>q<CR>", "Quit" }
-- lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<CR>", "Quit!" }
lvim.builtin.which_key.mappings["so"] = { "<cmd>TodoTelescope<cr>", "TODO" }
lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" }
lvim.builtin.which_key.mappings.s["p"] = { "<CMD>Telescope projects<CR>", "Project" }

-- lvim.builtin.which_key.mappings["p"] = { "<cmd>telescope projects<cr>", "projects" }

lvim.builtin.which_key.mappings["ss"] = {
  name = "+sessions",
  l = { "<cmd>SessionManager load_session<cr>", "Load Session" },
  d = { "<cmd>SessionManager delete_session<cr>", "Delete Session" }
}

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+trouble",
--   r = { "<cmd>trouble lsp_references<cr>", "references" },
--   f = { "<cmd>trouble lsp_definitions<cr>", "definitions" },
--   d = { "<cmd>trouble document_diagnostics<cr>", "diagnostics" },
--   q = { "<cmd>trouble quickfix<cr>", "quickfix" },
--   l = { "<cmd>trouble loclist<cr>", "locationlist" },
--   w = { "<cmd>trouble workspace_diagnostics<cr>", "wordspace diagnostics" },
--   o = { "<cmd>TodoTrouble<cr>", "TODO" }
-- }

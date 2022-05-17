-- local _, actions = pcall(require, "telescope.actions")
lvim.keys.insert_mode["<c-l>"] = "<right>"
lvim.keys.normal_mode["0"] = "^"
lvim.keys.insert_mode["jj"] = false
lvim.keys.insert_mode["jk"] = false
lvim.keys.insert_mode["kj"] = false
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
-- lvim.builtin.cmp.mapping = cmp.mapping.preset.insert({
--   ["<C-k>"] = cmp.mapping.select_prev_item(),
--   ["<C-j>"] = cmp.mapping.select_next_item(),
--   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--   ['<C-f>'] = cmp.mapping.scroll_docs(4),
--   ['<C-Space>'] = cmp.mapping.complete(),
--   ['<C-e>'] = cmp.mapping.abort(),
--   ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   ["<S-Tab>"] = cmp.mapping(function()
--     luasnip.jump(-1)
--   end, {
--     "i",
--     "s",
--   }),
--   ["<Tab>"] = cmp.mapping(function()
--     luasnip.jump(1)
--   end, {
--     "i",
--     "s",
--   }),
-- })

local function jumpable(dir)
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return
  end

  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  local function inside_snippet()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
    return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
  end

  ---sets the current buffer's luasnip to the one nearest the cursor
  ---@return boolean true if a node is found, false otherwise
  local function seek_luasnip_cursor_node()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1
    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    -- exit early if we're past the exit node
    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
          or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      -- Past unmarked exit node, exit early
      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end

      if candidate then
        luasnip.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
      if not ok then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    -- No candidate, but have an exit node
    if exit_node then
      -- to jump to the exit node, seek to snippet
      luasnip.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    -- No exit node, exit from snippet
    snippet:remove_from_jumplist()
    luasnip.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return inside_snippet() and luasnip.jumpable(-1)
  else
    return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
  end
end

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

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["oo"] = { "o<Esc>k", noremap = true, silent = true }, -- insert a new line belowe
    ["OO"] = { "O<Esc>j", noremap = true, silent = true }, -- inert a new line above
    ["<C-j>"] = { ":m .+1<CR>==", noremap = true, silent = true }, -- move current line down
    ["<C-k>"] = { ":m .-2<CR>==", noremap = true, silent = true }, -- move current line up

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["p"] = { '"_dP', noremap = true, silent = true },
    ["<C-j>"] = { ":m '>+1<CR>gv=gv", noremap = true, silent = true }, -- move selected content up
    ["<C-k>"] = { ":m '<-2<CR>gv=gv", noremap = true, silent = true }, -- move selected content down
  },
}

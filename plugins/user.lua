return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      -- require("catppuccin").setup()
      -- vim.api.nvim_command "colorscheme catppuccin"
    end,
  },
  { "tpope/vim-abolish" },
  { "tpope/vim-surround", lazy = false },
  {
    "MattesGroeger/vim-bookmarks",
    ft = { "go", "lua" },
    config = function()
      vim.api.nvim_set_var("bookmark_no_default_key_mappings", 1)
      vim.api.nvim_set_var("bookmark_save_per_working_dir", 1)
      vim.api.nvim_set_var("bookmark_auto_save", 1)
      -- vim.api.nvim_set_var("bookmark_location_list", 1)
      vim.api.nvim_set_var("bookmark_auto_close", 1)
      vim.api.nvim_set_keymap("n", "<F3>", ":BookmarkToggle<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader><F3>", ":BookmarkShowAll<cr>", { noremap = true, silent = true })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup {
        exclude = {
          buftypes = { "terminal", "nofile" },
          filetypes = { "packer", "dashboard", "floatline", "help" },
        },
        scope = {
          enabled = true,
        },
      }
    end,
  },
  { "kana/vim-textobj-user" },
  { "kana/vim-textobj-entire", lazy = false, dependencies = { "kana/vim-textobj-user" } },
  {
    "andymass/vim-matchup",
    commit = "156367e",
    init = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end,
  },
  { "tpope/vim-repeat" },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      }
    end,
  },
  { "folke/lsp-colors.nvim", event = "BufRead" },
  { "simrat39/symbols-outline.nvim", config = function() require("symbols-outline").setup() end },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" },
    -- build = "yay -S glow"
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
,
  },
  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },
  { "fatih/vim-go", ft = { "go" } },
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function() require("lsp-rooter").setup() end,
  },
}

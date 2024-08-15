-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --
  -- [[ LANGUAGE PLUGINS ]]
  --

  --
  -- [[       RUST       ]]
  --

  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup {}
    end,
  },

  --
  -- [[        GO        ]]
  --

  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function()
      require('gopher').setup {}
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  --
  -- [[       JAVA       ]]
  --

  {
    'mfussenegger/nvim-jdtls',
    event = 'BufRead',
  },

  --
  -- [[       TEX        ]]
  --

  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
  {
    'micangl/cmp-vimtex',
  },

  --
  -- [[       ZIG        ]]
  --

  {
    'ziglang/zig.vim',
    event = 'BufRead',
  },

  --
  -- [[ FOLDER EDITOR    ]]
  --

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {}
    end,
  },

  --
  -- [[ VIM PRACTICE     ]]
  --

  {
    'ThePrimeagen/vim-be-good',
    cmd = { 'VimBeGood' },
  },

  --
  -- [[      GIT         ]]
  --

  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },

  --
  -- [[       DAP       ]]
  --

  { 'mfussenegger/nvim-dap' },

  --
  -- [[    SNIPPETS     ]]
  --

  {
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-vsnip',
    'rafamadriz/friendly-snippets',
  },

  --
  -- [[    Autopair     ]]
  --

  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    opts = {},
  },

  --
  -- [[      TMUX       ]]
  --

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}

return {
  {
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    keys = {
      {
        "<leader>oo",
        "<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },
    },
    opts = {}
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clangd",
        "clang-format",
        "codelldb",
        "eslint_d",
        "gopls",
        "java-debug-adapter",
        "jdtls",
        "lua-language-server",
        "prettierd",
        "pyright",
        "rust-analyzer",
        "typescript-language-server",
        "zls"
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      function()
        local M = require "plugins.configs.cmp"
        table.insert(M.sources, { name = "crates"})
        return M
      end,
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-jdtls",
    event = "BufRead"
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      local crates = require("crates")
      crates.setup(crates)
      crates.show()
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function()
      require("gopher").setup()
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy"
  },
  {
    "ziglang/zig.vim",
    event = "BufRead"
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end
  }
}

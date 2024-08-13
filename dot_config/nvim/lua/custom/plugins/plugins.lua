-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
}

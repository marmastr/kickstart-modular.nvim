return {
  {
    'folke/snacks.nvim',
    priority = 10000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = { enabled = true },
      -- input = { enabled = true },
      picker = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      dim = {
        ---@class snacks.dim.Config
        {
          ---@type snacks.scope.Config
          scope = {
            min_size = 5,
            max_size = 20,
            siblings = true,
          },
          -- animate scopes. Enabled by default for Neovim >= 0.10
          -- Works on older versions but has to trigger redraws during animation.
          ---@type snacks.animate.Config|{enabled?: boolean}
          animate = {
            enabled = vim.fn.has 'nvim-0.10' == 1,
            easing = 'outQuad',
            duration = {
              step = 20, -- ms per step
              total = 300, -- maximum duration
            },
          },
          -- what buffers to dim
          filter = function(buf)
            return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ''
          end,
        },
      },
    },
    keys = {
      {
        '<leader>td',
        function()
          if Snacks.dim.enabled then
            require('snacks').dim.disable()
          else
            require('snacks').dim.enable()
          end
        end,
        mode = '',
        desc = '[T]oggle Snacks.Dim',
      },
    },
    config = function()
      require('snacks').setup()
    end,
  },
}

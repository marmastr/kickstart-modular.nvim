return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          '<leader>H',
          function()
            require('harpoon'):list():add()
          end,
          desc = 'Harpoon File',
        },
        {
          '<leader>h',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Harpoon Quick Menu',
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          -- '<leader>' .. i,
          '<leader>' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end
      return keys
    end,
  },
  -- {
  --   'ThePrimeagen/harpoon',
  --   branch = 'harpoon2',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   config = function()
  --     require('harpoon'):setup()
  --   end,
  --   keys = {
  --     {
  --       '<leader>a',
  --       function()
  --         require('harpoon'):list():add()
  --       end,
  --       desc = '[a]dd file to harpoon',
  --     },
  --     {
  --       '<leader>A',
  --       function()
  --         local harpoon = require 'harpoon'
  --         harpoon.ui:toggle_quick_menu(harpoon:list())
  --       end,
  --       desc = 'harpoon quick m[e]nu',
  --     },
  --     {
  --       '<leader>1',
  --       function()
  --         require('harpoon'):list():select(1)
  --       end,
  --     },
  --     {
  --       '<leader>2',
  --       function()
  --         require('harpoon'):list():select(2)
  --       end,
  --     },
  --     {
  --       '<leader>3',
  --       function()
  --         require('harpoon'):list():select(3)
  --       end,
  --     },
  --     {
  --       '<leader>4',
  --       function()
  --         require('harpoon'):list():select(4)
  --       end,
  --     },
  --     -- Toggle previous & next buffers stored within require("harpoon") list
  --     {
  --       '<C-S-P>',
  --       function()
  --         require('harpoon'):list():prev()
  --       end,
  --     },
  --     {
  --       '<C-S-N>',
  --       function()
  --         require('harpoon'):list():next()
  --       end,
  --     },
  --   },
  -- },
}

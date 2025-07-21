return {
  'olimorris/codecompanion.nvim',
  cmd = {
    'CodeCompanion',
    'CodeCompanionActions',
    'CodeCompanionChat',
    'CodeCompanionCmd',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'codecompanion' },
    },
  },
  keys = {
    { '<leader>ap', ':CodeCompanion<CR>', desc = 'Open CodeCompanion' },
    { '<leader>ac', ':CodeCompanionChat<CR>', desc = 'Open CodeCompanion Chat' },
    { '<leader>aa', ':CodeCompanionActions<CR>', desc = 'Open CodeCompanion Actions' },
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'gemini',
      },
      inline = {
        adapter = 'gemini',
      },
    },
    gemini = function()
      return require('codecompanion.adapters').extend('gemini', {
        schema = {
          model = {
            -- default = 'gemini-2.5-flash-preview-05-20',
            default = 'gemini-2.5-flash',
            temperature = 0.7,
            max_tokens = 1048576,
            top_p = 0.9,
          },
        },
        env = {
          -- api_key = 'GEMINI_API_KEY',
          api_key = os.getenv 'GEMINI_API_KEY',
        },
      })
    end,
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = 'Prompt ', -- Prompt used for interactive LLM calls
        provider = 'default', -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
        opts = {
          show_default_actions = true, -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
      diff = {
        provider = 'mini_diff',
      },
      chat = {
        show_settings = true,
      },
    },
  },
}

return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
      keymap = { preset = 'enter' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      completion = {
        menu = {
          auto_show = false,
        },

        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        list = {
          selection = {
            preselect = false,
          }
        },

      },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  }

}

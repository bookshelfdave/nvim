return {
  -- hit enter in normal mode to zoom a buffer
  {
    "nyngwang/NeoZoom.lua",
    config = function()
      require("neo-zoom").setup({
        popup = { enabled = true }, -- this is the default.
        -- NOTE: Add popup-effect (replace the window on-zoom with a `[No Name]`).
        -- EXPLAIN: This improves the performance, and you won't see two
        --          identical buffers got updated at the same time.
        -- popup = {
        --   enabled = true,
        --   exclude_filetypes = {},
        --   exclude_buftypes = {},
        -- },
        exclude_buftypes = { "terminal" },
        -- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
        winopts = {
          offset = {
            -- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
            --top = 0,
            --left = 0.17,
            width = 1,
            height = 1,
          },
          -- NOTE: check :help nvim_open_win() for possible border values.
          border = "thicc", -- this is a preset, try it :)
        },
        presets = {
          {
            -- NOTE: regex pattern can be used here!
            filetypes = { "dapui_.*", "dap-repl" },
            winopts = {
              offset = { top = 0.02, left = 0.02, width = 0.74, height = 0.25 },
            },
          },
          {
            filetypes = { "markdown" },
            callbacks = {
              function()
                vim.wo.wrap = true
              end,
            },
          },
        },
      })
      vim.keymap.set("n", "<CR>", function()
        vim.cmd("NeoZoomToggle")
      end, { silent = true, nowait = true })
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  }, --

  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.keymap.set("n", "s", ":HopLineStart<cr>", { silent = true })
      vim.keymap.set("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
  {
    "qnighy/lalrpop.vim",
  },
}

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "mbbill/undotree",
    config = function()
      vim.g["undotree_SetFocusWhenToggle"] = 1
      vim.g["undotree_WindowLayout"] = 2
    end,
    keys = {
      { "<C-u>", "<cmd>UndotreeToggle<CR>", "Undo Tree Toggle" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
        keys = {
          {
            "<leader>e",
            "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
            desc = "Telescope File Browser",
          },
        },
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
      { "<leader>B", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
      { "<leader>sB", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find In Buffer" },
      { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Telescope Registers" },
    },

    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-c>"] = "delete_buffer",
            ["<esc>"] = "close",
          },
        },
      },
      extensions = {
        file_browser = {
          --theme = "ivy",
          hijack_netrw = true,
          cwd_to_path = true,
          hidden = true,
          prompt_path = true,
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ss", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      dap_enabled = true,
      name = "3.*",
      path = os.getenv("HOME") .. "/.pyenv/versions/",
      -- auto_refresh = false
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {},
    },
    keys = {
      { "B", mode = { "n", "v" }, require("bufferline").pick },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          function()
            return " " .. os.date("%H:%M:%S")
          end,
        },
      },
    },
  },
  { "nvim-pack/nvim-spectre", enabled = false },
}

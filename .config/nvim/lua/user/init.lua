-- ##############################################################################
-- #      ░█▀█░█▀▀░▀█▀░█▀▄░█▀█░█▀█░█░█░▀█▀░█▄█░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀        #
-- #      ░█▀█░▀▀█░░█░░█▀▄░█░█░█░█░▀▄▀░░█░░█░█░░░█░░░█░█░█░█░█▀▀░░█░░█░█        #
-- #      ░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀        #
-- #~~~~~~~~~~~~~~~~~~~~ author: https://github.com/arifvn ~~~~~~~~~~~~~~~~~~~~~#
-- see : https://github.com/AstroNvim/AstroNvim/blob/a894214df49b96f774a1d1ecd6531213721b86a0/lua/user_example/init.lua#L145-L154
-- ##############################################################################

local config = {
  -- 1 
  -- Configure AstroNvim updates
   updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
  },

  -- 2 
  -- Set colorscheme
  colorscheme = "default_theme",

  -- 3
  -- Override highlight groups in any theme
  highlights = {
    default_theme = function(highlights) -- or a function that returns one
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = "NONE" }
      highlights.TelescopePromptNormal = { fg = C.fg, bg = "NONE" }
      highlights.TelescopeResultsNormal = { fg = C.fg, bg = "NONE" }
      highlights.LightspeedCursor = { fg = '#1E222A', bg = '#D7FA00' }
      highlights.NeoTreeNormal = { fg = C.fg, bg = "NONE" }
      highlights.NeoTreeNormalNC = { fg = C.fg, bg = "NONE" }
      highlights.NeoTreeSignColumn = { fg = C.fg, bg = "NONE" }
      highlights.NeoTreeEndOfBuffer = { fg = C.fg, bg = "NONE" }
      highlights.NeoTreeCursorLine = { fg = C.fg, bg = "NONE" }
      return highlights
    end,
  },

  -- 4 
  -- Set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = false, -- sets vim.opt.relativenumber
      cursorline = false,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      -- tpipeline_statusline = '%!tpipeline#stl#line()'
    },
  },

  -- 5 
  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    colors = {
      bg = "#181F21",
    },
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = false,
      notify = true,
      ["nvim-tree"] = true,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- 6 Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- 7 Configure plugins
  plugins = {
    init = {
      ['mg979/vim-visual-multi'] = { branch = 'master' },
      {'christoomey/vim-tmux-navigator'},
      {'ggandor/lightspeed.nvim'},
      {'vimpostor/vim-tpipeline'},
      {'tpope/vim-surround'},
      {'tpope/vim-repeat'},
      {'dag/vim-fish'},
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
    ["neo-tree"] = {
      enable_git_status = false,
      enable_diagnostics = false,
      default_component_configs = {
        name = {
          use_git_status_colors = false,
        },
      },
      window = {
        width = 28,
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            "__pycache__",
            ".git",
            "dotbot",
            "dotbot-yay"
          },
        },
        follow_current_file = false,
      },
    },
    telescope = {
      defaults = {
        preview = false,
        layout_config = {
          width = 0.57,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<C-n>"] = 'move_selection_next',
            ["<C-p>"] = 'move_selection_previous',
            ["<C-u>"] = 'results_scrolling_up',
            ["<C-d>"] = 'results_scrolling_down',
          },
        }
      },
    },
    ["which-key"] = {
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k", "i" },
        n = { "z", "k", "i", "<leader>" },
      },
    },
    lightspeed = {
      ignore_case = true,
    },
    bufferline = {
      options = {
        show_tab_indicators = false,
        separator_style = "thin",
      },
    },
  },

  -- 8 
  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- 9 
  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- 10 
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- 11
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- 12 Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- 13
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- 14
  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    -- Set key bindings
    map("n", "<C-p>", ":lua require('telescope.builtin').find_files { hidden = true, no_ignore = true }<cr>", opts)
    -- zj and zk to add blank line below and above
    map('n', 'zj', 'o<Esc>k', opts)
    map('n', 'zk', 'O<Esc>j', opts)
    -- copies filepath to clipboard by pressing yf
    map('n', 'yf', ':let @+=expand("%:p")<CR>', opts)
    -- copies pwd to clipboard: command yd
    map('n', 'yd', ':let @+=expand("%:p:h")<CR>', opts)
    -- select all and copy using y + a
    map('n', 'ya', 'gg<S-v>GY<C-c><cmd> :echo "All Copied"<CR>', { silent = false })
    -- map Ctrl-h to delete the previous word in insert mode.
    map('i', '<C-h>', '<Esc>diwi', opts)
    -- map Ctrl-/ to select till the end
    map('n', '<C-_>', 'v$h', opts)
    -- map Ctrl-w to delete current buffer
    map('n', '<C-w>', ':bdelete<CR>', opts)
    -- map a in visual mode to make Camel-Case letters
    vim.cmd [[
        vmap ` <cmd>:s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR><cmd>:nohl<CR><Esc>
    ]]
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })
  end,
}

return config

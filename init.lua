--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
-- https://vimhelp.org/options.txt.html#%27guicursor%27
-- vim.opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:block-CursorInsert,r-cr-o:hor20-Cursor,a:blinkon100'
-- vim.opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,a:blinkon100'

vim.api.nvim_set_hl(0, "CursorInsert", {fg='#cc9900', bg='#FF5733'})
vim.api.nvim_set_option_value("colorcolumn", "80", {})

vim.opt.guicursor = 'i-ci-v:block-CursorInsert-blinkwait300-blinkon200-blinkoff150'
-- function hiCursor() 
--       vim.api.nvim_set_hl(0, "Cursor", {fg='#cc9900', bg='#339966'})
--       vim.api.nvim_set_hl(0, "CursorInsert", {fg='#cc9900', bg='#FF5733'})
--       vim.api.nvim_set_hl(0, "CursorReset", {fg='white', bg='white'})
-- end

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     callback = hiCursor,
-- })

-- function resetHi()
--     vim.opt.guicursor = 'a:ver25-CursorReset,a:blinkon100'
-- end

-- vim.api.nvim_create_autocmd("VimLeave", {
--     pattern = "*",
--     callback = resetHi, 
-- })

local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",
  -- guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20,
  -- Add highlight groups in any theme
  highlights = {
    init = { -- this table overrides highlights in all themes
          Normal = { bg = "#14161A" },
    }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = true, -- sets vim.opt.wrap
    },
    g = {
      guicursor="n-v-c-i:block",
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,
  --
  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["auto-save"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
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

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<A-k>"] = {":set paste<CR>m`o<Esc>``:set nopaste<CR>", desc="insert empty line under"},
      ["<A-j>"] = {":set paste<CR>m`O<Esc>``:set nopaste<CR>", desc="insert empty line above"},
      ["<A-m>"] = {":m .+1<CR>==", desc="move down one line"},
      ["<A-,>"] = {":m .-2<CR>==", desc="move up one line"},
      ["mm"] = {"yy p"},
      -- <A> - alt; <C> - ctrl, <CR> - enter
      -- ["<C-s>"] = {":w!<cr>"},
      -- " duplicate line in normal mode:
      --   nnoremap <C-D> Yp
      --   " duplicate line in insert mode:
        -- inoremap <C-D> <Esc> Ypi
-- nnoremap <A-k> :m .-2<CR>==
-- inoremap <A-j> <Esc>:m .+1<CR>==gi
-- inoremap <A-k> <Esc>:m .-2<CR>==gi
-- vnoremap <A-j> :m '>+1<CR>gv=gv
-- vnoremap <A-k> :m '<-2<CR>gv=gv
-- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- Configure plugins, run :PackerSync after add plugin
  plugins = {
    init = {

        -- ["Xuyuanp/scrollbar.nvim"]={},
        ["lewis6991/gitsigns.nvim"]={
        preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
              },
          },
        ["psliwka/vim-smoothie"]={},
          ["petertriho/nvim-scrollbar"] = {
              show = true,
              show_in_active_only = false,
              set_highlights = true,
              folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
              max_lines = false, -- disables if no. of lines in buffer exceeds this
              hide_if_all_visible = false, -- Hides everything if all lines are visible
              throttle_ms = 100,
              handle = {
                    text = " ",
                    color = nil,
                    color_nr = nil, -- cterm
                    highlight = "CursorColumn",
                    hide_if_all_visible = true, -- Hides handle if all lines are visible
                },
      },
          -- ["ellisonleao/gruvbox.nvim"] = {},
        ["ellisonleao/gruvbox.nvim"] = {
        -- setup must be called before loading the colorscheme
        -- Default options:
        require("gruvbox").setup {
          undercurl = true,
          underline = true,
          bold = false,
          italic = true,
          strikethrough = true,
          invert_selection = false,
          invert_signs = false,
          invert_tabline = false,
          invert_intend_guides = false,
          inverse = true, -- invert background for search, diffs, statuslines and errors
          contrast = "", -- can be "hard", "soft" or empty string
          palette_overrides = {
            -- bright_green = "#990000",
          },
          overrides = {},
          dim_inactive = false,
          transparent_mode = true,
        },
        -- vim.cmd "colorscheme gruvbox",
      },

      -- ["pocco81/auto-save.nvim"] = {},
      -- ["pocco81/auto-save.nvim"] = {
      --     enabled=false
      -- },
 --          enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
 --    execution_message = {
	-- 	message = function() -- message to print on save
	-- 		return ("AutoSave+++: saved at " .. vim.fn.strftime("%H:%M:%S"))
	-- 	end,
	-- 	dim = 0.18, -- dim the color of `message`
	-- 	cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	-- },
 --           trigger_events = {"FocusLost", }, -- vim events that trigger auto-save. See :h events
 --           	-- function that determines whether to save the current buffer or not
	-- -- return true: if buffer is ok to be saved
	-- -- return false: if it's not ok to be saved

-- use({
   ["pocco81/auto-save.nvim"] = {

       -- config = function()
		 require("auto-save").setup {
             -- enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
             enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
			-- your config goes here
			-- or just leave it empty :)
		 }
	-- end
},
-- })
      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
      }
      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
    ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
      -- ensure_installed = { "python" },
    },
  },
  colorscheme = "gruvbox",
  -- LuaSnip Options
  luasnip = {
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
    -- Configure luasnip loaders (vscode, lua, and/or snipmate)
    vscode = {
      -- Add paths for including more VS Code style snippets in luasnip
      paths = {},
    },
  },

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

  -- Customize Heirline options
  heirline = {
    -- -- Customize different separators between sections
    -- separators = {
      -- tab = { "", "" },
    -- },
    -- -- Customize colors for each element each element has a `_fg` and a `_bg`
    -- colors = function(colors)
    --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
    --   return colors
    -- end,
    colors = {
      bg = "#29395A",
      section_bg = "#29395A",
      section_fg = "#00D0FF",
    },
    -- Customize attributes of highlighting in Heirline components
    attributes = {
      -- styling choices for each heirline element, check possible attributes with `:h attr-list`
      git_branch = { bold = false }, -- bold the git branch statusline component
    },
    -- Customize if icons should be highlighted
    icon_highlights = {
      breadcrumbs = true, -- LSP symbols in the breadcrumbs
      file_icon = {
        winbar = true, -- Filetype icon in the winbar inactive windows
        statusline = true, -- Filetype icon in the statusline
      },
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
return config

-- Definir plugins
return {
  -- Añadir oxocarbon.nvim
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      vim.opt.background = "dark" -- O "light" según prefieras
      vim.cmd("colorscheme oxocarbon")

      -- Para fondo transparente, descomenta las siguientes líneas:
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- Asegúrate de que los parsers que necesites estén listados aquí
        ensure_installed = { "c", "lua", "python", "javascript" }, -- Lenguajes que quieres instalar
        highlight = {
          enable = true,              -- false will disable the whole extension
          additional_vim_regex_highlighting = true,
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
  -- Añade otros plugins aquí si es necesario
}
